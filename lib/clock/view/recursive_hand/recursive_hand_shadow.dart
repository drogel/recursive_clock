import 'package:flutter/material.dart';
import 'package:recursive_clock/clock/view/hand/hand_transform.dart';
import 'package:recursive_clock/clock/view/hand/hand.dart';
import 'package:recursive_clock/clock/view/shadow/ring_shadow.dart';
import 'package:recursive_clock/clock/view/shadow/ring_shadow_paint.dart';

/// Draws a [RingShadowPaint] that can have another child [Hand] in it.
class RecursiveHandShadow extends Hand {
  const RecursiveHandShadow({
    @required this.ringShadow,
    double angleRadians = 0,
    double size = 1,
    this.child,
  }) : super(
          size: size,
          angleRadians: angleRadians,
        );

  final Hand child;
  final RingShadow ringShadow;

  @override
  Widget build(BuildContext context) => HandTransform(
        angleRadians: angleRadians,
        size: size,
        scaleAlignment: Alignment.topCenter,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            RingShadowPaint(ringShadow: ringShadow),
            if (child != null) child,
          ],
        ),
      );
}
