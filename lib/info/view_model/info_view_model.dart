import 'dart:async';

import 'package:recursive_clock/helper/model.dart';
import 'package:recursive_clock/info/view_model/info_state.dart';

class InfoViewModel {
  InfoViewModel(this._model);

  final ClockModel _model;
  final _stateController = StreamController<InfoState>();

  void init() {
    _model.addListener(_updateState);
    _updateState();
  }

  void _updateState() {
    final newState = InfoState(
      temperature: _model.temperatureString,
      temperatureRange: '(${_model.low} - ${_model.highString})',
      condition: _model.weatherString,
      location: _model.location,
    );
    _stateController.sink.add(newState);
  }

  Stream<InfoState> get stateStream => _stateController.stream;

  InfoState get initialData => InfoState.empty();

  void dispose() {
    _stateController.close();
    _model.removeListener(_updateState);
  }
}
