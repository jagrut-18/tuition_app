import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:tution_student/colors/colors.dart';
import 'package:tution_student/ui/AttendancePage/Widgets/calendar_widget.dart';

class AttendanceSubjectCard extends StatefulWidget {
  final Color color;
  final String subject;
  final String percentage;

  const AttendanceSubjectCard(
      {Key key,
      this.color = Colors.blue,
      @required this.subject,
      @required this.percentage})
      : super(key: key);
  @override
  _AttendanceSubjectCardState createState() => _AttendanceSubjectCardState();
}

class _AttendanceSubjectCardState extends State<AttendanceSubjectCard> {
  bool extensionToggle = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(0, 10),
                blurRadius: 15,
              ),
            ]),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 10,
                top: 10,
                bottom: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Text(
                        widget.subject,
                        style: TextStyle(
                            fontSize: 20,
                            color: darkGreyText,
                            fontWeight: FontWeight.w900),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: dividerColor, width: 15),
                        ),
                        child: Center(
                          child: CustomPaint(
                            foregroundPainter: AttendanceGaugePainter(
                              color: widget.color,
                              percentage: double.parse(widget.percentage),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('Present'),
                          SizedBox(
                            width: 10,
                          ),
                          CircleAvatar(
                            radius: 8,
                            backgroundColor: widget.color,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('Absent'),
                          SizedBox(
                            width: 10,
                          ),
                          CircleAvatar(
                            radius: 8,
                            backgroundColor: dividerColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 1,
              color: dividerColor,
            ),
            extensionToggle
                ? Column(
                    children: [
                      CalendarWidget(),
                      Container(
                        height: 1,
                        color: dividerColor,
                      ),
                    ],
                  )
                : Container(),
            InkWell(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15)),
              child: Container(
                height: 40,
                child: Center(
                    child: Text(
                  extensionToggle ? 'Close' : 'View Full Details',
                  style: TextStyle(color: lightGreytext),
                )),
              ),
              onTap: () {
                setState(() {
                  extensionToggle = !extensionToggle;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class AttendanceGaugePainter extends CustomPainter {
  final double percentage;
  final Color color;

  AttendanceGaugePainter({this.color = Colors.blue, this.percentage = 50});

  @override
  void paint(Canvas canvas, Size size) {
    var rect = Rect.fromCircle(center: Offset(0, 0), radius: 32);
    final startAngle = -math.pi / 2;
    final sweepAngle = (2 * math.pi) * (percentage / 100);
    var paint = Paint()
      ..color = color
      ..strokeWidth = 15
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    canvas.drawArc(rect, startAngle, sweepAngle, false, paint);
    final textSpan = TextSpan(
        style: new TextStyle(
            color: lightGreytext,
            fontWeight: FontWeight.bold,
            fontSize: 18,
            fontFamily: 'VarelaRound'),
        text: percentage.round().toString());
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(
      canvas,
      Offset(
        (size.width - textPainter.width) * 0.5,
        (size.height - textPainter.height) * 0.5,
      ),
    );
  }

  @override
  bool shouldRepaint(AttendanceGaugePainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(AttendanceGaugePainter oldDelegate) => false;
}
