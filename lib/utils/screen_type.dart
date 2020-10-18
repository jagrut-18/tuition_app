import 'package:flutter/material.dart';

enum ScreenType {
  Mobile,
  Tablet,
  Desktop,
}

ScreenType getScreenType(MediaQueryData mediaQuery) {
  double deviceWidth = mediaQuery.size.width;
  if (deviceWidth > 950) {
    return ScreenType.Desktop;
  }
  if (deviceWidth > 600) {
    return ScreenType.Tablet;
  }
  return ScreenType.Mobile;
}
