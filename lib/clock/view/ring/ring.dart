import 'package:flutter/material.dart';

/// Base class for widgets that are shaped like a ring.
abstract class Ring extends StatelessWidget {
  const Ring({
    this.strokeWidth = 1,
  })  : assert(strokeWidth != null);

  final double strokeWidth;
}