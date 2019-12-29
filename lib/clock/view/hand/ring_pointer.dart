import 'package:flutter/material.dart';
import 'package:recursive_clock/clock/view/hand/hand_decoration.dart';
import 'package:recursive_clock/clock/view/hand/indicator.dart';
import 'package:recursive_clock/clock/view/hand/ring_paint.dart';
import 'package:recursive_clock/clock/view/recursive_clock.dart';

/// A widget that stacks a [RingPaint] and an [Indicator] for a static clock hand.
class RingPointer extends StatelessWidget {
  /// Creates an immutable [RingPointer].
  ///
  /// Its properties cannot be null.
  const RingPointer({
    @required this.decoration,
    @required this.strokeWidth,
    this.hasIndicator = false,
  })  : assert(decoration != null),
        assert(hasIndicator != null),
        assert(strokeWidth != null);

  /// A [HandDecoration] that will pass its style values to the corresponding
  /// [RingPointer] components.
  final HandDecoration decoration;

  /// The width of the stroke of the [RingPaint].
  final double strokeWidth;

  /// Controls if this [RingPointer] should draw an [Indicator].
  final bool hasIndicator;

  @override
  Widget build(BuildContext context) => Stack(
        children: <Widget>[
          Center(
            child: RingPaint(
              strokeWidth: strokeWidth,
              color: decoration.color,
            ),
          ),
          if (hasIndicator)
            Indicator(
              color: decoration.indicatorColor,
              shadows: decoration.indicatorShadows,
              size: 1/(kGoldenRatio*2)*strokeWidth,
              topPadding: 1/(kGoldenRatio*4)*strokeWidth,
            ),
        ],
      );
}
