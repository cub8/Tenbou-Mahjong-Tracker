import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/models/game.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/models/game_state.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/models/round_history_entry.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/repositories/game_repository.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/usecases/build_score_history_use_case.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/usecases/reconstruct_game_state_use_case.dart';

typedef GameStateBundle = ({Game game, GameState state, int eventCount});

final gameStateProvider = FutureProvider.family<GameStateBundle, int>((
  ref,
  gameId,
) async {
  final repository = ref.watch(gameRepositoryProvider);
  final game = await repository.getGameById(gameId);
  if (game == null) throw Exception('Game not found');
  final events = await repository.getEventsForGame(gameId);
  final state = ref.watch(reconstructGameStateUseCaseProvider)(game, events);
  return (game: game, state: state, eventCount: events.length);
});

final scoreHistoryProvider =
    FutureProvider.family<({Game game, List<RoundHistoryEntry> history}), int>((
      ref,
      gameId,
    ) async {
      final repository = ref.watch(gameRepositoryProvider);
      final game = await repository.getGameById(gameId);
      if (game == null) throw Exception('Game not found');
      final events = await repository.getEventsForGame(gameId);
      final history = ref.watch(buildScoreHistoryUseCaseProvider)(game, events);
      return (game: game, history: history);
    });
