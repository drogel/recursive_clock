import 'package:recursive_clock/clock/model/time_model.dart';

class Time implements TimeModel {
  const Time();

  @override
  DateTime now() => DateTime.now();
}


