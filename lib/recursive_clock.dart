import 'package:flutter/material.dart';
import 'package:recursive_clock/hand/recursive_hand.dart';
import 'package:recursive_clock/hand/hand_decoration.dart';
import 'package:recursive_clock/hand/ring_shadow.dart';
import 'package:recursive_clock/view_model/clock_state.dart';
import 'package:recursive_clock/view_model/clock_view_model.dart';

const double _kChildHandSize = 0.61803398875;
const double _kStrokeWidth = 46;

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
          strokeWidth: _kStrokeWidth,
          decoration: HandDecoration(
            color: Colors.blue[900].withOpacity(0.9),
            ringShadows: [
              RingShadow(
                strokeWidth: _kStrokeWidth,
                color: Colors.blue[900].withOpacity(0.3),
                blurRadius: 5,
                offset: Offset(20, 20),
              ),
            ],
          ),
          child: RecursiveHand(
            strokeWidth: _kStrokeWidth,
            size: _kChildHandSize,
            angleRadians: _state.hourRadians,
            decoration: HandDecoration(
              color: Colors.blue[600].withOpacity(0.9),
              ringShadows: [
                RingShadow(
                  strokeWidth: _kStrokeWidth,
                  color: Colors.blue[600].withOpacity(0.3),
                  blurRadius: 5,
                  offset: Offset(20, 20),
                )
              ],
            ),
            child: RecursiveHand(
              strokeWidth: _kStrokeWidth,
              size: _kChildHandSize,
              angleRadians: _state.minuteRadians,
              decoration: HandDecoration(
                color: Colors.blue[300].withOpacity(0.9),
                ringShadows: [
                  RingShadow(
                    strokeWidth: _kStrokeWidth,
                    color: Colors.blue[300].withOpacity(0.3),
                    blurRadius: 5,
                    offset: Offset(20, 20),
                  )
                ],
              ),
              child: RecursiveHand(
                strokeWidth: _kStrokeWidth,
                size: _kChildHandSize,
                angleRadians: _state.secondRadians,
                decoration: HandDecoration(
                  color: Colors.blue[100].withOpacity(0.9),
                  ringShadows: [
                    RingShadow(
                      strokeWidth: _kStrokeWidth,
                      color: Colors.blue[100].withOpacity(0.3),
                      blurRadius: 5,
                      offset: Offset(20, 20),
                    ),
                  ],
                ),
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
