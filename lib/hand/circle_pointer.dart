import 'package:flutter/material.dart';
import 'package:recursive_clock/hand/hand_decoration.dart';

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
            LayoutBuilder(
              builder: (_, constraints) => Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: 2,
                  height: constraints.maxHeight/2,
                  color: Colors.black,
                ),
              ),
            ),
            if (child != null) child
          ],
        ),
      );
}
