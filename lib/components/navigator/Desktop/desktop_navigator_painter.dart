import 'package:flutter/material.dart';

class DesktopNavigatorPainter extends CustomPainter {
  late Paint _paint;
  final Size size;
  final double containerHeight, paddingBottomTitle, paddingTopTitle;

  DesktopNavigatorPainter({
    required this.size,
    required this.containerHeight,
    required this.paddingBottomTitle,
    required this.paddingTopTitle,
  }) {
    _paint = Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 1;
  }

  @override
  void paint(Canvas canvas, Size size) {
    Offset start = const Offset(0, 0);
    Offset bottomLeft = Offset(0, containerHeight);
    Offset bottomRight = Offset(
      this.size.width,
      containerHeight - (paddingTopTitle - paddingBottomTitle),
    );
    Offset topRight = Offset(this.size.width, 0);

    // Draw the rectangle
    Path path = Path()
      ..moveTo(start.dx, start.dy)
      ..lineTo(bottomLeft.dx, bottomLeft.dy)
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
