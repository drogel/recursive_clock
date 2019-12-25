import 'package:flutter/material.dart';
import 'package:recursive_clock/clock/view/hand/recursive_hand.dart';
import 'package:recursive_clock/clock/view/hand/hand_decoration.dart';
import 'package:recursive_clock/clock/view/hand/ring_shadow.dart';
import 'package:recursive_clock/color/inherited/color_data.dart';
import 'package:recursive_clock/clock/view_model/clock_state.dart';
import 'package:recursive_clock/clock/view_model/clock_view_model.dart';

const double _kChildHandSize = 0.61803398875;
const double _kStrokeWidth = 42;

class RecursiveClock extends StatefulWidget {
  const RecursiveClock(this._viewModel);

  final ClockViewModel _viewModel;

  @override
  _RecursiveClockState createState() => _RecursiveClockState();
}

class _RecursiveClockState extends State<RecursiveClock> {
  ClockViewModel _viewModel;
  ClockState _state;

  @override
  void initState() {
    _viewModel = widget._viewModel;
    _updateState(_viewModel.initialData);
    _viewModel
      ..init()
      ..stateStream.listen(_updateState);
    super.initState();
  }

  void _updateState(ClockState newState) => setState(() => _state = newState);

  @override
  Widget build(BuildContext context) {
    final colorData = ColorData.of(context);
    return RecursiveHand(
      strokeWidth: _kStrokeWidth,
      decoration: HandDecoration(
        color: colorData.colors.clockRing,
        ringShadows: [
          RingShadow(
            strokeWidth: _kStrokeWidth,
            color: colorData.colors.clockRingShadow,
            blurRadius: 2,
            spreadRadius: 2,
            offset: _state.baseShadowOffset,
          ),
        ],
      ),
      child: RecursiveHand(
        strokeWidth: _kStrokeWidth,
        size: _kChildHandSize,
        angleRadians: _state.hourRadians,
        decoration: HandDecoration(
          color: colorData.colors.hourRing,
          ringShadows: [
            RingShadow(
              strokeWidth: _kStrokeWidth,
              color: colorData.colors.hourRingShadow,
              blurRadius: 4,
              spreadRadius: 4,
              offset: _state.hourShadowOffset,
            )
          ],
        ),
        child: RecursiveHand(
          strokeWidth: _kStrokeWidth,
          size: _kChildHandSize,
          angleRadians: _state.minuteRadians,
          decoration: HandDecoration(
            color: colorData.colors.minuteRing,
            ringShadows: [
              RingShadow(
                strokeWidth: _kStrokeWidth,
                color: colorData.colors.minuteRingShadow,
                blurRadius: 8,
                spreadRadius: 8,
                offset: _state.minuteShadowOffset,
              ),
            ],
          ),
          child: RecursiveHand(
            strokeWidth: _kStrokeWidth,
            size: _kChildHandSize,
            angleRadians: _state.secondRadians,
            decoration: HandDecoration(
              color: colorData.colors.secondRing,
              ringShadows: [
                RingShadow(
                  strokeWidth: _kStrokeWidth,
                  color: colorData.colors.secondRingShadow,
                  blurRadius: 16,
                  spreadRadius: 16,
                  offset: _state.secondShadowOffset,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}
