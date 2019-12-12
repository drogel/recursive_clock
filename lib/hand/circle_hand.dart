import 'package:flutter/material.dart';
import 'package:recursive_clock/hand/hand.dart';
import 'package:recursive_clock/hand/hand_decoration.dart';

class CircleHand extends Hand {
  const CircleHand({
    @required double size,
    @required double angleRadians,
    this.decoration = const HandDecoration(),
  }) : super(
          size: size,
          angleRadians: angleRadians,
        );

  final HandDecoration decoration;

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
                child: ClipOval(
                  child: Container(
                    color: decoration.color,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}
