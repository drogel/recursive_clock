import 'package:flutter/material.dart';

abstract class Ring extends StatelessWidget {
  const Ring({
    this.strokeWidth = 1,
  })  : assert(strokeWidth != null);

  final double strokeWidth;
}