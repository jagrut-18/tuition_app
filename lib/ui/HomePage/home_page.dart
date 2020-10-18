import 'package:flutter/material.dart';
import 'package:tution_student/ui/HomePage/mobile_home_page.dart';
import 'package:tution_student/ui/HomePage/tablet_home_page.dart';
import 'package:tution_student/utils/screen_layout.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenLayout(
      mobile: MobileHomePage(),
      tablet: TabletHomePage(),
    );
  }
}
