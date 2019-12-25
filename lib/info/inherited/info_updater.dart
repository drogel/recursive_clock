import 'package:flutter/material.dart';
import 'package:recursive_clock/info/inherited/info_data.dart';
import 'package:recursive_clock/info/view_model/info_state.dart';
import 'package:recursive_clock/info/view_model/info_view_model.dart';

class InfoUpdater extends StatefulWidget {
  const InfoUpdater(
    this._viewModel, {
    Key key,
    @required this.child,
  })  : assert(child != null),
        assert(_viewModel != null),
        super(key: key);

  final Widget child;
  final InfoViewModel _viewModel;

  @override
  _InfoUpdaterState createState() => _InfoUpdaterState();
}

class _InfoUpdaterState extends State<InfoUpdater> {
  InfoViewModel _viewModel;

  @override
  void initState() {
    _viewModel = widget._viewModel;
    _viewModel.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => StreamBuilder<InfoState>(
    initialData: _viewModel.initialData,
        stream: _viewModel.stateStream,
        builder: (_, snapshot) => InfoData(
          infoState: snapshot.data,
          child: widget.child,
        ),
      );

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}
