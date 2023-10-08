import 'package:flutter/material.dart';

class ButtonParentPainter extends CustomPainter {
  ButtonParentPainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;

    var path = Path();
    path.relativeQuadraticBezierTo(0, -15, 15, -15);
    path.lineTo(15, -15);
    path.lineTo(size.width - 15, size.height / 5 - 15);
    path.relativeQuadraticBezierTo(15, 0, 15, 15);
    path.lineTo(size.width, size.height - 15);
    path.relativeQuadraticBezierTo(0, 15, -15, 15);
    path.lineTo(15, size.height);
    path.relativeQuadraticBezierTo(-15, 0, -15, -15);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(ButtonParentPainter oldDelegate) {
    return color != oldDelegate.color;
  }
}
