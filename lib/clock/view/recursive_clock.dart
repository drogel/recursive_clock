import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:recursive_clock/clock/inherited/clock_data.dart';
import 'package:recursive_clock/clock/view/recursive_hand/recursive_hand.dart';
import 'package:recursive_clock/clock/view/hand/hand_decoration.dart';
import 'package:recursive_clock/clock/view/recursive_hand/recursive_hand_shadow.dart';
import 'package:recursive_clock/clock/view/shadow/ring_shadow.dart';
import 'package:recursive_clock/clock/view_model/clock_state.dart';
import 'package:recursive_clock/color/color_scheme.dart';
import 'package:recursive_clock/color/inherited/color_data.dart';

const double kGoldenRatio = 1.61803398875;
const double _kChildHandSize = 1 / kGoldenRatio;
const double _kStrokeWidthFraction = (1 - 1 / kGoldenRatio) / 2;

/// A widget that nests four [RecursiveHand]s to draw a clock.
class RecursiveClock extends StatelessWidget {
  const RecursiveClock();

  Widget _buildShadows(
    BuildContext context, {
    @required double strokeWidth,
    @required RecursiveClockColorScheme colors,
    @required ClockState state,
  }) =>
      RecursiveHandShadow(
        ringShadow: RingShadow(
          strokeWidth: strokeWidth,
          color: colors.baseRingShadow,
          offset: state.baseShadowOffset,
        ),
        child: RecursiveHandShadow(
          size: _kChildHandSize,
          angleRadians: state.hourRadians,
          ringShadow: RingShadow(
            strokeWidth: strokeWidth,
            color: colors.hourRingShadow,
            offset: state.hourShadowOffset,
          ),
          child: RecursiveHandShadow(
            size: _kChildHandSize,
            angleRadians: state.minuteRadians,
            ringShadow: RingShadow(
              strokeWidth: strokeWidth,
              color: colors.minuteRingShadow,
              offset: state.minuteShadowOffset,
            ),
            child: RecursiveHandShadow(
              size: _kChildHandSize,
              angleRadians: state.secondRadians,
              ringShadow: RingShadow(
                strokeWidth: strokeWidth,
                color: colors.secondRingShadow,
                offset: state.secondShadowOffset,
              ),
            ),
          ),
        ),
      );

  Widget _buildHands(
    BuildContext context, {
    @required double strokeWidth,
    @required RecursiveClockColorScheme colors,
    @required ClockState state,
  }) =>
      RecursiveHand(
        strokeWidth: strokeWidth,
        decoration: HandDecoration(
          color: colors.baseRing,
        ),
        child: RecursiveHand(
          strokeWidth: strokeWidth,
          size: _kChildHandSize,
          angleRadians: state.hourRadians,
          decoration: HandDecoration(
            color: colors.hourRing,
            indicatorColor: colors.baseRing,
          ),
          child: RecursiveHand(
            strokeWidth: strokeWidth,
            size: _kChildHandSize,
            angleRadians: state.minuteRadians,
            decoration: HandDecoration(
              color: colors.minuteRing,
              indicatorColor: colors.hourRing,
            ),
            child: RecursiveHand(
              strokeWidth: strokeWidth,
              size: _kChildHandSize,
              angleRadians: state.secondRadians,
              decoration: HandDecoration(
                color: colors.secondRing,
                indicatorColor: colors.minuteRing,
              ),
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) {
          final colors = ColorData.of(context).colors;
          final state = ClockData.of(context).clockState;
          final strokeWidth = _kStrokeWidthFraction * constraints.maxHeight;
          return Stack(
            children: <Widget>[
              _buildShadows(
                context,
                strokeWidth: strokeWidth,
                colors: colors,
                state: state,
              ),
              Semantics.fromProperties(
                properties: SemanticsProperties(value: state.readTime),
                child: _buildHands(
                  context,
                  strokeWidth: strokeWidth,
                  colors: colors,
                  state: state,
                ),
              ),
            ],
          );
        },
      );
}
