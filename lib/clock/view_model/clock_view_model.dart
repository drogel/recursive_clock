import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:recursive_clock/clock/view_model/clock_state.dart';
import 'package:recursive_clock/clock/view_model/time.dart';
import 'package:vector_math/vector_math_64.dart' show radians;

const _kDebugTimeSpeedFactor = 1;
const _kDefaultShadowsOffset = Offset(15, 15);

final _radiansPerTick = _kDebugTimeSpeedFactor * radians(360 / 60);
final _radiansPerMillisecond = _kDebugTimeSpeedFactor * radians(360 / 60000);
final _radiansPerHour = _kDebugTimeSpeedFactor * radians(360 / 12);

class ClockViewModel {
  ClockViewModel({
    @required StreamController<ClockState> stateController,
    Offset desiredShadowsOffset = _kDefaultShadowsOffset,
    Time time = const Time(),
  })  : assert(desiredShadowsOffset != null),
        assert(stateController != null),
        assert(time != null),
        _time = time,
        _stateController = stateController,
        _shadowsOffset = desiredShadowsOffset,
        _shadowsAngleRadians = -desiredShadowsOffset.direction + pi / 2;

  final Offset _shadowsOffset;
  final double _shadowsAngleRadians;
  final StreamController _stateController;
  final Time _time;
  Timer _timer;

  void init() => _updateTime();

  Stream<ClockState> get stateStream => _stateController.stream;

  ClockState get initialData => _convertToClockState(_time.now());

  ClockState _convertToClockState(DateTime time) {
    final hourRadians = time.hour * _radiansPerHour +
        (time.minute / 60) * _radiansPerHour +
        (time.second / 3600) * _radiansPerHour +
        (time.millisecond / 3600000) * _radiansPerHour;
    final minuteRadians = time.minute * _radiansPerTick +
        (time.second / 60) * _radiansPerTick +
        (time.millisecond / 60000) * _radiansPerTick;
    final secondRadians = time.millisecond * _radiansPerMillisecond +
        time.second * _radiansPerTick;

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
      baseShadowOffset: _shadowsOffset,
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
    _timer = Timer(
      const Duration(milliseconds: 16),
      _updateTime,
    );
    _stateController.sink.add(_convertToClockState(_time.now()));
  }

  void dispose() {
    _timer?.cancel();
    _stateController.close();
  }
}
