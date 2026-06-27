import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tenbou_mahjong/core/utils/date_formatter.dart';
import 'package:tenbou_mahjong/core/utils/string_utils.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/models/game.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/models/game_state.dart';
import 'package:tenbou_mahjong/features/game_session/presentation/providers/game_state_provider.dart';
import 'package:tenbou_mahjong/router/app_router.dart';

class GameListItemWidget extends ConsumerWidget {
  final Game game;

  const GameListItemWidget({super.key, required this.game});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final players = [
      game.eastPlayer,
      game.southPlayer,
      game.westPlayer,
      game.northPlayer,
    ].map(truncateWithEllipsis).join(', ');

    final stateAsync = ref.watch(gameStateProvider(game.id!));

    return InkWell(
      onTap: () => GameDetailRoute(id: '${game.id}').push(context),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    players,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    formatGameDate(game.createdAt),
                    style: TextStyle(
                      fontSize: 12,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            stateAsync.maybeWhen(
              data: (bundle) => _buildStatus(bundle.state),
              orElse: () => game.isFinished
                  ? const _FinishedLabel()
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatus(GameState state) {
    if (game.isFinished || state.isFinished) return const _FinishedLabel();

    final roundLabel = state.honba == 0
        ? '${state.round}'
        : '${state.round}-${state.honba}';

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          'assets/images/game/${state.roundWind.name}.svg',
          width: 32,
        ),
        const SizedBox(width: 6),
        Text(
          roundLabel,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ],
    );
  }
}

class _FinishedLabel extends StatelessWidget {
  const _FinishedLabel();

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Finished',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
    );
  }
}
