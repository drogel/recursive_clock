import 'package:flutter/cupertino.dart';

abstract class Hand extends StatelessWidget {
  const Hand({
    @required this.size,
    @required this.angleRadians,
  })  : assert(size != null),
        assert(angleRadians != null);

  final double size;

  final double angleRadians;
}
