import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tenbou_mahjong/core/utils/date_formatter.dart';
import 'package:tenbou_mahjong/core/utils/string_utils.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/models/game.dart';

class GameListItemWidget extends StatelessWidget {
  final Game game;

  const GameListItemWidget({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    // TODO: zastąpić wartościami z GameState po dodaniu silnika rekonstrukcji
    const round = 1;
    const honba = 0;
    final roundLabel = honba == 0 ? '$round' : '$round-$honba';

    final players = [
      game.eastPlayer,
      game.southPlayer,
      game.westPlayer,
      game.northPlayer,
    ].map(truncateWithEllipsis).join(', ');

    return InkWell(
      // TODO: nawigacja do widoku gry (GameDetailRoute) — po jego utworzeniu
      onTap: () {},
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
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset('assets/images/game/east.svg', width: 32),
                const SizedBox(width: 6),
                Text(
                  roundLabel,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
