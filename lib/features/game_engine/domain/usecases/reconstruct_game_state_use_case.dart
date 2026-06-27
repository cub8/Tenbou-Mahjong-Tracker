import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/models/end_type.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/models/event.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/models/game.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/models/game_length.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/models/game_state.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/models/player_role.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/models/player_state.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/models/wind.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/usecases/calculate_payout_use_case.dart';

part "reconstruct_game_state_use_case.g.dart";

class ReconstructGameStateUseCase {
  const ReconstructGameStateUseCase();

  GameState call(Game game, List<Event> events) {
    final points = {
      for (final role in PlayerRole.values) role: game.startingPoints,
    };
    var dealer = PlayerRole.a;
    var roundWind = Wind.east;
    var round = 1;
    var honba = 0;
    var riichiSticks = 0;
    var isFinished = false;

    const calculatePayout = CalculatePayoutUseCase();
    final lastWind = _gameLengthAsWind(game.gameLength);

    final ordered = [...events]..sort((a, b) => a.index.compareTo(b.index));
    for (final event in ordered) {
      // 1. Apply the point transfers and update the riichi-stick pool.
      final result = calculatePayout(
        event: event,
        dealer: dealer,
        riichiSticksOnTable: riichiSticks,
      );
      result.deltas.forEach((role, delta) {
        points[role] = points[role]! + delta;
      });
      riichiSticks = result.riichiSticks;

      // 2. A player driven to zero or below ends the game (if the rule is on).
      if (game.endAtZeroPoints && points.values.any((p) => p <= 0)) {
        isFinished = true;
      }

      // 3. Did the dealer keep their seat?
      final dealerKept = switch (event.endType) {
        EndType.ron ||
        EndType.tsumo => event.winners.any((w) => w.player == dealer),
        EndType.ryuukyoku => event.tenpai.contains(dealer),
        EndType.chonbo => true,
      };

      // 4. Honba.
      switch (event.endType) {
        case EndType.chonbo:
          break; // unchanged
        case EndType.ryuukyoku:
          honba += 1;
        case EndType.ron:
        case EndType.tsumo:
          honba = dealerKept ? honba + 1 : 0;
      }

      // 5. Rotation (only when the dealer changes).
      if (event.endType != EndType.chonbo && !dealerKept) {
        if (round == 4 && roundWind == lastWind) {
          // The final seat of the final wind ended: the game is over.
          isFinished = true;
        } else if (round == 4) {
          roundWind = _nextWind(roundWind);
          round = 1;
          dealer = _nextSeat(dealer);
        } else {
          round += 1;
          dealer = _nextSeat(dealer);
        }
      }
    }

    return GameState(
      players: [
        for (final role in PlayerRole.values)
          PlayerState(
            role: role,
            name: _playerName(game, role),
            points: points[role]!,
            isDealer: role == dealer,
          ),
      ],
      roundWind: roundWind,
      round: round,
      honba: honba,
      riichiSticks: riichiSticks,
      isFinished: isFinished,
    );
  }

  String _playerName(Game game, PlayerRole role) => switch (role) {
    PlayerRole.a => game.eastPlayer,
    PlayerRole.b => game.southPlayer,
    PlayerRole.c => game.westPlayer,
    PlayerRole.d => game.northPlayer,
  };

  PlayerRole _nextSeat(PlayerRole role) {
    final values = PlayerRole.values;
    return values[(values.indexOf(role) + 1) % values.length];
  }

  Wind _nextWind(Wind wind) => switch (wind) {
    Wind.east => Wind.south,
    Wind.south => Wind.west,
    Wind.west => Wind.north,
    Wind.north => Wind.east,
  };

  Wind _gameLengthAsWind(GameLength length) => switch (length) {
    GameLength.east => Wind.east,
    GameLength.south => Wind.south,
    GameLength.west => Wind.west,
    GameLength.north => Wind.north,
  };
}

@riverpod
ReconstructGameStateUseCase reconstructGameStateUseCase(Ref ref) =>
    const ReconstructGameStateUseCase();
