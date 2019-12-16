import 'package:flutter/material.dart';
import 'package:recursive_clock/hand/recursive_hand.dart';
import 'package:recursive_clock/hand/hand_decoration.dart';
import 'package:recursive_clock/hand/ring_shadow.dart';
import 'package:recursive_clock/view_model/clock_state.dart';
import 'package:recursive_clock/view_model/clock_view_model.dart';

const double _kChildHandSize = 0.61803398875;
const double _kStrokeWidth = 42;
const Offset _kRingShadowsOffset = Offset(25, 25);

class RecursiveClock extends StatefulWidget {
  @override
  _RecursiveClockState createState() => _RecursiveClockState();
}

class _RecursiveClockState extends State<RecursiveClock> {
  final _viewModel = ClockViewModel(desiredShadowsOffset: _kRingShadowsOffset);
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
        padding: const EdgeInsets.all(30.0),
        child: RecursiveHand(
          strokeWidth: _kStrokeWidth,
          decoration: HandDecoration(
            color: Color.fromRGBO(66, 133, 244, 0.9),
            ringShadows: [
              RingShadow(
                strokeWidth: _kStrokeWidth,
                color: Color.fromRGBO(66, 133, 244, 0.2),
                blurRadius: 2,
                offset: _kRingShadowsOffset,
              ),
            ],
          ),
          child: RecursiveHand(
            strokeWidth: _kStrokeWidth,
            size: _kChildHandSize,
            angleRadians: _state.hourRadians,
            decoration: HandDecoration(
              color: Color.fromRGBO(219, 68, 55, 0.9),
              ringShadows: [
                RingShadow(
                  strokeWidth: _kStrokeWidth,
                  color: Color.fromRGBO(219, 68, 55, 0.2),
                  blurRadius: 4,
                  offset: _state.hourShadowOffset,
                )
              ],
            ),
            child: RecursiveHand(
              strokeWidth: _kStrokeWidth,
              size: _kChildHandSize,
              angleRadians: _state.minuteRadians,
              decoration: HandDecoration(
                color: Color.fromRGBO(244, 180, 0, 0.9),
                ringShadows: [
                  RingShadow(
                    strokeWidth: _kStrokeWidth,
                    color: Color.fromRGBO(244, 180, 0, 0.2),
                    blurRadius: 8,
                    offset: _state.minuteShadowOffset,
                  ),
                ],
              ),
              child: RecursiveHand(
                strokeWidth: _kStrokeWidth,
                size: _kChildHandSize,
                angleRadians: _state.secondRadians,
                decoration: HandDecoration(
                  color: Color.fromRGBO(15, 157, 88, 0.9),
                  ringShadows: [
                    RingShadow(
                      strokeWidth: _kStrokeWidth,
                      color: Color.fromRGBO(15, 157, 88, 0.2),
                      blurRadius: 16,
                      offset: _state.secondShadowOffset,
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
