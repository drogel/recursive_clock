import 'package:flutter/material.dart';
import 'package:recursive_clock/hand/ring_shadow.dart';

const double _kStrokeWidth = 1;

class Ring extends StatelessWidget {
  const Ring({
    this.color = Colors.black,
    this.strokeWidth = _kStrokeWidth,
    this.ringShadows,
  })  : assert(color != null),
        assert(strokeWidth != null);

  final Color color;
  final double strokeWidth;
  final List<RingShadow> ringShadows;

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (_, constraints) => CustomPaint(
          painter: _RingPainter(
            radius: (constraints.maxHeight - strokeWidth) / 2,
            color: color,
            strokeWidth: strokeWidth,
            shadows: ringShadows,
          ),
        ),
      );
}

class _RingPainter extends CustomPainter {
  const _RingPainter({
    @required this.radius,
    this.color = Colors.black,
    this.strokeWidth = _kStrokeWidth,
    this.shadows,
  })  : assert(color != null),
        assert(radius != null),
        assert(strokeWidth != null);

  final Color color;
  final double strokeWidth;
  final double radius;
  final List<RingShadow> shadows;

  @override
  void paint(Canvas canvas, Size size) {
    final ringPaint = Paint()
      ..style = PaintingStyle.stroke
      ..color = color
      ..strokeWidth = strokeWidth;

    if (shadows != null) {
      for (final shadow in shadows) {
        canvas.drawCircle(shadow.offset, radius, shadow.toPaint());
      }
    }

    canvas.drawCircle(Offset.zero, radius, ringPaint);
  }

  // TODO(drogel): review the shouldRepaint method
  @override
  bool shouldRepaint(_RingPainter oldDelegate) => false;
}
