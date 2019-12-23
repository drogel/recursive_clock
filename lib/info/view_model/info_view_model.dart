
import 'dart:async';

import 'package:recursive_clock/helper/model.dart';
import 'package:recursive_clock/info/view_model/info_state.dart';

class InfoViewModel {
  InfoViewModel(this._model);

  final ClockModel _model;

  final _stateStreamController = StreamController<InfoState>();

  Stream<InfoState> get stateStream => _stateStreamController.stream;

  InfoState get initialData => InfoState();

  void dispose() {
    _stateStreamController.close();
    // TODO: remove model listeners
  }
}