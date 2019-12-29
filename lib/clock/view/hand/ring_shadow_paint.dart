import 'dart:math';

import 'package:flutter/material.dart';
import 'package:recursive_clock/clock/view/hand/ring_shadow.dart';

const double _kStrokeWidth = 1;

class RingShadowPaint extends StatelessWidget {
  const RingShadowPaint({
    @required this.ringShadows,
    this.strokeWidth = _kStrokeWidth,
  })  : assert(ringShadows != null),
        assert(strokeWidth != null);

  final double strokeWidth;
  final List<RingShadow> ringShadows;

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (_, constraints) => CustomPaint(
          painter: _RingShadowPainter(
            height: constraints.maxHeight,
            shadows: ringShadows,
          ),
        ),
      );
}

class _RingShadowPainter extends CustomPainter {
  const _RingShadowPainter({
    @required this.height,
    @required this.shadows,
  })  : assert(shadows != null),
        assert(height != null);

  final double height;
  final List<RingShadow> shadows;

  Offset _shift({@required Offset offset, @required double byPixels}) =>
      offset.translate(
        byPixels * cos(offset.direction),
        byPixels * sin(offset.direction),
      );

  @override
  void paint(Canvas canvas, Size size) {
    for (final shadow in shadows) {
      final radius = (height - shadow.strokeWidth) / 2;
      canvas.drawCircle(
        _shift(offset: shadow.offset, byPixels: shadow.spreadRadius),
        radius + shadow.spreadRadius,
        shadow.toPaint(),
      );
    }
  }

  @override
  bool shouldRepaint(_RingShadowPainter oldDelegate) =>
      oldDelegate.height != height || oldDelegate.shadows != shadows;
}
