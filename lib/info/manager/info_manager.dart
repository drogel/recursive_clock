import 'package:flutter/material.dart';
import 'package:recursive_clock/info/manager/info_data.dart';
import 'package:recursive_clock/info/view_model/info_state.dart';
import 'package:recursive_clock/info/view_model/info_view_model.dart';

class InfoManager extends StatefulWidget {
  const InfoManager(
    this._viewModel, {
    Key key,
    @required this.child,
  })  : assert(child != null),
        assert(_viewModel != null),
        super(key: key);

  final Widget child;
  final InfoViewModel _viewModel;

  @override
  _InfoManagerState createState() => _InfoManagerState();
}

class _InfoManagerState extends State<InfoManager> {
  @override
  Widget build(BuildContext context) => StreamBuilder<InfoState>(
    initialData: widget._viewModel.initialData,
        stream: widget._viewModel.stateStream,
        builder: (_, snapshot) => InfoData(
          temperature: snapshot.data.temperature,
          temperatureRange: snapshot.data.temperatureRange,
          location: snapshot.data.location,
          condition: snapshot.data.condition,
          child: widget.child,
        ),
      );

  @override
  void dispose() {
    widget._viewModel.dispose();
    super.dispose();
  }
}
