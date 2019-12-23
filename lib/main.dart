// Copyright 2019 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:recursive_clock/clock_info_layout.dart';
import 'package:recursive_clock/helper/customizer.dart';
import 'package:recursive_clock/info/inherited/info_updater.dart';
import 'package:recursive_clock/info/view_model/info_view_model.dart';
import 'package:recursive_clock/color/inherited/color_updater.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // A temporary measure until Platform supports web and TargetPlatform supports
  // macOS.
  if (!kIsWeb && Platform.isMacOS) {
    // TODO(gspencergoog): Update this when TargetPlatform includes macOS.
    // https://github.com/flutter/flutter/issues/31366
    // See https://github.com/flutter/flutter/wiki/Desktop-shells#target-platform-override.
    debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  }

  runApp(
    ClockCustomizer(
      (model) => ColorUpdater(
        child: InfoUpdater(
          InfoViewModel(model),
          child: const ClockInfoLayout(),
        ),
      ),
    ),
  );
}
