import 'package:flutter/material.dart';
import 'package:tution_student/ui/TestPage/mobile_test_page.dart';
import 'package:tution_student/ui/TestPage/tablet_test_page.dart';
import 'package:tution_student/utils/screen_layout.dart';

class TestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenLayout(
      mobile: MobileTestPage(),
      tablet: TabletTestPage(),
    );
  }
}
