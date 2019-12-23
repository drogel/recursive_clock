import 'package:flutter/material.dart';
import 'package:recursive_clock/info/manager/info_data.dart';

class InfoManager extends StatefulWidget {
  const InfoManager({Key key, @required this.child})
      : assert(child != null),
        super(key: key);

  final Widget child;

  @override
  _InfoManagerState createState() => _InfoManagerState();
}

class _InfoManagerState extends State<InfoManager> {
  String _temperature = '';
  String _temperatureRange = '';
  String _condition = '';
  String _location = '';

  @override
  Widget build(BuildContext context) => InfoData(
        temperature: _temperature,
        temperatureRange: _temperatureRange,
        location: _location,
        condition: _condition,
        child: widget.child,
      );
}
