import 'package:flutter/material.dart';

class AuntyTabIndicator extends Decoration {
  final BoxPainter _painter;

  AuntyTabIndicator({
    required Color color,
    required double strokeWidth,
  }) : _painter = _CirclePainter(
          color,
          strokeWidth,
        );

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) => _painter;
}

class _CirclePainter extends BoxPainter {
  final Paint _paint;
  final double strokeWidth;

  _CirclePainter(Color color, this.strokeWidth)
      : _paint = Paint()
          ..color = color
          ..strokeWidth = strokeWidth
          ..strokeCap = StrokeCap.round
          ..style = PaintingStyle.stroke;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    final size = cfg.size;
    if (size == null) return;

    final Offset center =
        offset + Offset(size.width / 2, size.height - (strokeWidth / 2));

    final path = Path()
      ..moveTo(center.dx - 24, center.dy)
      ..lineTo(center.dx + 24, center.dy);
    canvas.drawPath(path, _paint);
  }
}
