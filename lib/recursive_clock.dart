import 'package:flutter/material.dart';
import 'package:recursive_clock/hand/recursive_hand.dart';
import 'package:recursive_clock/hand/hand_decoration.dart';

class RecursiveClock extends StatefulWidget {
  @override
  _RecursiveClockState createState() => _RecursiveClockState();
}

class _RecursiveClockState extends State<RecursiveClock> {
  @override
  Widget build(BuildContext context) =>
      RecursiveHand(
        size: 0.9,
        angleRadians: 0,
        scaleAlignment: Alignment.center,
        decoration: HandDecoration(
          color: Colors.blue[100],
        ),
        child: RecursiveHand(
          size: 0.5,
          angleRadians: 0,
          child: RecursiveHand(
            size: 0.5,
            angleRadians: 0,
            decoration: HandDecoration(
              color: Colors.blue[100],
            ),
          ),
        ),
      );
}
