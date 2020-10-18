import 'package:flutter/material.dart';
import 'package:tution_student/utils/screen_size.dart';
import 'package:tution_student/utils/screen_type.dart';

class ResponsiveBuilder extends StatelessWidget {
  final Widget Function(BuildContext context, SizingInfo sizingInfo) builder;

  const ResponsiveBuilder({Key key, this.builder}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);

    return LayoutBuilder(builder: (context, boxConstraints) {
      var sizingInfo = SizingInfo(
        screenType: getScreenType(mediaQuery),
        screenSize: mediaQuery.size,
        localWidgetSize:
            Size(boxConstraints.maxWidth, boxConstraints.maxHeight),
      );
      return builder(context, sizingInfo);
    });
  }
}
