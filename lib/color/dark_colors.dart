import 'dart:ui';

import 'package:recursive_clock/color/color_scheme.dart';

const _kRingOpacity = 0.9;
const _kShadowOpacity = 0.05;

class DarkColors implements RecursiveClockColorScheme {
  const DarkColors();

  @override
  Color get clockRing => const Color.fromRGBO(66, 133, 244, _kRingOpacity);

  @override
  Color get clockRingShadow =>
      const Color.fromRGBO(160, 195, 255, _kShadowOpacity);

  @override
  Color get hourRing => const Color.fromRGBO(219, 68, 55, _kRingOpacity);

  @override
  Color get hourRingShadow =>
      const Color.fromRGBO(237, 157, 151, _kShadowOpacity);

  @override
  Color get minuteRing => const Color.fromRGBO(244, 180, 0, _kRingOpacity);

  @override
  Color get minuteRingShadow =>
      const Color.fromRGBO(255, 225, 104, _kShadowOpacity);

  @override
  Color get secondRing => const Color.fromRGBO(15, 157, 88, _kRingOpacity);

  @override
  Color get secondRingShadow =>
      const Color.fromRGBO(123, 207, 169, _kShadowOpacity);

  @override
  Color get text => const Color.fromRGBO(204, 204, 204, 1);
}
