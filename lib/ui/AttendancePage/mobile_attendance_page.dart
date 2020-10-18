import 'package:flutter/material.dart';
import 'package:tution_student/colors/colors.dart';
import 'package:tution_student/ui/AttendancePage/Widgets/attendance_subject_card.dart';
import 'package:tution_student/ui/AttendancePage/Widgets/overall_attendance.dart';

class MobileAttendancePage extends StatefulWidget {
  final List<String> optedSubjects;

  const MobileAttendancePage({Key key, @required this.optedSubjects})
      : super(key: key);
  @override
  _MobileAttendancePageState createState() => _MobileAttendancePageState();
}

class _MobileAttendancePageState extends State<MobileAttendancePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bodyColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: bodyColor,
          title: Text(
            'Attendance Details',
            style: TextStyle(color: darkGreyText, fontWeight: FontWeight.w700),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios),
            color: darkGreyText,
          ),
        ),
        body: Column(
          children: <Widget>[
                Center(child: OverallAttendance()),
              ] +
              widget.optedSubjects.map((subject) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: AttendanceSubjectCard(
                    color: subjectBarRed,
                    subject: subject,
                    percentage: '62',
                  ),
                );
              }).toList(),
        ),
      ),
    );
  }
}
