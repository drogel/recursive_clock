import 'package:flutter/material.dart';
import 'package:recursive_clock/color/inherited/color_data.dart';
import 'package:recursive_clock/color/color_scheme.dart';
import 'package:recursive_clock/color/dark_colors.dart';
import 'package:recursive_clock/color/light_colors.dart';

/// A widget that handles colors updates from theme's [Brightness].
class ColorUpdater extends StatelessWidget {
  const ColorUpdater({
    @required this.child,
    Key key,
  })  : assert(child != null),
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
