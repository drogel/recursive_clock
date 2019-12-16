import 'dart:ui';

import 'package:recursive_clock/styles/color_scheme.dart';

const _kRingOpacity = 0.9;
const _kShadowOpacity = 0.25;

class LightColors implements RecursiveClockColorScheme {
  const LightColors();

  @override
  Color get clockRing => Color.fromRGBO(66, 133, 244, _kRingOpacity);

  @override
  Color get clockRingShadow => Color.fromRGBO(160, 195, 255, _kShadowOpacity);

  @override
  Color get hourRing => Color.fromRGBO(219, 68, 55, _kRingOpacity);

  @override
  Color get hourRingShadow => Color.fromRGBO(237, 157, 151, _kShadowOpacity);

  @override
  Color get minuteRing => Color.fromRGBO(244, 180, 0, _kRingOpacity);

  @override
  Color get minuteRingShadow => Color.fromRGBO(255, 225, 104, _kShadowOpacity);

  @override
  Color get secondRing => Color.fromRGBO(15, 157, 88, _kRingOpacity);

  @override
  Color get secondRingShadow => Color.fromRGBO(123, 207, 169, _kShadowOpacity);
}
