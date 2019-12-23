import 'package:flutter/cupertino.dart';

/// Base class for an analog clock hand-drawing widget.
///
/// This only indicates the polar coordinates at which one hand of the analog
/// clock should be drawn.
abstract class Hand extends StatelessWidget {
  const Hand({
    @required this.size,
    @required this.angleRadians,
  })  : assert(size != null),
        assert(angleRadians != null);

  /// Hand size scale factor, as a percentage of the smaller side of the
  /// hand's parent container.
  final double size;

  /// The angle, in radians, at which the hand is drawn.
  ///
  /// This angle is measured from the 12 o'clock position.
  final double angleRadians;
}
