import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_clock_helper/model.dart';
import 'package:recursive_clock/clock/inherited/clock_updater.dart';
import 'package:recursive_clock/clock/model/time.dart';
import 'package:recursive_clock/clock/view/recursive_clock.dart';
import 'package:recursive_clock/clock/view_model/clock_state.dart';
import 'package:recursive_clock/clock/view_model/clock_view_model.dart';
import 'package:recursive_clock/clock_info_layout.dart';
import 'package:recursive_clock/color/inherited/color_updater.dart';
import 'package:recursive_clock/info/inherited/info_updater.dart';
import 'package:recursive_clock/info/view/info_panel.dart';
import 'package:recursive_clock/info/view_model/info_state.dart';
import 'package:recursive_clock/info/view_model/info_view_model.dart';

/// A widget that handles dependency injection for the Recursive Clock app.
class RecursiveClockApp extends StatelessWidget {
  const RecursiveClockApp(this._model);

  final ClockModel _model;

  @override
  Widget build(BuildContext context) => ColorUpdater(
        child: InfoUpdater(
          InfoViewModel(
            stateController: StreamController<InfoState>(),
            model: _model,
          ),
          child: ClockUpdater(
            ClockViewModel(
              stateController: StreamController<ClockState>(),
              model: const Time(),
            ),
            child: const ClockInfoLayout(
              infoPanel: InfoPanel(),
              clock: RecursiveClock(),
            ),
          ),
        ),
      );
}
