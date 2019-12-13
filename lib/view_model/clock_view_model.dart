import 'dart:async';

import 'package:recursive_clock/view_model/clock_state.dart';
import 'package:vector_math/vector_math_64.dart' show radians;

final radiansPerTick = radians(360 / 60);
final radiansPerHour = radians(360 / 12);

class ClockViewModel {
  final StreamController _stateController = StreamController<ClockState>();
  DateTime _now = DateTime.now();
  Timer _timer;

  ClockState _convertToClockState(DateTime time) {
    final hourRadians =
        time.hour * radiansPerHour + (_now.minute / 60) * radiansPerHour;
    final minuteRadians = time.minute * radiansPerTick - hourRadians;
    final secondRadians =
        time.second * radiansPerTick - hourRadians - minuteRadians;
    return ClockState(
      hourRadians: hourRadians,
      minuteRadians: minuteRadians,
      secondRadians: secondRadians,
    );
  }

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
