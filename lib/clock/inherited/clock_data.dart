import 'package:flutter/material.dart';
import 'package:recursive_clock/clock/view_model/clock_state.dart';

class ClockData extends InheritedWidget {
  const ClockData({
    @required this.clockState,
    @required Widget child,
  })  : assert(clockState != null),
        assert(child != null),
        super(child: child);

  final ClockState clockState;

  static ClockData of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType(aspect: ClockData);

  @override
  bool updateShouldNotify(ClockData oldWidget) =>
      oldWidget.clockState != clockState;
}
