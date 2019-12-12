import 'package:flutter/material.dart';
import 'package:recursive_clock/hand/circle_hand.dart';
import 'package:recursive_clock/hand/hand_decoration.dart';

class RecursiveClock extends StatefulWidget {
  @override
  _RecursiveClockState createState() => _RecursiveClockState();
}

class _RecursiveClockState extends State<RecursiveClock> {
  @override
  Widget build(BuildContext context) => CircleHand(
    size: 0.9,
    angleRadians: 0,
    decoration: HandDecoration(
      color: Colors.blue[100],
    ),
  );
}
