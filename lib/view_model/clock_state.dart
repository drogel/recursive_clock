import 'package:flutter/foundation.dart';

class ClockState {
  const ClockState({
    @required this.hourRadians,
    @required this.minuteRadians,
    @required this.secondRadians,
  })  : assert(hourRadians != null),
        assert(minuteRadians != null),
        assert(secondRadians != null);

  final double hourRadians;
  final double minuteRadians;
  final double secondRadians;
}
