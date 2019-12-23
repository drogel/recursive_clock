import 'package:flutter/material.dart';

class InfoData extends InheritedWidget {
  const InfoData({
    this.temperature = '',
    this.temperatureRange = '',
    this.condition = '',
    this.location = '',
    @required Widget child,
  })  : assert(temperature != null),
        assert(temperatureRange != null),
        assert(condition != null),
        assert(location != null),
        assert(child != null),
        super(child: child);

  final String temperature;
  final String temperatureRange;
  final String condition;
  final String location;

  static InfoData of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType(aspect: InfoData);

  @override
  bool updateShouldNotify(InfoData oldWidget) =>
      oldWidget.temperature != temperature ||
      oldWidget.temperatureRange != temperatureRange ||
      oldWidget.condition != condition ||
      oldWidget.location != location;
}
