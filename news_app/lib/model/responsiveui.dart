import 'dart:math';

import 'package:flutter/material.dart';

class ResponsiveUi {
  ResponsiveUi._private();
  static final _shared = ResponsiveUi._private();
  factory ResponsiveUi() => _shared;
  double getMediaQueryHeight(
      {required BuildContext context, required num value}) {
    var size = MediaQuery.of(context).size;
    double xdHeight = 812;
    double precentage = (value / xdHeight * 100).roundToDouble() / 100;
    return size.height * precentage;
  }

  double getMediaQueryWidth(
      {required BuildContext context, required num value}) {
    var size = MediaQuery.of(context).size;
    double xdWidth = 375;
    double precentage = (value / xdWidth * 100).roundToDouble() / 100;
    return size.width * precentage;
  }

  double textScaleFactor(BuildContext context,
      {double maxTextScaleFactor = 2}) {
    final width = MediaQuery.of(context).size.width;
    double val = (width / 1400) * maxTextScaleFactor;
    return max(1, min(val, maxTextScaleFactor));
  }
}
