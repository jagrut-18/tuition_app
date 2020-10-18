import 'package:flutter/material.dart';
import 'package:tution_student/colors/colors.dart';
import 'package:tution_student/ui/HomePage/Widgets/bottom_card.dart';
import 'package:tution_student/ui/HomePage/Widgets/date_bar.dart';
import 'package:tution_student/ui/HomePage/Widgets/subjectsWidget.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TabletHomePage extends StatefulWidget {
  @override
  _TabletHomePageState createState() => _TabletHomePageState();
}

class _TabletHomePageState extends State<TabletHomePage> {
  Map<String, List> todayTimeTable = {};

  //DateBar Variables
  int selectedDateIndex = 2;
  DateTime selectedDate;
  String selectedWeek;
  String dateText;

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now().add(Duration(days: selectedDateIndex - 2));
    selectedWeek = DateBar.weekday[
        DateTime.now().add(Duration(days: selectedDateIndex - 2)).weekday];
    dateText = selectedDate.day.toString() +
        ' ' +
        DateBar.months[selectedDate.month] +
        ', ' +
        selectedDate.year.toString();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: bodyColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: bodyColor,
        title: Text('Hi, Student Name',
            style: TextStyle(
                color: darkGreyText,
                fontSize: 20,
                fontWeight: FontWeight
                    .w700)), //TODO: Http request will provide student name
      ),
      body: Row(
        children: [
          RotatedBox(
            quarterTurns: 1,
            child: DateBar(
              selectedDateIndex: selectedDateIndex,
              onChange: (index) {
                setState(() {
                  selectedDateIndex = index;
                  selectedDate =
                      DateTime.now().add(Duration(days: selectedDateIndex - 2));
                  selectedWeek = DateBar.weekday[DateTime.now()
                      .add(Duration(days: selectedDateIndex - 2))
                      .weekday];
                  dateText = selectedDate.day.toString() +
                      ' ' +
                      DateBar.months[selectedDate.month] +
                      ', ' +
                      selectedDate.year.toString();
                });
              },
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: homeSubjectsWidget(
                      dateText: dateText,
                      screenWidth: screenWidth,
                      subjectsAndTimeSlots: todayTimeTable) +
                  [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          TestBottomCard(),
                          SizedBox(
                            width: 10,
                          ),
                          AttendanceBottomCard(),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    )
                  ],
            ),
          ),
        ],
      ),
    );
  }
}
