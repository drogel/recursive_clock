import 'package:flutter/material.dart';
import 'package:recursive_clock/info/inherited/info_data.dart';
import 'package:recursive_clock/color/inherited/color_data.dart';

class InfoPanel extends StatelessWidget {
  const InfoPanel();

  @override
  Widget build(BuildContext context) {
    final infoState = InfoData.of(context).infoState;
    return DefaultTextStyle(
      style: TextStyle(
        color: ColorData.of(context).colors.text,
        fontSize: 18,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            infoState.temperature,
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 50),
          ),
          Text(infoState.temperatureRange),
          Text(infoState.condition),
          Text(infoState.location),
        ],
      ),
    );
  }
}
