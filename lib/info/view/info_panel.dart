import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
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
        fontSize: 20,
        fontFamily: "Montserrat",
      ),
      child: Semantics.fromProperties(
        properties: SemanticsProperties(
          label: """It's ${infoState.temperature} ${infoState.temperatureUnit} 
              degrees in ${infoState.location}. 
              The weather is ${infoState.condition}""",
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${infoState.temperature}${infoState.shortTemperatureUnit}",
              style: TextStyle(
                fontWeight: FontWeight.w100,
                fontSize: 72,
              ),
            ),
            Text(infoState.location),
            Text(
              infoState.condition,
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}
