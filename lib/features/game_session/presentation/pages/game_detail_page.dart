import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/models/game.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/models/game_state.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/repositories/game_repository.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/usecases/reconstruct_game_state_use_case.dart';
import 'package:tenbou_mahjong/features/game_session/domain/usecases/delete_game_use_case.dart';
import 'package:tenbou_mahjong/features/game_session/domain/usecases/finish_game_use_case.dart';
import 'package:tenbou_mahjong/features/game_session/presentation/pages/game_list_page.dart';
import 'package:tenbou_mahjong/features/game_session/presentation/widgets/game_board_widget.dart';
import 'package:tenbou_mahjong/router/app_router.dart';

typedef _GameStateBundle = ({Game game, GameState state});

final _gameStateProvider =
    FutureProvider.family<_GameStateBundle, int>((ref, gameId) async {
  final repository = ref.watch(gameRepositoryProvider);
  final game = await repository.getGameById(gameId);
  if (game == null) throw Exception('Game not found');
  final events = await repository.getEventsForGame(gameId);
  final state = ref.watch(reconstructGameStateUseCaseProvider)(game, events);
  return (game: game, state: state);
});

enum _GameMenuAction { endGame, deleteGame }

class GameDetailPage extends ConsumerWidget {
  final int gameId;

  const GameDetailPage({super.key, required this.gameId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bundleAsync = ref.watch(_gameStateProvider(gameId));

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Game'),
          actions: [
            PopupMenuButton<_GameMenuAction>(
              onSelected: (action) => switch (action) {
                _GameMenuAction.endGame => _onEndGame(context, ref),
                _GameMenuAction.deleteGame => _onDeleteGame(context, ref),
              },
              itemBuilder: (context) => const [
                PopupMenuItem(
                  value: _GameMenuAction.endGame,
                  child: Text('End game'),
                ),
                PopupMenuItem(
                  value: _GameMenuAction.deleteGame,
                  child: Text('Delete game'),
                ),
              ],
            ),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Game'),
              Tab(text: 'Scoreboard'),
            ],
          ),
        ),
        body: bundleAsync.when(
          data: (bundle) => TabBarView(
            children: [
              GameBoardWidget(
                state: bundle.state,
                isFinished: bundle.game.isFinished,
              ),
              const Center(child: Text('Scoreboard — coming soon')),
            ],
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) => Center(child: Text('Error: $error')),
        ),
        floatingActionButton: bundleAsync.maybeWhen(
          data: (bundle) => bundle.game.isFinished
              ? null
              : FloatingActionButton.small(
                  tooltip: 'End round',
                  onPressed: () {
                    // TODO: open end-round form (next session)
                  },
                  child: const Icon(Icons.check),
                ),
          orElse: () => null,
        ),
      ),
    );
  }

  Future<void> _onEndGame(BuildContext context, WidgetRef ref) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        content: const Text('This action is irreversible. End this game?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('End game'),
          ),
        ],
      ),
    );
    if (confirmed != true) return;

    await ref.read(finishGameUseCaseProvider)(gameId);
    ref.invalidate(_gameStateProvider(gameId));
    ref.invalidate(gamesProvider);
  }

  Future<void> _onDeleteGame(BuildContext context, WidgetRef ref) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        content: const Text(
          'This action is irreversible. Delete this game and all its rounds?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
    if (confirmed != true) return;

    await ref.read(deleteGameUseCaseProvider)(gameId);
    ref.invalidate(gamesProvider);
    if (context.mounted) const GamesRoute().go(context);
  }
}
