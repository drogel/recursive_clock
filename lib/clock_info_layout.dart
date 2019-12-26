import 'package:flutter/material.dart';
import 'package:recursive_clock/clock/view/recursive_clock.dart';
import 'package:recursive_clock/info/view/info_panel.dart';

class ClockInfoLayout extends StatelessWidget {
  const ClockInfoLayout();

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(24.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const <Widget>[
            InfoPanel(),
            RecursiveClock(),
          ],
        ),
      );
}
