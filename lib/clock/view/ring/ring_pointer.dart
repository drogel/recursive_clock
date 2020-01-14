import 'package:flutter/material.dart';
import 'package:recursive_clock/clock/view/hand/hand_decoration.dart';
import 'package:recursive_clock/clock/view/hand/indicator.dart';
import 'package:recursive_clock/clock/view/ring/ring.dart';
import 'package:recursive_clock/clock/view/ring/ring_paint.dart';
import 'package:recursive_clock/clock/view/recursive_clock.dart';

/// Stacks a [RingPaint] and an [Indicator] to draw a static clock hand.
class RingPointer extends Ring {
  /// Creates an immutable [RingPointer].
  ///
  /// Its properties cannot be null.
  const RingPointer({
    @required this.decoration,
    double strokeWidth,
    this.hasIndicator = false,
  })  : assert(decoration != null),
        assert(hasIndicator != null),
        super(strokeWidth: strokeWidth);

  /// A [HandDecoration] that will pass its style values to the corresponding
  /// [RingPointer] components.
  final HandDecoration decoration;

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
              size: 1 / (kGoldenRatio * 2) * strokeWidth,
              topPadding: 1 / (kGoldenRatio * 4) * strokeWidth,
            ),
        ],
      );
}
