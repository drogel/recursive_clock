import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class RingShadow extends BoxShadow {
  const RingShadow({
    @required this.strokeWidth,
    Color color = Colors.black,
    Offset offset = Offset.zero,
    double spreadRadius = 0,
    double blurRadius = 0,
  })  : assert(strokeWidth != null),
        super(
          color: color,
          offset: offset,
          blurRadius: blurRadius,
          spreadRadius: spreadRadius,
        );

  final double strokeWidth;

  @override
  Paint toPaint() {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, blurSigma);
    assert(() {
      if (debugDisableShadows) {
        paint.maskFilter = null;
      }
      return true;
    }());
    return paint;
  }

  @override
  String toString() => 'RingShadow('
      '$color, '
      '$offset, '
      '${debugFormatDouble(blurRadius)}, '
      '${debugFormatDouble(spreadRadius)}, '
      '${debugFormatDouble(strokeWidth)})';
}
