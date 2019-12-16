import 'package:flutter/material.dart';

enum Component {
  clockRing,
  hourRing,
  minuteRing,
  secondRing,
  clockRingShadow,
  hourRingShadow,
  minuteRingShadow,
  secondRingShadow,
}

const lightColors = <Component, Color>{
  Component.clockRing: Color.fromRGBO(66, 133, 244, 0.9),
  Component.hourRing: Color.fromRGBO(219, 68, 55, 0.9),
  Component.minuteRing: Color.fromRGBO(244, 180, 0, 0.9),
  Component.secondRing: Color.fromRGBO(15, 157, 88, 0.9),
  Component.clockRingShadow: Color.fromRGBO(160, 195, 255, 1),
  Component.hourRingShadow: Color.fromRGBO(237, 157, 151, 1),
  Component.minuteRingShadow: Color.fromRGBO(255, 225, 104, 1),
  Component.secondRingShadow: Color.fromRGBO(123, 207, 169, 1),
};