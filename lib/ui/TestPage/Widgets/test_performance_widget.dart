import 'package:flutter/material.dart';
import 'package:tution_student/colors/colors.dart';

class TestPerformanceWidget extends StatefulWidget {
  final data;

  const TestPerformanceWidget({Key key, @required this.data}) : super(key: key);
  @override
  _TestPerformanceWidgetState createState() => _TestPerformanceWidgetState();
}

class _TestPerformanceWidgetState extends State<TestPerformanceWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Material(
        borderRadius: BorderRadius.circular(15),
        elevation: 7,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 10,
            ),
            Text('Overall Test Performance',
                style: TextStyle(
                    color: darkGreyText,
                    fontSize: 12,
                    fontWeight: FontWeight.bold)),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: widget.data.map<Widget>((subjectData) {
                return SubjectPerformanceBar(
                    subjectName: subjectData.subjectName,
                    percentage: double.parse(subjectData.average),
                    subjectColor: subjectBarRed);
              }).toList(),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

class SubjectPerformanceBar extends StatefulWidget {
  final String subjectName;
  final double percentage;
  final Color subjectColor;

  const SubjectPerformanceBar(
      {Key key,
      @required this.subjectName,
      @required this.percentage,
      @required this.subjectColor})
      : super(key: key);
  @override
  _SubjectPerformanceBarState createState() => _SubjectPerformanceBarState();
}

class _SubjectPerformanceBarState extends State<SubjectPerformanceBar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 100,
          width: 7,
          decoration: BoxDecoration(
            color: dividerColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: widget.percentage,
                width: 7,
                decoration: BoxDecoration(
                  color: widget.subjectColor,
                  borderRadius: BorderRadius.circular(20),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(widget.subjectName,
            style: TextStyle(color: lightGreytext, fontSize: 14))
      ],
    );
  }
}
