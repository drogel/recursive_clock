import 'package:flutter/material.dart';
import 'package:recursive_clock/clock/inherited/clock_data.dart';
import 'package:recursive_clock/clock/view/hand/recursive_hand.dart';
import 'package:recursive_clock/clock/view/hand/hand_decoration.dart';
import 'package:recursive_clock/clock/view/hand/recursive_hand_shadow.dart';
import 'package:recursive_clock/clock/view/hand/ring_shadow.dart';
import 'package:recursive_clock/color/inherited/color_data.dart';

const double kGoldenRatio = 1.61803398875;
const double _kChildHandSize = 1 / kGoldenRatio;
const double _kStrokeWidthFraction = (1 - 1 / kGoldenRatio) / 2;

class RecursiveClock extends StatelessWidget {
  const RecursiveClock();

  @override
  Widget build(BuildContext context) {
    final colorData = ColorData.of(context);
    final state = ClockData.of(context).clockState;
    return LayoutBuilder(
      builder: (_, constraints) {
        final strokeWidth = _kStrokeWidthFraction * constraints.maxHeight;
        return Stack(
          children: <Widget>[
            RecursiveHandShadow(
              ringShadow: RingShadow(
                strokeWidth: strokeWidth,
                color: colorData.colors.baseRingShadow,
                blurRadius: 2,
                spreadRadius: 2,
                offset: state.baseShadowOffset,
              ),
              child: RecursiveHandShadow(
                size: _kChildHandSize,
                angleRadians: state.hourRadians,
                ringShadow: RingShadow(
                  strokeWidth: strokeWidth,
                  color: colorData.colors.hourRingShadow,
                  blurRadius: 2,
                  spreadRadius: 2,
                  offset: state.hourShadowOffset,
                ),
                child: RecursiveHandShadow(
                  size: _kChildHandSize,
                  angleRadians: state.minuteRadians,
                  ringShadow: RingShadow(
                    strokeWidth: strokeWidth,
                    color: colorData.colors.minuteRingShadow,
                    blurRadius: 2,
                    spreadRadius: 2,
                    offset: state.minuteShadowOffset,
                  ),
                  child: RecursiveHandShadow(
                    size: _kChildHandSize,
                    angleRadians: state.secondRadians,
                    ringShadow: RingShadow(
                      strokeWidth: strokeWidth,
                      color: colorData.colors.secondRingShadow,
                      blurRadius: 2,
                      spreadRadius: 2,
                      offset: state.secondShadowOffset,
                    ),
                  ),
                ),
              ),
            ),
            RecursiveHand(
              strokeWidth: strokeWidth,
              hasIndicator: false,
              decoration: HandDecoration(
                color: colorData.colors.baseRing,
              ),
              child: RecursiveHand(
                strokeWidth: strokeWidth,
                size: _kChildHandSize,
                angleRadians: state.hourRadians,
                decoration: HandDecoration(
                  color: colorData.colors.hourRing,
                  indicatorColor: colorData.colors.baseRing,
                ),
                child: RecursiveHand(
                  strokeWidth: strokeWidth,
                  size: _kChildHandSize,
                  angleRadians: state.minuteRadians,
                  decoration: HandDecoration(
                    color: colorData.colors.minuteRing,
                    indicatorColor: colorData.colors.hourRing,
                  ),
                  child: RecursiveHand(
                    strokeWidth: strokeWidth,
                    size: _kChildHandSize,
                    angleRadians: state.secondRadians,
                    decoration: HandDecoration(
                      color: colorData.colors.secondRing,
                      indicatorColor: colorData.colors.minuteRing,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
