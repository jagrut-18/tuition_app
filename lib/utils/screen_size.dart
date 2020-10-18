import 'package:flutter/material.dart';
import 'package:tution_student/utils/screen_type.dart';

class SizingInfo {
  final Orientation orientation;
  final ScreenType screenType;
  final Size screenSize;
  final Size localWidgetSize;

  SizingInfo(
      {this.orientation,
      this.screenType,
      this.screenSize,
      this.localWidgetSize});
}
