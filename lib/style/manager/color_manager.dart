import 'package:flutter/material.dart';
import 'package:recursive_clock/style/manager/color_data.dart';
import 'package:recursive_clock/style/color_scheme.dart';
import 'package:recursive_clock/style/dark_colors.dart';
import 'package:recursive_clock/style/light_colors.dart';

class ColorManager extends StatelessWidget {
  const ColorManager({Key key, @required this.child})
      : assert(child != null),
        super(key: key);

  final Widget child;

  RecursiveClockColorScheme _getColors({@required Brightness forBrightness}) =>
      forBrightness == Brightness.light
          ? const LightColors()
          : const DarkColors();

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;

    return ColorData(
      brightness: brightness,
      colors: _getColors(forBrightness: brightness),
      child: child,
    );
  }
}
