import 'package:flutter/material.dart';
import 'package:recursive_clock/clock/view/hand/hand.dart';

/// Forces its child to fit in a square, then rotates it and scales it.
class HandTransform extends Hand {
  const HandTransform({
    double angleRadians = 0,
    double size = 1,
    this.scaleAlignment = Alignment.topCenter,
    this.child,
  }) : super(
          size: size,
          angleRadians: angleRadians,
        );

  final Alignment scaleAlignment;
  final Widget child;

  @override
  Widget build(BuildContext context) => Center(
        child: AspectRatio(
          aspectRatio: 1,
          child: Transform.rotate(
            angle: angleRadians,
            child: Transform.scale(
              scale: size,
              alignment: scaleAlignment,
              child: child,
            ),
          ),
        ),
      );
}
