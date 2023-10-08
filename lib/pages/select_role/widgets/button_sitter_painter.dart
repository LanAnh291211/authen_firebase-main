import 'package:flutter/material.dart';

class ButtonSitterPainter extends CustomPainter {
  ButtonSitterPainter({required this.color});

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
    path.lineTo(size.width - 15, -15);
    path.relativeQuadraticBezierTo(15, 0, 15, 15);
    path.lineTo(size.width, size.height - 15);
    path.relativeQuadraticBezierTo(0, 15, -15, 15);
    path.lineTo(15, 4 * size.height / 5);
    path.relativeQuadraticBezierTo(-15, 0, -15, -15);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(ButtonSitterPainter oldDelegate) {
    return color != oldDelegate.color;
  }
}
