import 'package:flutter/material.dart';
import 'package:recursive_clock/hand/hand_decoration.dart';
import 'package:recursive_clock/hand/indicator.dart';

/// A widget that draws a circle and an [Indicator] for a clock hand.
///
/// This widget stacks a circular [Container] and an [Indicator].
class CirclePointer extends StatelessWidget {
  /// Creates an immutable [CirclePointer].
  ///
  /// Its [decoration] value cannot be null.
  const CirclePointer({
    @required this.decoration,
  }) : assert(decoration != null);

  /// A [HandDecoration] that will pass its style values to the corresponding
  /// [CirclePointer] components.
  final HandDecoration decoration;

  /// Builds the [CirclePointer]'s circle body using a [Container] widget.
  Widget _buildCircle() => LayoutBuilder(
        builder: (_, constraints) => Container(
          decoration: BoxDecoration(
            color: decoration.color,
            borderRadius: BorderRadius.circular(constraints.maxHeight / 2),
            boxShadow: decoration.shadows,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) => Stack(
        children: <Widget>[
          _buildCircle(),
          Indicator(
            color: decoration.indicatorColor,
            shadows: decoration.indicatorShadows,
          ),
        ],
      );
}
