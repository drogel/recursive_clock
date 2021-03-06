import 'package:flutter/material.dart';
import 'package:recursive_clock/info/inherited/info_data.dart';
import 'package:recursive_clock/color/inherited/color_data.dart';

/// Displays information about the temperature, weather condition and location.
class InfoPanel extends StatelessWidget {
  const InfoPanel();

  @override
  Widget build(BuildContext context) {
    final infoState = InfoData.of(context).infoState;
    return DefaultTextStyle(
      style: TextStyle(
        color: ColorData.of(context).colors.text,
        fontSize: 16,
        fontFamily: "Montserrat",
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${infoState.temperature}${infoState.temperatureUnit}",
            style: TextStyle(
              fontWeight: FontWeight.w100,
              fontSize: 64,
            ),
          ),
          Text(infoState.location),
          Text(
            infoState.condition,
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
