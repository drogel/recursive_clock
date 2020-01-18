import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:recursive_clock/clock/model/time_model.dart';
import 'package:recursive_clock/clock/view/recursive_clock.dart';
import 'package:recursive_clock/clock/view_model/clock_state.dart';
import 'package:vector_math/vector_math_64.dart' show radians;

const _kDebugTimeSpeed = 1;
const _kDefaultShadowsOffset = Offset(16, 16);

const _kMinutesInHour = 60;
const _kSecondsInMinute = _kMinutesInHour;
const _kSecondsInHour = _kSecondsInMinute * _kMinutesInHour;
const _kMillisecondsInSecond = 1000;
const _kMillisecondsInMinute = _kMillisecondsInSecond * _kSecondsInMinute;
const _kMillisecondsInHour = _kMillisecondsInMinute * _kMinutesInHour;

final _radiansPerTick = _kDebugTimeSpeed * radians(360 / _kSecondsInMinute);
final _radiansPerMs = _kDebugTimeSpeed * radians(360 / _kMillisecondsInMinute);
final _radiansPerHour = _kDebugTimeSpeed * radians(360 / 12);

/// Translates the time given by a [TimeModel] into angles for a [RecursiveClock]'s hands.
class ClockViewModel {
  ClockViewModel({
    @required StreamController<ClockState> stateController,
    @required TimeModel model,
    Offset desiredShadowsOffset = _kDefaultShadowsOffset,
  })  : assert(desiredShadowsOffset != null),
        assert(stateController != null),
        assert(model != null),
        _time = model,
        _stateController = stateController,
        _shadowsOffset = desiredShadowsOffset,
        _shadowsAngleRadians = -desiredShadowsOffset.direction + pi / 2;

  final Offset _shadowsOffset;
  final double _shadowsAngleRadians;
  final StreamController _stateController;
  final TimeModel _time;
  Timer _timer;

  void init() => _updateTime();

  Stream<ClockState> get stateStream => _stateController.stream;

  ClockState get initialData => _convertToClockState(_time.now());

  ClockState _convertToClockState(DateTime time) {
    final readableTime = DateFormat.Hms().format(_time.now());

    final hourRadians = time.hour * _radiansPerHour +
        (time.minute / _kMinutesInHour) * _radiansPerHour +
        (time.second / _kSecondsInHour) * _radiansPerHour +
        (time.millisecond / _kMillisecondsInHour) * _radiansPerHour;
    final minuteRadians = time.minute * _radiansPerTick +
        (time.second / _kSecondsInMinute) * _radiansPerTick +
        (time.millisecond / _kMillisecondsInMinute) * _radiansPerTick;
    final secondRadians =
        time.millisecond * _radiansPerMs + time.second * _radiansPerTick;

    final recursiveHourRadians = hourRadians;
    final recursiveMinuteRadians = minuteRadians - hourRadians;
    final recursiveSecondRadians = secondRadians - minuteRadians;

    final hourShadowOffset = _computeDesiredShadowOffset(hourRadians);
    final minuteShadowOffset = _computeDesiredShadowOffset(minuteRadians);
    final secondShadowOffset = _computeDesiredShadowOffset(secondRadians);

    return ClockState(
      readTime: readableTime,
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
