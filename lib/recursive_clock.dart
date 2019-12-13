import 'package:flutter/material.dart';
import 'package:recursive_clock/hand/recursive_hand.dart';
import 'package:recursive_clock/hand/hand_decoration.dart';
import 'package:recursive_clock/view_model/clock_state.dart';
import 'package:recursive_clock/view_model/clock_view_model.dart';

const double _kChildHandSize = 0.5;

class RecursiveClock extends StatelessWidget {
  final _viewModel = ClockViewModel();

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: StreamBuilder<ClockState>(
          initialData: _viewModel.initialData,
          stream: _viewModel.stateStream,
          builder: (context, snapshot) => RecursiveHand(
            angleRadians: snapshot.data.hourRadians,
            scaleAlignment: Alignment.center,
            decoration: HandDecoration(color: Colors.blue[800]),
            child: RecursiveHand(
              size: _kChildHandSize,
              angleRadians: snapshot.data.minuteRadians,
              decoration: HandDecoration(
                color: Colors.blue[400].withAlpha(100),
              ),
              child: RecursiveHand(
                size: _kChildHandSize,
                angleRadians: snapshot.data.secondRadians,
                decoration: HandDecoration(
                  color: Colors.blue[200].withAlpha(100),
                ),
              ),
            ),
          ),
        ),
      );
}
