import 'dart:math';
import 'package:flutter/cupertino.dart';

class ScaleSize {
  static double textScaleFactor(BuildContext context, {double maxTextScaleFactor = 2}) {
    final width = MediaQuery.of(context).size.width;
    double val = (width / 1280) * maxTextScaleFactor;
    return max(1, min(val, maxTextScaleFactor));
  }
}