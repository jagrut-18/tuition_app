import 'package:flutter/material.dart';
import 'package:tution_student/colors/colors.dart';
import 'package:tution_student/models/HttpService/http_service.dart';
import 'package:tution_student/ui/AttendancePage/attendance_page.dart';
import 'package:tution_student/ui/HomePage/Widgets/bottom_card.dart';
import 'package:tution_student/ui/HomePage/Widgets/date_bar.dart';
import 'package:tution_student/ui/HomePage/Widgets/subjectsWidget.dart';
import 'package:tution_student/ui/TestPage/test_page.dart';

class MobileHomePage extends StatefulWidget {
  @override
  _MobileHomePageState createState() => _MobileHomePageState();
}

class _MobileHomePageState extends State<MobileHomePage> {
  //HTTP Variables
  HttpService _httpService = HttpService();
  Future _getDetails;

  //DateBar Variables
  int selectedDateIndex = 2;
  DateTime selectedDate;
  String selectedWeek;
  String dateText;

  @override
  void initState() {
    super.initState();
    _getDetails =
        _httpService.getData(urlSuffix: '/get-timetable/Batch-1_stdid1');
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
    return FutureBuilder(
        future: _getDetails,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var todayTimeTable = {};
            var data = snapshot.data;
            var enrolledSubjects = data.subjects;
            for (var subject in enrolledSubjects) {
              todayTimeTable.addEntries({
                MapEntry(subject,
                    data.timetable[selectedDate.weekday - 1][subject] ?? [])
              });
            }
            return Scaffold(
              backgroundColor: bodyColor,
              appBar: AppBar(
                elevation: 0,
                backgroundColor: bodyColor,
                title: Text('Hi, ' + data.firstName,
                    style: TextStyle(
                        color: darkGreyText,
                        fontSize: 20,
                        fontWeight: FontWeight.w700)),
              ),
              body: ListView(
                children: <Widget>[
                      DateBar(
                        selectedDateIndex: selectedDateIndex,
                        onChange: (index) {
                          setState(() {
                            selectedDateIndex = index;
                            selectedDate = DateTime.now()
                                .add(Duration(days: selectedDateIndex - 2));
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
                    ] +
                    homeSubjectsWidget(
                        dateText: selectedDateIndex == 2 ? 'Today' : dateText,
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
                            GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => TestPage()));
                                },
                                child: TestBottomCard()),
                            SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => AttendancePage(
                                                optedSubjects: enrolledSubjects,
                                              )));
                                },
                                child: AttendanceBottomCard()),
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                      )
                    ],
              ),
            );
          }
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}
