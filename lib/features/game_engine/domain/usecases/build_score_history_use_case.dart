import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/models/end_type.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/models/event.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/models/game.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/models/game_length.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/models/player_role.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/models/round_history_entry.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/models/wind.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/usecases/calculate_payout_use_case.dart';

part "build_score_history_use_case.g.dart";

class BuildScoreHistoryUseCase {
  const BuildScoreHistoryUseCase();

  List<RoundHistoryEntry> call(Game game, List<Event> events) {
    final points = {
      for (final role in PlayerRole.values) role: game.startingPoints,
    };
    var dealer = PlayerRole.a;
    var roundWind = Wind.east;
    var round = 1;
    var riichiSticks = 0;

    const calculatePayout = CalculatePayoutUseCase();
    final lastWind = _gameLengthAsWind(game.gameLength);

    final ordered = [...events]..sort((a, b) => a.index.compareTo(b.index));
    final history = <RoundHistoryEntry>[];

    for (final event in ordered) {
      final result = calculatePayout(
        event: event,
        dealer: dealer,
        riichiSticksOnTable: riichiSticks,
      );
      for (final role in PlayerRole.values) {
        points[role] =
            points[role]! +
            (result.handDeltas[role] ?? 0) +
            (result.sideDeltas[role] ?? 0);
      }
      riichiSticks = result.riichiSticks;

      history.add(
        RoundHistoryEntry(
          roundWind: event.wind,
          round: event.round,
          honba: event.honba,
          endType: event.endType,
          handDeltas: {...result.handDeltas},
          sideDeltas: {...result.sideDeltas},
          totals: {...points},
          chonbo: event.chonbo,
        ),
      );

      final dealerKept = switch (event.endType) {
        EndType.ron ||
        EndType.tsumo => event.winners.any((w) => w.player == dealer),
        EndType.ryuukyoku => event.tenpai.contains(dealer),
        EndType.chonbo => true,
      };

      final isFinalSeat = round == 4 && roundWind == lastWind;
      if (event.endType != EndType.chonbo && !dealerKept && !isFinalSeat) {
        if (round == 4) {
          roundWind = _nextWind(roundWind);
          round = 1;
          dealer = _nextSeat(dealer);
        } else {
          round += 1;
          dealer = _nextSeat(dealer);
        }
      }
    }

    return history;
  }

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
BuildScoreHistoryUseCase buildScoreHistoryUseCase(Ref ref) =>
    const BuildScoreHistoryUseCase();
