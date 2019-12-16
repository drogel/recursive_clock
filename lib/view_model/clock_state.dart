import 'dart:ui';

import 'package:flutter/foundation.dart';

class ClockState {
  const ClockState({
    @required this.hourRadians,
    @required this.minuteRadians,
    @required this.secondRadians,
    @required this.hourShadowOffset,
    @required this.minuteShadowOffset,
    @required this.secondShadowOffset,
  })  : assert(hourRadians != null),
        assert(minuteRadians != null),
        assert(secondRadians != null),
        assert(hourShadowOffset != null),
        assert(minuteShadowOffset != null),
        assert(secondShadowOffset != null);

  final double hourRadians;
  final double minuteRadians;
  final double secondRadians;
  final Offset hourShadowOffset;
  final Offset minuteShadowOffset;
  final Offset secondShadowOffset;
}
