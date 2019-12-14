import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:recursive_clock/view_model/clock_state.dart';
import 'package:vector_math/vector_math_64.dart' show radians;

final radiansPerTick = radians(360 / 60);
final radiansPerHour = radians(360 / 12);

class ClockViewModel {
  ClockViewModel({
    @required Offset desiredShadowsOffset,
  })  : assert(desiredShadowsOffset != null),
        _shadowsOffset = desiredShadowsOffset,
        _shadowsAngleRadians = -desiredShadowsOffset.direction + pi / 2;

  final Offset _shadowsOffset;
  final double _shadowsAngleRadians;

  final StreamController _stateController = StreamController<ClockState>();
  DateTime _now = DateTime.now();
  Timer _timer;

  ClockState _convertToClockState(DateTime time) {
    final hourRadians =
        time.hour * radiansPerHour + (_now.minute / 60) * radiansPerHour;
    final minuteRadians = time.minute * radiansPerTick;
    final secondRadians = time.second * radiansPerTick;

    final recursiveHourRadians = hourRadians;
    final recursiveMinuteRadians = minuteRadians - hourRadians;
    final recursiveSecondRadians = secondRadians - minuteRadians;

    final hourShadowOffset = _computeDesiredShadowOffset(hourRadians);
    final minuteShadowOffset = _computeDesiredShadowOffset(minuteRadians);
    final secondShadowOffset = _computeDesiredShadowOffset(secondRadians);

    return ClockState(
      hourRadians: recursiveHourRadians,
      minuteRadians: recursiveMinuteRadians,
      secondRadians: recursiveSecondRadians,
      hourShadowOffset: hourShadowOffset,
      minuteShadowOffset: minuteShadowOffset,
      secondShadowOffset: secondShadowOffset,
    );
  }

  Offset _computeDesiredShadowOffset(double radians) => Offset(
        _shadowsOffset.distance * sin(radians + _shadowsAngleRadians),
        _shadowsOffset.distance * cos(radians + _shadowsAngleRadians),
      );

  void _updateTime() {
    _now = DateTime.now();
    _timer = Timer(
      Duration(seconds: 1) - Duration(milliseconds: _now.millisecond),
      _updateTime,
    );
    _stateController.sink.add(_convertToClockState(_now));
  }

  void init() => _updateTime();

  Stream<ClockState> get stateStream => _stateController.stream;

  ClockState get initialData => _convertToClockState(_now);

  void dispose() {
    _timer?.cancel();
    _stateController.close();
  }
}
