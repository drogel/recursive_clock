import 'dart:math';

import 'package:flutter/material.dart';
import 'package:recursive_clock/clock/view/hand/ring_shadow.dart';

const double _kStrokeWidth = 1;

class RingShadowPaint extends StatelessWidget {
  const RingShadowPaint({
    @required this.ringShadow,
    this.strokeWidth = _kStrokeWidth,
  })  : assert(ringShadow != null),
        assert(strokeWidth != null);

  final double strokeWidth;
  final RingShadow ringShadow;

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (_, constraints) => CustomPaint(
          painter: _RingShadowPainter(
            height: constraints.maxHeight,
            shadow: ringShadow,
          ),
        ),
      );
}

class _RingShadowPainter extends CustomPainter {
  const _RingShadowPainter({
    @required this.height,
    @required this.shadow,
  })  : assert(shadow != null),
        assert(height != null);

  final double height;
  final RingShadow shadow;

  Offset _shift({@required Offset offset, @required double byPixels}) =>
      offset.translate(
        byPixels * cos(offset.direction),
        byPixels * sin(offset.direction),
      );

  @override
  void paint(Canvas canvas, Size size) {
    final radius = (height - shadow.strokeWidth) / 2;
    canvas.drawCircle(
      _shift(offset: shadow.offset, byPixels: shadow.spreadRadius),
      radius + shadow.spreadRadius,
      shadow.toPaint(),
    );
  }

  @override
  bool shouldRepaint(_RingShadowPainter oldDelegate) =>
      oldDelegate.height != height || oldDelegate.shadow != shadow;
}
