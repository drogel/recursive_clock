DateTime _systemTime() => DateTime.now();

class Time {
  final DateTime Function() _time;

  const Time([DateTime Function() currentTime = _systemTime])
      : _time = currentTime;

  Time.fixed(DateTime time) : _time = (() => time);

  DateTime now() => _time();
}
