import 'dart:math';

import 'package:flutter/material.dart';

class CustomCompassPainter extends CustomPainter {
  final double size;
  final Color backgroundColor;
  final Color markerColor;
  final TextStyle textStyle;

  CustomCompassPainter({
    required this.size,
    this.backgroundColor = const Color(0xFFEEEEEE),
    this.markerColor = Colors.black,
    this.textStyle = const TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
  });

  @override
  void paint(Canvas canvas, Size canvasSize) {
    final Offset center = canvasSize.center(Offset.zero);
    final double radius = size / 2;

    final Paint circlePaint =
        Paint()
          ..color = backgroundColor
          ..style = PaintingStyle.stroke
          ..strokeWidth = 4;

    final Paint markerPaint =
        Paint()
          ..color = markerColor
          ..strokeWidth = 2;

    canvas.drawCircle(center, radius, circlePaint);

    const List<String> directions = ['N', 'E', 'S', 'W'];
    for (int i = 0; i < 360; i += 30) {
      final double angle = (i - 90) * pi / 180;
      final double markerLength = i % 90 == 0 ? 15.0 : 8.0;

      final Offset outer = Offset(center.dx + radius * cos(angle), center.dy + radius * sin(angle));
      final Offset inner = Offset(center.dx + (radius - markerLength) * cos(angle), center.dy + (radius - markerLength) * sin(angle));

      canvas.drawLine(outer, inner, markerPaint);

      if (i % 90 == 0) {
        final String dir = directions[i ~/ 90];
        final TextPainter textPainter = TextPainter(text: TextSpan(text: dir, style: textStyle), textDirection: TextDirection.ltr)..layout();

        final Offset textOffset = Offset(
          center.dx + (radius - 30) * cos(angle) - textPainter.width / 2,
          center.dy + (radius - 30) * sin(angle) - textPainter.height / 2,
        );

        textPainter.paint(canvas, textOffset);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomCompassPainter oldDelegate) {
    return size != oldDelegate.size ||
        backgroundColor != oldDelegate.backgroundColor ||
        markerColor != oldDelegate.markerColor ||
        textStyle != oldDelegate.textStyle;
  }
}
