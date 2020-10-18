import 'package:flutter/material.dart';
import 'package:tution_student/colors/colors.dart';
import 'package:tution_student/utils/responsive_builder.dart';
import 'package:tution_student/utils/screen_type.dart';

class TestBottomCard extends StatefulWidget {
  @override
  _TestBottomCardState createState() => _TestBottomCardState();
}

class _TestBottomCardState extends State<TestBottomCard> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInfo) {
      return Container(
        height: 80,
        width: sizingInfo.screenType == ScreenType.Tablet
            ? sizingInfo.screenSize.width * 0.70
            : sizingInfo.screenSize.width - 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          gradient: LinearGradient(colors: [
            Color(0xff4364F7),
            Color(0xff0052D4),
            Color(0xff4364F7),
          ]),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Test',
                      style: TextStyle(color: Colors.white, fontSize: 28)),
                  Text(
                    'Next : ' + '25th Aug 2020',
                    style: TextStyle(color: Color(0xffE5E5E5), fontSize: 12),
                  )
                ],
              ),
              Container(
                height: 50,
                width: 50,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Image.asset('assets/test.png'),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: bottomCardIconBg,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

class AttendanceBottomCard extends StatefulWidget {
  @override
  _AttendanceBottomCardState createState() => _AttendanceBottomCardState();
}

class _AttendanceBottomCardState extends State<AttendanceBottomCard> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInfo) {
      return Container(
        height: 80,
        width: sizingInfo.screenType == ScreenType.Tablet
            ? sizingInfo.screenSize.width * 0.70
            : sizingInfo.screenSize.width - 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            gradient: LinearGradient(colors: [
              Color(0xff4364F7),
              Color(0xff0052D4),
              Color(0xff4364F7),
            ])),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Attendance',
                      style: TextStyle(color: Colors.white, fontSize: 28)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '50%',
                        style:
                            TextStyle(color: Color(0xffE5E5E5), fontSize: 12),
                      ),
                      Container(
                        height: 2,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 2,
                              width: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xffF88C4F),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                height: 50,
                width: 50,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Image.asset('assets/attendance.png'),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: bottomCardIconBg,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
