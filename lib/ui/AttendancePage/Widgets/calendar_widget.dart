import 'package:flutter/material.dart';
import 'package:tution_student/colors/colors.dart';

class CalendarWidget extends StatefulWidget {
  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  DateTime currentDate = DateTime.now();

  Map months = {
    1: 'Jan',
    2: 'Feb',
    3: 'Mar',
    4: 'Apr',
    5: 'May',
    6: 'Jun',
    7: 'Jul',
    8: 'Aug',
    9: 'Sep',
    10: 'Oct',
    11: 'Nov',
    12: 'Dec',
  };
  Map weekdays = {
    1: 'Mon',
    2: 'Tue',
    3: 'Wed',
    4: 'Thu',
    5: 'Fri',
    6: 'Sat',
    7: 'Sun',
  };

  Map attendance = {
    '2020-6-1': 'A',
    '2020-6-2': 'None',
    '2020-6-3': 'P',
    '2020-6-4': 'A',
    '2020-6-5': 'P',
    '2020-6-6': 'P',
    '2020-6-7': 'A',
    '2020-6-8': 'P',
    '2020-6-9': 'A',
    '2020-6-10': 'P',
    '2020-6-11': 'P',
    '2020-6-12': 'A',
    '2020-6-13': 'P',
    '2020-6-14': 'P',
    '2020-6-15': 'A',
    '2020-6-16': 'None',
    '2020-6-17': 'None',
    '2020-6-18': 'P',
    '2020-6-19': 'None',
    '2020-6-20': 'A',
    '2020-6-21': 'P',
    '2020-6-22': 'P',
    '2020-6-23': 'P',
    '2020-6-24': 'P',
    '2020-6-25': 'A',
    '2020-6-26': 'P',
    '2020-6-27': 'A',
    '2020-6-28': 'P',
    '2020-6-29': 'P',
    '2020-6-30': 'P'
  };

  int selectedMonth = 1;
  int selectedYear = 1;

  @override
  void initState() {
    super.initState();
    selectedMonth = currentDate.month;
    selectedYear = currentDate.year;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            FlatButton(
              child: Icon(
                Icons.navigate_before,
                color: darkGreyText,
              ),
              onPressed: () {
                setState(() {
                  if (selectedMonth == 1) {
                    selectedMonth = 12;
                    selectedYear--;
                  } else {
                    selectedMonth--;
                  }
                });
              },
            ),
            Text(
              months[selectedMonth] + ' ' + selectedYear.toString(),
              style: TextStyle(
                  color: darkGreyText,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            FlatButton(
              child: Icon(
                Icons.navigate_next,
                color: darkGreyText,
              ),
              onPressed: selectedYear == currentDate.year &&
                      selectedMonth == currentDate.month
                  ? null
                  : () {
                      setState(() {
                        if (selectedMonth == 12) {
                          selectedMonth = 1;
                          selectedYear++;
                        } else {
                          selectedMonth++;
                        }
                      });
                    },
            ),
          ],
        ),
        Table(
          children: [
                TableRow(
                  children: weekdays.values
                      .toList()
                      .map((weekday) => Center(
                            child: Text(
                              weekday,
                              style: TextStyle(color: darkGreyText),
                            ),
                          ))
                      .toList(),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: lightGreyColor,
                  ),
                ),
              ] +
              dateList(selectedYear: selectedYear, selectedMonth: selectedMonth)
                  .map((dateWidgetList) => TableRow(
                        children: dateWidgetList,
                      ))
                  .toList(),
        ),
      ],
    );
  }

  List<List<Widget>> dateList({int selectedYear, int selectedMonth}) {
    List<List<Widget>> calendar = [];

    DateTime firstDayOfMonth = DateTime(selectedYear, selectedMonth, 1);
    int numberOfDaysInMonth = DateTime(selectedYear, selectedMonth + 1, 1)
        .difference(DateTime(selectedYear, selectedMonth, 1))
        .inDays;

    int firstWeekDay = firstDayOfMonth.weekday;

    int totalNumberOfDays = numberOfDaysInMonth + firstWeekDay - 1;

    DateTime startDate =
        firstDayOfMonth.subtract(Duration(days: firstWeekDay - 1));

    List<Widget> fullList = [];

    for (var i = 0; i < totalNumberOfDays; i++) {
      String date = startDate.add(Duration(days: i)).day.toString();
      fullList.add(_dateWidget(
        extra: i < (firstWeekDay - 1),
        date: date,
        attendance: (attendance ?? const {})[selectedYear.toString() +
                '-' +
                selectedMonth.toString() +
                '-' +
                i.toString()] ??
            'None',
      ));
    }

    for (var i = 0; i < totalNumberOfDays; i += 7) {
      var end = (i + 7 < totalNumberOfDays) ? i + 7 : totalNumberOfDays;
      calendar.add(fullList.sublist(i, end));
    }
    int remainingEmptyElements = 7 - calendar[calendar.length - 1].length;
    for (var i = 0; i < remainingEmptyElements; i++) {
      calendar[calendar.length - 1].add(Text(''));
    }
    return calendar;
  }

  Widget _dateWidget(
      {@required String date,
      @required String attendance,
      @required bool extra}) {
    Color bgColor = Colors.transparent;
    Color textColor = darkGreyText;
    if (extra) {
      textColor = lightGreytext;
    } else {
      if (attendance == 'P') {
        bgColor = subjectBarRed;
        textColor = Colors.white;
      } else if (attendance == 'A') {
        bgColor = dividerColor;
      }
    }
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Text(
          date,
          style: TextStyle(color: textColor),
          textAlign: TextAlign.center,
        ),
      ),
      decoration: BoxDecoration(
        color: bgColor,
        shape: BoxShape.circle,
      ),
    );
  }
}
