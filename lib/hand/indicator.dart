import 'package:flutter/material.dart';

/// Indicator's top distance relative to its parent default value.
const double _kTopPadding = 12;

/// Indicator's size default value.
const double _kSize = 24;

/// A widget that indicates the clock number whose parent hand is pointing to.
///
/// This widget will be aligned to the top center of its parent widget, so that
/// it's stacked at the tip of a clock hand to help the user read the
/// corresponding hour, minute or second more clearly.
class Indicator extends StatelessWidget {
  /// Creates a widget that highlights a clock number.
  ///
  /// None of its properties should be null.
  const Indicator({
    this.color = Colors.black,
    this.topPadding = _kTopPadding,
    this.size = _kSize,
    this.shadows,
  })  : assert(color != null),
        assert(topPadding != null),
        assert(size != null);

  /// Top inset distance relative to its parent widget.
  final double topPadding;

  /// The [Indicator]'s painted area size. It does not include the padding.
  final double size;

  /// The [Indicator]'s body color.
  final Color color;

  /// The [Indicator]'s list of shadows casted.
  final List<BoxShadow> shadows;

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.only(top: topPadding),
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              color: color,
              boxShadow: shadows,
              borderRadius: BorderRadius.circular(size / 2),
            ),
          ),
        ),
      );
}
