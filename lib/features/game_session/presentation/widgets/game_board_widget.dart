import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tenbou_mahjong/core/theme/app_colors.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/models/game_state.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/models/player_role.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/models/player_state.dart';
import 'package:tenbou_mahjong/features/game_session/presentation/widgets/game_board_scaffold.dart';

class GameBoardWidget extends StatefulWidget {
  final GameState state;
  final bool isFinished;
  final int startingPoints;

  const GameBoardWidget({
    super.key,
    required this.state,
    required this.startingPoints,
    this.isFinished = false,
  });

  @override
  State<GameBoardWidget> createState() => _GameBoardWidgetState();
}

class _GameBoardWidgetState extends State<GameBoardWidget> {
  /// Player tapped to enter point-comparison mode (null = off).
  PlayerRole? _selected;

  PlayerState _player(PlayerRole role) =>
      widget.state.players.firstWhere((p) => p.role == role);

  @override
  Widget build(BuildContext context) {
    final selected = _selected;

    return GameBoardScaffold(
      onBackgroundTap:
          selected != null ? () => setState(() => _selected = null) : null,
      cornerBuilder: (role) {
        final player = _player(role);
        int? delta;
        if (selected != null && role != selected) {
          delta = player.points - _player(selected).points;
        }
        return _PlayerCorner(
          player: player,
          windAsset: widget.state.seatWindFor(role).name,
          startingPoints: widget.startingPoints,
          isSelected: selected == role,
          delta: delta,
          onTap: () => setState(
            () => _selected = _selected == role ? null : role,
          ),
        );
      },
      center: _CenterIndicator(state: widget.state, isFinished: widget.isFinished),
    );
  }
}

class _PlayerCorner extends StatelessWidget {
  final PlayerState player;
  final String windAsset;
  final int startingPoints;
  final bool isSelected;

  /// Point difference versus the selected player (comparison mode). Null when
  /// comparison mode is off or this is the selected player.
  final int? delta;
  final VoidCallback onTap;

  const _PlayerCorner({
    required this.player,
    required this.windAsset,
    required this.startingPoints,
    required this.isSelected,
    required this.delta,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final emblemColor = player.isDealer ? AppColors.darkCyan : Colors.black;

    final Widget valueText;
    if (delta != null) {
      final sign = delta! > 0 ? '+' : '';
      valueText = Text(
        '$sign$delta',
        style: TextStyle(fontSize: 20, color: _deltaColor(delta!)),
      );
    } else {
      valueText = Text(
        '${player.points}',
        style: TextStyle(fontSize: 20, color: _pointsColor(player.points)),
      );
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(8),
        decoration: isSelected
            ? BoxDecoration(
                border: Border.all(color: AppColors.darkCyan, width: 2),
                borderRadius: BorderRadius.circular(8),
              )
            : null,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              'assets/images/game/$windAsset.svg',
              width: 56,
              colorFilter: ColorFilter.mode(emblemColor, BlendMode.srcIn),
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
                valueText,
              ],
            ),
          ],
        ),
      ),
    );
  }

  Color? _pointsColor(int points) {
    if (points > startingPoints) return AppColors.selectedGreen;
    if (points < startingPoints) return AppColors.loserRed;
    return null;
  }

  Color _deltaColor(int value) {
    if (value > 0) return AppColors.selectedGreen;
    if (value < 0) return AppColors.loserRed;
    return Colors.black;
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
          state.honba == 0
              ? '${state.round}'
              : '${state.round}-${state.honba}',
          style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
        if (state.riichiSticks > 0 || state.honba > 0) ...[
          const SizedBox(height: 12),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (state.riichiSticks > 0)
                _CountedIcon(
                  asset: 'riichi_stick',
                  count: state.riichiSticks ~/ 1000,
                ),
              if (state.riichiSticks > 0 && state.honba > 0)
                const SizedBox(height: 8),
              if (state.honba > 0)
                _CountedIcon(asset: 'honba', count: state.honba),
            ],
          ),
        ],
      ],
    );
  }
}

/// A table-marker icon (riichi stick / honba) followed by its count. These SVGs
/// carry their own colors, so no [ColorFilter] is applied.
class _CountedIcon extends StatelessWidget {
  final String asset;
  final int count;

  const _CountedIcon({required this.asset, required this.count});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset('assets/images/game/$asset.svg', width: 64),
        const SizedBox(width: 6),
        Text('×$count', style: const TextStyle(fontSize: 22)),
      ],
    );
  }
}
