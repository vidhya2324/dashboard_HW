import 'package:flutter/material.dart';

class BottomNavNotchPainter extends CustomPainter {
  final int index;
  final double itemWidth;

  BottomNavNotchPainter({required this.index, required this.itemWidth});

  @override
  void paint(Canvas canvas, Size size) {
    final double radius = 42;
    final double centerX = itemWidth * index + itemWidth / 2;

    /// 🔹 NAV BAR BACKGROUND
    final Paint bgPaint = Paint()
      ..color = const Color(0xFFF1FEFE)
      ..style = PaintingStyle.fill;

    final Path bgPath = Path()
      ..moveTo(0, 0)
      ..lineTo(0, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 0)
      ..close();

    /// 🔹 HALF-CIRCLE CUT (DOWNWARD)
    final Path cutPath = Path()
      ..addArc(
        Rect.fromCircle(center: Offset(centerX, 0), radius: radius),
        0,
        3.1416,
      );

    final Path finalPath = Path.combine(
      PathOperation.difference,
      bgPath,
      cutPath,
    );

    canvas.drawPath(finalPath, bgPaint);

    /// 🔹 WHITE BORDER AROUND CUT
    final Paint borderPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;

    canvas.drawArc(
      Rect.fromCircle(center: Offset(centerX, 0), radius: radius),
      0,
      3.1416,
      false,
      borderPaint,
    );
  }

  @override
  bool shouldRepaint(covariant BottomNavNotchPainter oldDelegate) {
    return oldDelegate.index != index;
  }
}
