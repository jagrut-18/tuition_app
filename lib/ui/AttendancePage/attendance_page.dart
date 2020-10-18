import 'package:flutter/material.dart';
import 'package:tution_student/ui/AttendancePage/mobile_attendance_page.dart';
import 'package:tution_student/ui/AttendancePage/tablet_attendance_page.dart';
import 'package:tution_student/utils/screen_layout.dart';

class AttendancePage extends StatelessWidget {
  final List<String> optedSubjects;

  const AttendancePage({Key key, @required this.optedSubjects})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScreenLayout(
      mobile: MobileAttendancePage(
        optedSubjects: optedSubjects,
      ),
      tablet: TabletAttendancePage(),
    );
  }
}
