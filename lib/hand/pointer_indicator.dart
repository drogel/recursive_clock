import 'package:flutter/material.dart';

const double _kTopPadding = 12;
const double _kWidth = 36;

class PointerIndicator extends StatelessWidget {
  const PointerIndicator({
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
              height: width,
              decoration: BoxDecoration(
                color: Colors.pinkAccent,
                borderRadius: BorderRadius.circular(width / 2),
              ),
            ),
          ),
        ),
      );
}
