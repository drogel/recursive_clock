import 'dart:async';

import 'package:flutter/material.dart';
import 'package:recursive_clock/clock/view/recursive_clock.dart';
import 'package:recursive_clock/clock_info_layout.dart';
import 'package:recursive_clock/color/inherited/color_updater.dart';
import 'package:recursive_clock/helper/model.dart';
import 'package:recursive_clock/info/inherited/info_updater.dart';
import 'package:recursive_clock/info/view/info_panel.dart';
import 'package:recursive_clock/info/view_model/info_state.dart';
import 'package:recursive_clock/info/view_model/info_view_model.dart';

class RecursiveClockApp extends StatelessWidget {
  const RecursiveClockApp(this._model);

  final ClockModel _model;

  @override
  Widget build(BuildContext context) => ColorUpdater(
        child: InfoUpdater(
          InfoViewModel(
            model: _model,
            stateController: StreamController<InfoState>(),
          ),
          child: const ClockInfoLayout(
            infoPanel: InfoPanel(),
            clock: RecursiveClock(),
          ),
        ),
      );
}
