import 'package:flutter/material.dart';
import 'package:recursive_clock/hand/hand_decoration.dart';

const double _kPointerTopPadding = 54;
const double _kPointerWidth = 12;

class CirclePointer extends StatelessWidget {
  const CirclePointer({
    @required this.decoration,
    this.child,
  }) : assert(decoration != null);

  final HandDecoration decoration;
  final Widget child;

  @override
  Widget build(BuildContext context) => ClipOval(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              color: decoration.color,
            ),
            Padding(
              padding: const EdgeInsets.only(top: _kPointerTopPadding),
              child: LayoutBuilder(
                builder: (_, constraints) => Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    width: _kPointerWidth,
                    height: (constraints.maxHeight - _kPointerTopPadding) / 2,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(_kPointerWidth / 2),
                    ),
                  ),
                ),
              ),
            ),
            if (child != null) child
          ],
        ),
      );
}
