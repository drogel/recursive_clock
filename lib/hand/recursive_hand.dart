import 'package:flutter/material.dart';
import 'package:recursive_clock/hand/ring_pointer.dart';
import 'package:recursive_clock/hand/hand.dart';
import 'package:recursive_clock/hand/hand_decoration.dart';
import 'package:recursive_clock/recursive_clock.dart';

/// A widget that draws a clock [Hand] that can have another child [Hand] in it.
///
/// This widget applies the [Transform]s associated to the [angleRadians] and
/// [size] parameters from the [Hand] base class it is extending from to
/// rotate and resize the clock hand.
class RecursiveHand extends Hand {
  const RecursiveHand({
    @required this.strokeWidth,
    double angleRadians = 0,
    double size = 1,
    this.decoration = const HandDecoration(),
    this.scaleAlignment = Alignment.topCenter,
    this.hasIndicator = false,
    this.child,
  })  : assert(strokeWidth != null),
        super(
          size: size,
          angleRadians: angleRadians,
        );

  /// A [HandDecoration] object that contains style parameters for the
  /// [RingPointer] child in the widget tree.
  final HandDecoration decoration;

  /// Controls the placement of the hand's [Transform.scale] transform.
  ///
  /// For the hour clock hand, it should be centered with [Alignment.center],
  /// but for the rest of children [Hand]s, this should be [Alignment.topCenter]
  /// so that the hand's angle is measured from the 12 o'clock position.
  final Alignment scaleAlignment;

  /// A child [Hand] widget that can be stacked to this clock hand to build the
  /// [RecursiveClock].
  final Hand child;

  /// The width of the stroke of the [Ring] in [RingPointer].
  final double strokeWidth;

  /// Controls if the [RingPointer] should draw an [Indicator].
  final bool hasIndicator;

  @override
  Widget build(BuildContext context) => Center(
        child: AspectRatio(
          aspectRatio: 1,
          child: Transform.rotate(
            angle: angleRadians,
            child: Transform.scale(
              scale: size,
              alignment: scaleAlignment,
              child: Stack(
                children: <Widget>[
                  RingPointer(
                    strokeWidth: strokeWidth,
                    decoration: decoration,
                    hasIndicator: hasIndicator,
                  ),
                  if (child != null) child
                ],
              ),
            ),
          ),
        ),
      );
}
