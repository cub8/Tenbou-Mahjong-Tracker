import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tenbou_mahjong/core/theme/app_colors.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/models/game_state.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/models/player_role.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/models/player_state.dart';

class GameBoardWidget extends StatelessWidget {
  final GameState state;
  final bool isFinished;

  const GameBoardWidget({
    super.key,
    required this.state,
    this.isFinished = false,
  });

  PlayerState _player(PlayerRole role) =>
      state.players.firstWhere((p) => p.role == role);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // C — top, rotated 180°
        Align(
          alignment: Alignment.topCenter,
          child: RotatedBox(
            quarterTurns: 2,
            child: _PlayerCorner(player: _player(PlayerRole.c)),
          ),
        ),
        // D — left, rotated 90° clockwise
        Align(
          alignment: Alignment.centerLeft,
          child: RotatedBox(
            quarterTurns: 1,
            child: _PlayerCorner(player: _player(PlayerRole.d)),
          ),
        ),
        // B — right, rotated 90° counter-clockwise
        Align(
          alignment: Alignment.centerRight,
          child: RotatedBox(
            quarterTurns: 3,
            child: _PlayerCorner(player: _player(PlayerRole.b)),
          ),
        ),
        // A — bottom, no rotation
        Align(
          alignment: Alignment.bottomCenter,
          child: _PlayerCorner(player: _player(PlayerRole.a)),
        ),
        Center(
          child: _CenterIndicator(state: state, isFinished: isFinished),
        ),
      ],
    );
  }
}

const Map<PlayerRole, String> _roleWindAsset = {
  PlayerRole.a: 'east',
  PlayerRole.b: 'south',
  PlayerRole.c: 'west',
  PlayerRole.d: 'north',
};

class _PlayerCorner extends StatelessWidget {
  final PlayerState player;

  const _PlayerCorner({required this.player});

  @override
  Widget build(BuildContext context) {
    final color = player.isDealer ? AppColors.darkCyan : Colors.black;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            'assets/images/game/${_roleWindAsset[player.role]}.svg',
            width: 56,
            colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
          ),
          const SizedBox(width: 12),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                player.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 2),
              Text('${player.points}', style: const TextStyle(fontSize: 20)),
            ],
          ),
        ],
      ),
    );
  }
}

class _CenterIndicator extends StatelessWidget {
  final GameState state;
  final bool isFinished;

  const _CenterIndicator({required this.state, required this.isFinished});

  @override
  Widget build(BuildContext context) {
    if (isFinished) {
      return const Text(
        'End',
        style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
      );
    }

    final roundLabel = state.honba == 0
        ? '${state.round}'
        : '${state.round}-${state.honba}';

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          'assets/images/game/${state.roundWind.name}.svg',
          width: 80,
          colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),
        ),
        const SizedBox(height: 8),
        Text(
          roundLabel,
          style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
