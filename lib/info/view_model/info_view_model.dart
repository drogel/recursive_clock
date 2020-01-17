import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_clock_helper/model.dart';
import 'package:recursive_clock/info/view_model/info_state.dart';

/// Translates the information given by a [ClockModel] into readable strings.
class InfoViewModel {
  InfoViewModel({
    @required ClockModel model,
    @required StreamController<InfoState> stateController,
  })  : assert(model != null),
        assert(stateController != null),
        _model = model,
        _stateController = stateController;

  final ClockModel _model;
  final StreamController<InfoState> _stateController;

  void init() {
    _model.addListener(_updateState);
    _updateState();
  }

  Stream<InfoState> get stateStream => _stateController.stream;

  InfoState get initialData => InfoState.empty();

  void _updateState() {
    final newState = InfoState(
      temperature: _model.temperature.toStringAsFixed(0),
      temperatureUnit: _model.unitString,
      temperatureRange: '(${_model.low} - ${_model.highString})',
      condition: _capitalize(_model.weatherString),
      location: _model.location,
    );
    _stateController.sink.add(newState);
  }

  String _capitalize(String string) {
    if (string.isEmpty) {
      return string;
    } else if (string.length == 1) {
      return string.toUpperCase();
    } else {
      return '${string[0].toUpperCase()}${string.substring(1)}';
    }
  }

  void dispose() {
    _stateController.close();
    _model.removeListener(_updateState);
  }
}
