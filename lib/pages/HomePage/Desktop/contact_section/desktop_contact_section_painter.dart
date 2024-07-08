import 'package:flutter/material.dart';

class ContactSectionPainter extends CustomPainter {
  late Paint _paint;
  final Size size;
  final double containerHeight, paddingTopContainer;

  ContactSectionPainter({
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
    Offset topLeft = const Offset(0, 40);
    Offset bottomLeft = Offset(0, containerHeight);
    Offset bottomRight = Offset(this.size.width, containerHeight);
    Offset topRight = Offset(this.size.width, paddingTopContainer);

    // Draw the rectangle
    Path path = Path()
      ..moveTo(topLeft.dx, topLeft.dy)
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
