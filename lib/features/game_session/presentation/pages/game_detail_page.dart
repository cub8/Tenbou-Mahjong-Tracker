import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tenbou_mahjong/features/game_session/domain/usecases/delete_game_use_case.dart';
import 'package:tenbou_mahjong/features/game_session/domain/usecases/finish_game_use_case.dart';
import 'package:tenbou_mahjong/features/game_session/presentation/pages/game_list_page.dart';
import 'package:tenbou_mahjong/features/game_session/presentation/providers/game_state_provider.dart';
import 'package:tenbou_mahjong/features/game_session/presentation/widgets/game_board_widget.dart';
import 'package:tenbou_mahjong/features/game_session/presentation/widgets/scoreboard_widget.dart';
import 'package:tenbou_mahjong/router/app_router.dart';

enum _GameMenuAction { endGame, deleteGame }

class GameDetailPage extends ConsumerWidget {
  final int gameId;

  const GameDetailPage({super.key, required this.gameId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bundleAsync = ref.watch(gameStateProvider(gameId));

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
                isFinished: bundle.game.isFinished || bundle.state.isFinished,
                startingPoints: bundle.game.startingPoints,
              ),
              ScoreboardWidget(gameId: gameId),
            ],
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) => Center(child: Text('Error: $error')),
        ),
        floatingActionButton: Builder(
          builder: (context) {
            final tabController = DefaultTabController.of(context);
            return AnimatedBuilder(
              animation: tabController,
              builder: (context, _) {
                if (tabController.index != 0) return const SizedBox.shrink();
                return bundleAsync.maybeWhen(
                      data: (bundle) =>
                          (bundle.game.isFinished || bundle.state.isFinished)
                          ? null
                          : FloatingActionButton.small(
                              tooltip: 'End round',
                              onPressed: () async {
                                await EndRoundRoute(id: '$gameId').push(context);
                                ref.invalidate(gameStateProvider(gameId));
                                ref.invalidate(scoreHistoryProvider(gameId));
                                ref.invalidate(gamesProvider);
                              },
                              child: const Icon(Icons.check),
                            ),
                      orElse: () => null,
                    ) ??
                    const SizedBox.shrink();
              },
            );
          },
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
    ref.invalidate(gameStateProvider(gameId));
    ref.invalidate(scoreHistoryProvider(gameId));
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
