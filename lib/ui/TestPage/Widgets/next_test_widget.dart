import 'package:flutter/material.dart';
import 'package:tution_student/colors/colors.dart';

class NextTestWidget extends StatelessWidget {
  final String date;
  final String timeSlot;
  final String subject;

  const NextTestWidget(
      {Key key,
      @required this.date,
      @required this.timeSlot,
      @required this.subject})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          date,
          style: TextStyle(
              color: blueText, fontSize: 32, fontWeight: FontWeight.bold),
        ),
        Text(
          timeSlot,
          style: TextStyle(
              color: blueText, fontSize: 32, fontWeight: FontWeight.bold),
        ),
        Text(subject,
            style: TextStyle(
                color: darkGreyText, fontSize: 20, fontWeight: FontWeight.w700))
      ],
    );
  }
}
