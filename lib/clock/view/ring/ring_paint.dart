import 'package:flutter/material.dart';
import 'package:recursive_clock/clock/view/ring/ring.dart';

class RingPaint extends Ring {
  const RingPaint({
    this.color = Colors.black,
    double strokeWidth,
  })  : assert(color != null),
        super(strokeWidth: strokeWidth);

  final Color color;

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (_, constraints) => CustomPaint(
          painter: _RingPainter(
            radius: (constraints.maxHeight - strokeWidth) / 2,
            color: color,
            strokeWidth: strokeWidth,
          ),
        ),
      );
}

class _RingPainter extends CustomPainter {
  const _RingPainter({
    @required this.radius,
    @required this.strokeWidth,
    @required this.color,
  })  : assert(color != null),
        assert(radius != null),
        assert(strokeWidth != null);

  final Color color;
  final double strokeWidth;
  final double radius;

  @override
  void paint(Canvas canvas, Size size) {
    final ringPaint = Paint()
      ..style = PaintingStyle.stroke
      ..color = color
      ..strokeWidth = strokeWidth;

    canvas.drawCircle(Offset.zero, radius, ringPaint);
  }

  @override
  bool shouldRepaint(_RingPainter oldDelegate) =>
      oldDelegate.radius != radius ||
      oldDelegate.strokeWidth != strokeWidth ||
      oldDelegate.color != color;
}
