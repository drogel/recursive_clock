import 'package:flutter/material.dart';
import 'package:recursive_clock/clock/inherited/clock_data.dart';
import 'package:recursive_clock/clock/view_model/clock_state.dart';
import 'package:recursive_clock/clock/view_model/clock_view_model.dart';

/// Listens to a [ClockViewModel]'s [Stream], updating the widget tree when [ClockState] changes.
class ClockUpdater extends StatefulWidget {
  const ClockUpdater(
    this._viewModel, {
    Key key,
    @required this.child,
  })  : assert(child != null),
        assert(_viewModel != null),
        super(key: key);

  final Widget child;
  final ClockViewModel _viewModel;

  @override
  _ClockUpdaterState createState() => _ClockUpdaterState();
}

class _ClockUpdaterState extends State<ClockUpdater> {
  ClockViewModel _viewModel;

  @override
  void initState() {
    _viewModel = widget._viewModel..init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => StreamBuilder<ClockState>(
        initialData: _viewModel.initialData,
        stream: _viewModel.stateStream,
        builder: (_, snapshot) => ClockData(
          clockState: snapshot.data,
          child: widget.child,
        ),
      );

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}
