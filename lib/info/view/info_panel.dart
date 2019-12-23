import 'package:flutter/material.dart';
import 'package:recursive_clock/style/manager/color_data.dart';

class InfoPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) => DefaultTextStyle(
        style: TextStyle(color: ColorData.of(context).colors.text),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Temperature"),
            Text("Temperature Range"),
            Text("Condition"),
            Text("Location"),
          ],
        ),
      );
}
