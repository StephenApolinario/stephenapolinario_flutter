import 'package:flutter/material.dart';

class SkillsAndToolsPainter extends CustomPainter {
  late Paint _paint;
  final Size size;
  final double containerHeight;
  final double paddingTopContainer;

  SkillsAndToolsPainter({
    required this.size,
    required this.containerHeight,
    required this.paddingTopContainer,
  }) {
    _paint = Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 1;
  }

  @override
  void paint(Canvas canvas, Size size) {
    Offset topLeft = Offset(0, paddingTopContainer);
    Offset bottomLeft = Offset(0, containerHeight);
    Offset firstPick = Offset(this.size.width * 0.1, containerHeight * 0.92);
    Offset firstVallew = Offset(this.size.width * 0.8, containerHeight);
    Offset bottomRight = Offset(this.size.width, containerHeight * 0.95);
    Offset topRight = Offset(this.size.width, 0);

    // Draw the rectangle
    Path path = Path()
      ..moveTo(topLeft.dx, topLeft.dy)
      ..lineTo(bottomLeft.dx, bottomLeft.dy)
      ..lineTo(firstPick.dx, firstPick.dy)
      ..lineTo(firstVallew.dx, firstVallew.dy)
      ..lineTo(bottomRight.dx, bottomRight.dy)
      ..lineTo(topRight.dx, topRight.dy)
      ..close();

    canvas.drawPath(path, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
