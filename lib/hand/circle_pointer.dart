import 'package:flutter/material.dart';
import 'package:recursive_clock/hand/hand_decoration.dart';
import 'package:recursive_clock/hand/pointer_bar.dart';

class CirclePointer extends StatelessWidget {
  const CirclePointer({
    @required this.decoration,
    this.child,
  }) : assert(decoration != null);

  final HandDecoration decoration;
  final Widget child;

  Widget _buildCircle() => ClipOval(child: Container(color: decoration.color));

  @override
  Widget build(BuildContext context) => Stack(
        alignment: Alignment.center,
        children: <Widget>[
          _buildCircle(),
          PointerBar(),
          if (child != null) child
        ],
      );
}
