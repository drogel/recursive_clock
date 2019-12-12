import 'package:flutter/material.dart';
import 'package:recursive_clock/hand/circle_pointer.dart';
import 'package:recursive_clock/hand/hand.dart';
import 'package:recursive_clock/hand/hand_decoration.dart';

class RecursiveHand extends Hand {
  const RecursiveHand({
    @required double size,
    @required double angleRadians,
    this.decoration = const HandDecoration(),
    this.child,
  }) : super(
          size: size,
          angleRadians: angleRadians,
        );

  final HandDecoration decoration;
  final Widget child;

  @override
  Widget build(BuildContext context) => Center(
        child: AspectRatio(
          aspectRatio: 1,
          child: SizedBox.expand(
            child: Transform.rotate(
              angle: angleRadians,
              alignment: Alignment.center,
              child: Transform.scale(
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
