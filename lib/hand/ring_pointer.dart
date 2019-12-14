import 'package:flutter/material.dart';
import 'package:recursive_clock/hand/hand_decoration.dart';
import 'package:recursive_clock/hand/indicator.dart';
import 'package:recursive_clock/hand/ring.dart';

/// A widget that stacks a [Ring] and an [Indicator] for a static clock hand.
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

  /// The width of the stroke of the [Ring].
  final double strokeWidth;

  /// Controls if this [RingPointer] should draw an [Indicator].
  final bool hasIndicator;

  @override
  Widget build(BuildContext context) => Stack(
        children: <Widget>[
          Center(
            child: Ring(
              strokeWidth: strokeWidth,
              color: decoration.color,
              ringShadows: decoration.ringShadows,
            ),
          ),
          if (hasIndicator)
            Indicator(
              color: decoration.indicatorColor,
              shadows: decoration.indicatorShadows,
            ),
        ],
      );
}
