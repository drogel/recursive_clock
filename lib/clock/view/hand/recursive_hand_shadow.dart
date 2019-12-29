import 'package:flutter/material.dart';
import 'package:recursive_clock/clock/view/hand/hand_transform.dart';
import 'package:recursive_clock/clock/view/hand/hand.dart';
import 'package:recursive_clock/clock/view/hand/ring_shadow.dart';
import 'package:recursive_clock/clock/view/hand/ring_shadow_paint.dart';

class RecursiveHandShadow extends Hand {
  const RecursiveHandShadow({
    @required this.ringShadows,
    double angleRadians = 0,
    double size = 1,
    this.child,
  }) : super(
          size: size,
          angleRadians: angleRadians,
        );

  final Hand child;
  final List<RingShadow> ringShadows;

  @override
  Widget build(BuildContext context) => HandTransform(
        angleRadians: angleRadians,
        size: size,
        scaleAlignment: Alignment.topCenter,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            RingShadowPaint(ringShadows: ringShadows),
            if (child != null) child,
          ],
        ),
      );
}
