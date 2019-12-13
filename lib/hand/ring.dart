import 'package:flutter/material.dart';

const double _kStrokeWidth = 1;

class Ring extends StatelessWidget {
  const Ring({
    this.color = Colors.black,
    this.strokeWidth = _kStrokeWidth,
  })  : assert(color != null),
        assert(strokeWidth != null);

  final Color color;
  final double strokeWidth;

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
    this.color = Colors.black,
    this.strokeWidth = _kStrokeWidth,
  })  : assert(color != null),
        assert(radius != null),
        assert(strokeWidth != null);

  final Color color;
  final double strokeWidth;
  final double radius;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..color = color
      ..strokeWidth = strokeWidth;

    final shadow = Paint()
      ..color = color.withOpacity(0.33)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, convertRadiusToSigma(15));

    canvas.drawCircle(Offset(10, 10), radius, shadow);
    canvas.drawCircle(Offset.zero, radius, paint);
  }

  static double convertRadiusToSigma(double radius) {
    return radius * 0.57735 + 0.5;
  }

  // TODO(drogel): review the shouldRepaint method
  @override
  bool shouldRepaint(_RingPainter oldDelegate) => false;
}
