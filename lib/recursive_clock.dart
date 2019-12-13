import 'package:flutter/material.dart';
import 'package:recursive_clock/hand/recursive_hand.dart';
import 'package:recursive_clock/hand/hand_decoration.dart';
import 'package:recursive_clock/view_model/clock_state.dart';
import 'package:recursive_clock/view_model/clock_view_model.dart';

const double _kChildHandSize = 0.61803398875;

class RecursiveClock extends StatefulWidget {
  @override
  _RecursiveClockState createState() => _RecursiveClockState();
}

class _RecursiveClockState extends State<RecursiveClock> {
  final _viewModel = ClockViewModel();
  ClockState _state;

  @override
  void initState() {
    _updateState(_viewModel.initialData);
    _viewModel
      ..init()
      ..stateStream.listen(_updateState);
    super.initState();
  }

  void _updateState(ClockState newState) => setState(() => _state = newState);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: RecursiveHand(
          angleRadians: _state.hourRadians,
          scaleAlignment: Alignment.center,
          decoration: HandDecoration(color: Colors.blue[800]),
          child: RecursiveHand(
            size: _kChildHandSize,
            angleRadians: _state.minuteRadians,
            decoration: HandDecoration(
              color: Colors.blue[400].withAlpha(100),
            ),
            child: RecursiveHand(
              size: _kChildHandSize,
              angleRadians: _state.secondRadians,
              decoration: HandDecoration(
                color: Colors.blue[200].withAlpha(100),
              ),
            ),
          ),
        ),
      );

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}
