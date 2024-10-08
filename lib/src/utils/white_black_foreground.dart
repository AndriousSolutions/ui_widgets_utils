/// User Interface Widgets and Utilities
library ui_widgets_utils;

/// Copyright 2019 Andrious Solutions Ltd. All rights reserved.
/// Use of this source code is governed by a 2-clause BSD License.
/// The main directory contains that LICENSE file.
///
///          Created  14 Nov 2019
///
///

import 'dart:math';
import 'package:flutter/material.dart';

/// Supply a color depending on the provided background color.
Color whichForegroundColor(Color backgroundColor, {double bias = 0.0}) =>
    useWhiteForeground(backgroundColor, bias: bias)
        ? Colors.white
        : Colors.black;

/// Check if is good condition to use white foreground color by passing
/// the background color, and optional bias.
/// Reference: https://www.w3.org/TR/WCAG20-TECHS/G18.html
bool useWhiteForeground(Color backgroundColor, {double bias = 0.0}) {
  final v = sqrt(pow(backgroundColor.red, 2) * 0.299 +
          pow(backgroundColor.green, 2) * 0.587 +
          pow(backgroundColor.blue, 2) * 0.114)
      .round();
  return v < 130 + bias;
}
