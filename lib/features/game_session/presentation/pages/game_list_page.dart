import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/repositories/game_repository.dart';
import 'package:tenbou_mahjong/features/game_session/presentation/widgets/create_game_dialog.dart';
import 'package:tenbou_mahjong/features/game_session/presentation/widgets/game_list_item_widget.dart';

class GameListPage extends ConsumerWidget {
  const GameListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gamesAsync = ref.watch(_gamesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Games'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () async {
              final created = await showDialog<bool>(
                context: context,
                builder: (context) => const CreateGameDialog(),
              );
              if (created == true) {
                ref.invalidate(_gamesProvider);
              }
            },
          ),
        ],
      ),
      body: gamesAsync.when(
        data: (games) {
          if (games.isEmpty) {
            return const Center(
              child: Text('No games yet. Add your first game with the + button'),
            );
          }
          return ListView.builder(
            itemCount: games.length,
            itemBuilder: (context, index) =>
                GameListItemWidget(game: games[index]),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text('Error: $error')),
      ),
    );
  }
}

final _gamesProvider = FutureProvider((ref) async {
  final games = await ref.watch(gameRepositoryProvider).getAllGames();
  final sorted = [...games]
    ..sort((a, b) => b.createdAt.compareTo(a.createdAt));
  return sorted;
});
