import "dart:math";
import 'package:flutter/material.dart';
import 'package:tenbou_mahjong/features/yaku/data/models/yaku_scoring.dart';

class ValueIconWidget extends StatelessWidget {
  final YakuScoring scoring;
  final double size;

  const ValueIconWidget({super.key, required this.scoring, this.size = 40});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _HexagonPainter(color: _colorFor()),
        child: Center(child: _contentFor()),
      ),
    );
  }

  Color _colorFor() {
    return switch (scoring) {
      YakuScoringStandard(han: 1) => Colors.blue[900]!,
      YakuScoringStandard(han: 2) => Colors.green[900]!,
      YakuScoringStandard(han: 3) => Colors.red,
      YakuScoringStandard(han: 5) => Colors.purple[800]!,
      YakuScoringYakuman() => Colors.amber,
      YakuScoringStandard(han: final han) => throw FormatException(
        'Nieobsługiwana wartość Han dla ikony: $han',
      ),
    };
  }

  Widget _contentFor() {
    return switch (scoring) {
      YakuScoringStandard(han: final han) => Text(
        "$han",
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      YakuScoringYakuman(multiplier: final multiplier) => _StarsRow(
        count: multiplier,
        size: size,
      ),
    };
  }
}

class _StarsRow extends StatelessWidget {
  final int count;
  final double size;

  const _StarsRow({required this.count, required this.size});

  @override
  Widget build(BuildContext context) {
    final starSize = count <= 1 ? size * 0.5 : size * 0.4;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        count,
        (_) => Icon(Icons.star, color: Colors.white, size: starSize),
      ),
    );
  }
}

class _HexagonPainter extends CustomPainter {
  final Color color;

  _HexagonPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    canvas.drawPath(_hexagonPath(size), paint);
  }

  @override
  bool shouldRepaint(covariant _HexagonPainter oldDelegate) {
    return oldDelegate.color != color;
  }

  Path _hexagonPath(Size size) {
    final centerX = size.width / 2;
    final centerY = size.width / 2;
    final radius = min(size.width, size.height) / 2;
    final path = Path();

    for (var i = 0; i < 6; i++) {
      final angle = (-90 + i * 60) * (pi / 180);
      final x = centerX + radius * cos(angle);
      final y = centerY + radius * sin(angle);
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    path.close();
    return path;
  }
}
