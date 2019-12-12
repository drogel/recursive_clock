import 'package:flutter/material.dart';
import 'package:recursive_clock/hand/recursive_hand.dart';
import 'package:recursive_clock/hand/hand_decoration.dart';

class RecursiveClock extends StatelessWidget {
  @override
  Widget build(BuildContext context) => RecursiveHand(
        size: 0.9,
        angleRadians: 2.270795,
        scaleAlignment: Alignment.center,
        decoration: HandDecoration(color: Colors.blue[300]),
        child: RecursiveHand(
          size: 0.5,
          angleRadians: 2.270795,
          decoration: HandDecoration(color: Colors.blue[200]),
          child: RecursiveHand(
            size: 0.5,
            angleRadians: 2.270795,
            decoration: HandDecoration(color: Colors.blue[100]),
          ),
        ),
      );
}
