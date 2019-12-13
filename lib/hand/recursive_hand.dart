import 'package:flutter/material.dart';
import 'package:recursive_clock/hand/circle_pointer.dart';
import 'package:recursive_clock/hand/hand.dart';
import 'package:recursive_clock/hand/hand_decoration.dart';

/// A widget that draws a clock [Hand] that can have another child [Hand] in it.
///
/// This widget applies the [Transform]s associated to the [angleRadians] and
/// [size] parameters from the [Hand] base class it is extending from to
/// rotate and resize the clock hand.
class RecursiveHand extends Hand {
  const RecursiveHand({
    @required double angleRadians,
    double size = 1,
    this.decoration = const HandDecoration(),
    this.scaleAlignment = Alignment.topCenter,
    this.child,
  }) : super(
          size: size,
          angleRadians: angleRadians,
        );

  /// A [HandDecoration] object that contains style parameters for the
  /// [CirclePointer] child in the widget tree.
  final HandDecoration decoration;

  /// Controls the placement of the hand's [Transform.scale] transform.
  ///
  /// For the hour clock hand, it should be centered with [Alignment.center],
  /// but for the rest of children [Hand]s, this should be [Alignment.topCenter]
  /// so that the hand's angle is measured from the 12 o'clock position.
  final Alignment scaleAlignment;


  /// A child [Hand] widget that can be stacked to this clock hand to build the
  /// recursive clock.
  final Hand child;

  @override
  Widget build(BuildContext context) => Center(
        child: AspectRatio(
          aspectRatio: 1,
          child: SizedBox.expand(
            child: Transform.rotate(
              angle: angleRadians,
              child: Transform.scale(
                alignment: scaleAlignment,
                scale: size,
                child: Stack(
                  children: <Widget>[
                    CirclePointer(decoration: decoration),
                    if (child != null) child
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
