import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/models/game.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/models/game_state.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/repositories/game_repository.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/usecases/reconstruct_game_state_use_case.dart';

typedef GameStateBundle = ({Game game, GameState state, int eventCount});

/// Loads a game with its events and reconstructs the current [GameState].
/// Shared by the game detail page, the end-round form, and the game list.
final gameStateProvider =
    FutureProvider.family<GameStateBundle, int>((ref, gameId) async {
  final repository = ref.watch(gameRepositoryProvider);
  final game = await repository.getGameById(gameId);
  if (game == null) throw Exception('Game not found');
  final events = await repository.getEventsForGame(gameId);
  final state = ref.watch(reconstructGameStateUseCaseProvider)(game, events);
  return (game: game, state: state, eventCount: events.length);
});
