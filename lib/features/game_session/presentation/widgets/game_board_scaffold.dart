import 'package:flutter/material.dart';
import 'package:tenbou_mahjong/features/game_engine/domain/models/player_role.dart';

/// Shared board skeleton: four player corners on the sides (each rotated so it
/// faces its seat) plus a center slot. Used by both the game screen and the
/// end-round form, which supply their own corner/center widgets.
///
/// Rotations: A bottom (0°), B right (90° ccw), C top (180°), D left (90° cw).
class GameBoardScaffold extends StatelessWidget {
  /// Builds the corner widget for a given role (the result is rotated by the
  /// scaffold according to the seat position).
  final Widget Function(PlayerRole role) cornerBuilder;
  final Widget center;

  /// When provided, tapping the empty board area invokes this callback (used to
  /// dismiss the comparison mode on the game screen).
  final VoidCallback? onBackgroundTap;

  const GameBoardScaffold({
    super.key,
    required this.cornerBuilder,
    required this.center,
    this.onBackgroundTap,
  });

  @override
  Widget build(BuildContext context) {
    final stack = Stack(
      children: [
        // C — top, rotated 180°
        Align(
          alignment: Alignment.topCenter,
          child: RotatedBox(
            quarterTurns: 2,
            child: cornerBuilder(PlayerRole.c),
          ),
        ),
        // D — left, rotated 90° clockwise
        Align(
          alignment: Alignment.centerLeft,
          child: RotatedBox(
            quarterTurns: 1,
            child: cornerBuilder(PlayerRole.d),
          ),
        ),
        // B — right, rotated 90° counter-clockwise
        Align(
          alignment: Alignment.centerRight,
          child: RotatedBox(
            quarterTurns: 3,
            child: cornerBuilder(PlayerRole.b),
          ),
        ),
        // A — bottom, no rotation
        Align(
          alignment: Alignment.bottomCenter,
          child: cornerBuilder(PlayerRole.a),
        ),
        Center(child: center),
      ],
    );

    if (onBackgroundTap == null) return stack;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onBackgroundTap,
      child: stack,
    );
  }
}
