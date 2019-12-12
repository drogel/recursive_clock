import 'package:flutter/material.dart';
import 'package:recursive_clock/hand/circle_pointer.dart';
import 'package:recursive_clock/hand/hand.dart';
import 'package:recursive_clock/hand/hand_decoration.dart';

class RecursiveHand extends Hand {
  const RecursiveHand({
    @required double angleRadians,
    double size = 1,
    this.decoration = const HandDecoration(),
    this.scaleAlignment = Alignment.topCenter,
    this.child,
  }) : super(
          size: size,
          angleRadians: angleRadians,
        );

  final HandDecoration decoration;
  final Widget child;
  final Alignment scaleAlignment;

  @override
  Widget build(BuildContext context) => Center(
        child: AspectRatio(
          aspectRatio: 1,
          child: SizedBox.expand(
            child: Transform.rotate(
              angle: angleRadians,
              child: Transform.scale(
                alignment: scaleAlignment,
                scale: size,
                child: CirclePointer(
                  decoration: decoration,
                  child: child,
                ),
              ),
            ),
          ),
        ),
      );
}
