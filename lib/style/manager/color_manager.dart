import 'package:flutter/material.dart';
import 'package:recursive_clock/styles/color_data.dart';
import 'package:recursive_clock/styles/color_scheme.dart';
import 'package:recursive_clock/styles/dark_colors.dart';
import 'package:recursive_clock/styles/light_colors.dart';

class ColorManager extends StatelessWidget {
  const ColorManager({Key key, this.child}) : super(key: key);

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
