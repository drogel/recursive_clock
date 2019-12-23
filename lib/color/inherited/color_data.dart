import 'package:flutter/material.dart';
import 'package:recursive_clock/color/color_scheme.dart';

class ColorData extends InheritedWidget {
  const ColorData({
    @required Brightness brightness,
    @required this.colors,
    @required Widget child,
  })  : assert(brightness != null),
        assert(colors != null),
        assert(child != null),
        _brightness = brightness,
        super(child: child);

  final Brightness _brightness;
  final RecursiveClockColorScheme colors;

  static ColorData of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType(aspect: ColorData);

  @override
  bool updateShouldNotify(ColorData oldWidget) =>
      oldWidget._brightness != _brightness;
}
