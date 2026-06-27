import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/models/end_type.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/models/event.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/models/game_state.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/models/player_role.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/models/winner.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/models/winning_hand.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/repositories/game_repository.dart';

part "end_round_use_case.g.dart";

class EndRoundUseCase {
  final GameRepository _repository;
  const EndRoundUseCase(this._repository);

  Future<Event> call({
    required GameState currentState,
    required int gameId,
    required int eventCount,
    required EndType endType,
    Map<PlayerRole, WinningHand> winners = const {},
    PlayerRole? loser,
    Set<PlayerRole> tenpai = const {},
    Set<PlayerRole> riichiDeclarers = const {},
    Set<PlayerRole> chonbo = const {},
  }) async {
    switch (endType) {
      case EndType.ron:
        if (loser == null) {
          throw ArgumentError('Ron requires a loser.');
        }
        if (winners.isEmpty) {
          throw ArgumentError('Ron requires at least one winner.');
        }
        if (winners.containsKey(loser)) {
          throw ArgumentError('The loser cannot also be a winner.');
        }
      case EndType.tsumo:
        if (winners.length != 1) {
          throw ArgumentError('Tsumo requires exactly one winner.');
        }
        if (loser != null) {
          throw ArgumentError('Tsumo has no loser.');
        }
      case EndType.ryuukyoku:
        if (winners.isNotEmpty || loser != null) {
          throw ArgumentError('Ryuukyoku has no winners or loser.');
        }
        if (tenpai.length > 4) {
          throw ArgumentError('Ryuukyoku tenpai count must be 0..4.');
        }
      case EndType.chonbo:
        if (chonbo.isEmpty) {
          throw ArgumentError('Chonbo requires at least one offender.');
        }
    }

    final isChonbo = endType == EndType.chonbo;

    final event = Event(
      gameId: gameId,
      index: eventCount,
      wind: currentState.roundWind,
      round: currentState.round,
      honba: currentState.honba,
      endType: endType,
      winners: isChonbo
          ? const []
          : [
              for (final entry in winners.entries)
                Winner(player: entry.key, hand: entry.value),
            ],
      loser: isChonbo ? null : loser,
      tenpai: isChonbo ? const [] : tenpai.toList(),
      riichiDeclarers: isChonbo ? const [] : riichiDeclarers.toList(),
      chonbo: chonbo.toList(),
    );

    return _repository.createEvent(event);
  }
}

@riverpod
EndRoundUseCase endRoundUseCase(Ref ref) {
  final repository = ref.watch(gameRepositoryProvider);
  return EndRoundUseCase(repository);
}
