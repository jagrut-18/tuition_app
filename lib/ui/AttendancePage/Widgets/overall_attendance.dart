import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:tution_student/colors/colors.dart';

class OverallAttendance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '89%',
          style: TextStyle(
              color: blueText, fontSize: 30, fontWeight: FontWeight.bold),
        ),
        Text(
          'Overall Attendance',
          style: TextStyle(
            color: darkGreyText,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
