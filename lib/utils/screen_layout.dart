import 'package:flutter/material.dart';
import 'package:tution_student/utils/responsive_builder.dart';
import 'package:tution_student/utils/screen_type.dart';

class ScreenLayout extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const ScreenLayout({Key key, this.mobile, this.tablet, this.desktop})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInfo) {
      if (sizingInfo.screenType == ScreenType.Desktop) {
        if (desktop != null) {
          return desktop;
        }
      }
      if (sizingInfo.screenType == ScreenType.Tablet) {
        if (tablet != null) {
          return tablet;
        }
      }
      return mobile;
    });
  }
}
