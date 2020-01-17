import 'package:recursive_clock/clock/model/time_model.dart';

/// An implementation of [TimeModel] that can tell the current system time.
class Time implements TimeModel {
  const Time();

  @override
  DateTime now() => DateTime.now();
}


