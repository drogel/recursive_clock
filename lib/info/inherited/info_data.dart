import 'package:flutter/material.dart';
import 'package:recursive_clock/info/view_model/info_state.dart';

class InfoData extends InheritedWidget {
  const InfoData({
    @required this.infoState,
    @required Widget child,
  })  : assert(infoState != null),
        assert(child != null),
        super(child: child);

  final InfoState infoState;

  static InfoData of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType(aspect: InfoData);

  @override
  bool updateShouldNotify(InfoData oldWidget) => oldWidget.infoState != infoState;
}
