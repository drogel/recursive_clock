import 'dart:ui';

import 'package:recursive_clock/color/base_colors.dart' as base_colors;
import 'package:recursive_clock/color/color_scheme.dart';

const _kRingOpacity = 0.85;
const _kShadowOpacity = 0.1;

class DarkColors implements RecursiveClockColorScheme {
  const DarkColors();

  @override
  Color get baseRing => base_colors.googleBlue.withOpacity(_kRingOpacity);

  @override
  Color get baseRingShadow =>
      base_colors.googleBlue.withOpacity(_kShadowOpacity);

  @override
  Color get hourRing => base_colors.googleRed.withOpacity(_kRingOpacity);

  @override
  Color get hourRingShadow =>
      base_colors.googleRed.withOpacity(_kShadowOpacity);

  @override
  Color get minuteRing => base_colors.googleYellow.withOpacity(_kRingOpacity);

  @override
  Color get minuteRingShadow =>
      base_colors.googleYellow.withOpacity(_kShadowOpacity);

  @override
  Color get secondRing => base_colors.googleGreen.withOpacity(_kRingOpacity);

  @override
  Color get secondRingShadow =>
      base_colors.googleBlue.withOpacity(_kShadowOpacity);

  @override
  Color get text => base_colors.googleLightGrey;
}
