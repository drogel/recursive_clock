import 'package:flutter/cupertino.dart';
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
        child: Container(
          color: decoration.color,
          child: child,
        ),
      );
}
