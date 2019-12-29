import 'package:flutter/material.dart';

class ClockInfoLayout extends StatelessWidget {
  const ClockInfoLayout({this.infoPanel, this.clock});

  final Widget infoPanel;
  final Widget clock;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(28.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            if (infoPanel != null) infoPanel,
            if (clock != null) clock,
          ],
        ),
      );
}
