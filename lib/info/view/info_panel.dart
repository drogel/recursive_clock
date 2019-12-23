import 'package:flutter/material.dart';
import 'package:recursive_clock/info/inherited/info_data.dart';
import 'package:recursive_clock/color/inherited/color_data.dart';

class InfoPanel extends StatelessWidget {
  const InfoPanel();

  @override
  Widget build(BuildContext context) {
    final info = InfoData.of(context);
    return DefaultTextStyle(
      style: TextStyle(
        color: ColorData.of(context).colors.text,
        fontSize: 20,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            info.temperature,
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 54),
          ),
          Text(info.temperatureRange),
          Text(info.condition),
          Text(info.location),
        ],
      ),
    );
  }
}
