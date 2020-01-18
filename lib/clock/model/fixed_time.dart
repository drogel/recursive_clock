import 'package:recursive_clock/clock/model/time_model.dart';

/// A [TimeModel] that always considers the current time to be [_time].
class FixedTime implements TimeModel {
  const FixedTime(this._time);

  final DateTime _time;

  @override
  DateTime now() => _time;
}
