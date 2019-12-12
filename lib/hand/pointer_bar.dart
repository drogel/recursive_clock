import 'package:flutter/material.dart';

const double _kTopPadding = 54;
const double _kWidth = 12;

class PointerBar extends StatelessWidget {
  const PointerBar({
    this.topPadding = _kTopPadding,
    this.width = _kWidth,
  });

  final double topPadding;
  final double width;

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.only(top: topPadding),
        child: LayoutBuilder(
          builder: (_, constraints) => Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: width,
              height: (constraints.maxHeight - topPadding) / 2,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(width / 2),
              ),
            ),
          ),
        ),
      );
}
