import 'package:flutter/material.dart';
import 'package:recursive_clock/clock/inherited/clock_data.dart';
import 'package:recursive_clock/clock/view/hand/recursive_hand.dart';
import 'package:recursive_clock/clock/view/hand/hand_decoration.dart';
import 'package:recursive_clock/clock/view/hand/ring_shadow.dart';
import 'package:recursive_clock/color/inherited/color_data.dart';

const double kGoldenRatio = 1.61803398875;
const double _kChildHandSize = 1/kGoldenRatio;
const double _kStrokeWidthFraction = (1-1/kGoldenRatio)/2;

class RecursiveClock extends StatelessWidget {
  const RecursiveClock();

  @override
  Widget build(BuildContext context) {
    final colorData = ColorData.of(context);
    final state = ClockData.of(context).clockState;
    return LayoutBuilder(
      builder: (_, constraints) {
        final strokeWidth = _kStrokeWidthFraction*constraints.maxHeight;
        return RecursiveHand(
          strokeWidth: strokeWidth,
          hasIndicator: false,
          decoration: HandDecoration(
            color: colorData.colors.baseRing,
            ringShadows: [
              RingShadow(
                strokeWidth: strokeWidth,
                color: colorData.colors.baseRingShadow,
                blurRadius: 2,
                spreadRadius: 2,
                offset: state.baseShadowOffset,
              ),
            ],
          ),
          child: RecursiveHand(
            strokeWidth: strokeWidth,
            size: _kChildHandSize,
            angleRadians: state.hourRadians,
            decoration: HandDecoration(
              color: colorData.colors.hourRing,
              indicatorColor: colorData.colors.baseRing,
              ringShadows: [
                RingShadow(
                  strokeWidth: strokeWidth,
                  color: colorData.colors.hourRingShadow,
                  blurRadius: 4,
                  spreadRadius: 4,
                  offset: state.hourShadowOffset,
                )
              ],
            ),
            child: RecursiveHand(
              strokeWidth: strokeWidth,
              size: _kChildHandSize,
              angleRadians: state.minuteRadians,
              decoration: HandDecoration(
                color: colorData.colors.minuteRing,
                indicatorColor: colorData.colors.hourRing,
                ringShadows: [
                  RingShadow(
                    strokeWidth: strokeWidth,
                    color: colorData.colors.minuteRingShadow,
                    blurRadius: 8,
                    spreadRadius: 8,
                    offset: state.minuteShadowOffset,
                  ),
                ],
              ),
              child: RecursiveHand(
                strokeWidth: strokeWidth,
                size: _kChildHandSize,
                angleRadians: state.secondRadians,
                decoration: HandDecoration(
                  color: colorData.colors.secondRing,
                  indicatorColor: colorData.colors.minuteRing,
                  ringShadows: [
                    RingShadow(
                      strokeWidth: strokeWidth,
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
      },
    );
  }
}
