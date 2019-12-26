import 'package:flutter/material.dart';
import 'package:recursive_clock/clock/inherited/clock_data.dart';
import 'package:recursive_clock/clock/view/hand/recursive_hand.dart';
import 'package:recursive_clock/clock/view/hand/hand_decoration.dart';
import 'package:recursive_clock/clock/view/hand/ring_shadow.dart';
import 'package:recursive_clock/color/inherited/color_data.dart';

const double _kChildHandSize = 0.61803398875;
const double _kStrokeWidth = 48;

class RecursiveClock extends StatelessWidget {
  const RecursiveClock();

  @override
  Widget build(BuildContext context) {
    final colorData = ColorData.of(context);
    final state = ClockData.of(context).clockState;
    return RecursiveHand(
      strokeWidth: _kStrokeWidth,
      hasIndicator: false,
      decoration: HandDecoration(
        color: colorData.colors.baseRing,
        ringShadows: [
          RingShadow(
            strokeWidth: _kStrokeWidth,
            color: colorData.colors.baseRingShadow,
            blurRadius: 2,
            spreadRadius: 2,
            offset: state.baseShadowOffset,
          ),
        ],
      ),
      child: RecursiveHand(
        strokeWidth: _kStrokeWidth,
        size: _kChildHandSize,
        angleRadians: state.hourRadians,
        decoration: HandDecoration(
          color: colorData.colors.hourRing,
          indicatorColor: colorData.colors.baseRing,
          ringShadows: [
            RingShadow(
              strokeWidth: _kStrokeWidth,
              color: colorData.colors.hourRingShadow,
              blurRadius: 4,
              spreadRadius: 4,
              offset: state.hourShadowOffset,
            )
          ],
        ),
        child: RecursiveHand(
          strokeWidth: _kStrokeWidth,
          size: _kChildHandSize,
          angleRadians: state.minuteRadians,
          decoration: HandDecoration(
            color: colorData.colors.minuteRing,
            indicatorColor: colorData.colors.hourRing,
            ringShadows: [
              RingShadow(
                strokeWidth: _kStrokeWidth,
                color: colorData.colors.minuteRingShadow,
                blurRadius: 8,
                spreadRadius: 8,
                offset: state.minuteShadowOffset,
              ),
            ],
          ),
          child: RecursiveHand(
            strokeWidth: _kStrokeWidth,
            size: _kChildHandSize,
            angleRadians: state.secondRadians,
            decoration: HandDecoration(
              color: colorData.colors.secondRing,
              indicatorColor: colorData.colors.minuteRing,
              ringShadows: [
                RingShadow(
                  strokeWidth: _kStrokeWidth,
                  color: colorData.colors.secondRingShadow,
                  blurRadius: 16,
                  spreadRadius: 16,
                  offset: state.secondShadowOffset,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
