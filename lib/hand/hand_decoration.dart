import 'package:flutter/material.dart';

/// An immutable description of how to paint an analog clock hand.
///
/// This class contains all the variables needed to specify the style in
/// which a clock hand should be painted.
class HandDecoration {
  const HandDecoration({
    this.color = Colors.white,
    this.indicatorColor = Colors.black,
    this.shadows,
  })  : assert(color != null),
        assert(indicatorColor != null);

  /// The color of the clock hand's main body, i.e., the pointer.
  final Color color;

  /// The color of the clock hand's indicator.
  final Color indicatorColor;

  /// The list of [BoxShadow] objects that will describe how the hand's body
  /// should cast shadows.
  final List<BoxShadow> shadows;
}
