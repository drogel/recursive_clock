import 'package:flutter/material.dart';
import 'package:recursive_clock/clock/view/hand/ring_pointer.dart';
import 'package:recursive_clock/clock/view/hand/ring_shadow.dart';
import 'package:recursive_clock/clock/view/hand/indicator.dart';
import 'package:recursive_clock/clock/view/hand/ring.dart';

/// An immutable description of how to paint a [RingPointer] static clock hand.
///
/// This class contains all the variables needed to specify the style in
/// which a [RingPointer] static clock hand should be painted.
class HandDecoration {
  const HandDecoration({
    this.color = Colors.white,
    this.indicatorColor = Colors.black,
    this.ringShadows,
    this.indicatorShadows,
  })  : assert(color != null),
        assert(indicatorColor != null);

  /// The color of the clock pointer's main body, i.e., the [Ring].
  final Color color;

  /// The color of the clock pointer's [Indicator].
  final Color indicatorColor;

  /// The list of [RingShadow] objects that will describe how the pointer's
  /// body should cast shadows.
  final List<RingShadow> ringShadows;

  /// The list of [BoxShadow] objects that will describe how the pointer's
  /// indicator should cast shadows.
  final List<BoxShadow> indicatorShadows;
}
