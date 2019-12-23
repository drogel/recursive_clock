import 'package:flutter/material.dart';
import 'package:recursive_clock/info/manager/info_data.dart';
import 'package:recursive_clock/style/manager/color_data.dart';

class InfoPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final info = InfoData.of(context);
    return DefaultTextStyle(
      style: TextStyle(color: ColorData.of(context).colors.text),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(info.temperature),
          Text(info.temperatureRange),
          Text(info.condition),
          Text(info.location),
        ],
      ),
    );
  }
}
