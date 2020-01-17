import 'package:flutter/material.dart';

/// An interface for the color scheme used across the [RecursiveClock].
abstract class RecursiveClockColorScheme {
  Color get baseRing;

  Color get hourRing;

  Color get minuteRing;

  Color get secondRing;

  Color get baseRingShadow;

  Color get hourRingShadow;

  Color get minuteRingShadow;

  Color get secondRingShadow;

  Color get text;
}
