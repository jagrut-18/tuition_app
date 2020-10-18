import 'package:flutter/material.dart';
import 'colors/colors.dart';

class NextPage extends StatefulWidget {
  @override
  _NextPageState createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  int datebarLength = 10;

  int selectedDateIndex = 2;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: bodyColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:
            homeSubjectsWidget(screenWidth: screenWidth, subjectsAndTimeSlots: {
          'Maths': {'color': subjectBarRed, 'timeSlot': '6:00PM to 7:00PM'},
          'Physics': {
            'color': subjectBarYellow,
            'timeSlot': '7:00PM to 8:00PM'
          },
          'Chemistry': {
            'color': subjectBarGreen,
            'timeSlot': '8:00PM to 9:00PM'
          },
        }),
      ),
    );
  }

  List<Widget> buildDateBar(screenWidth) {
    List<Widget> dateBar = [];
    DateTime tempDate = DateTime.now().subtract(Duration(days: 2));
    Map<int, String> weekday = {
      1: 'Mon',
      2: 'Tue',
      3: 'Wed',
      4: 'Thu',
      5: 'Fri',
      6: 'Sat',
      7: 'Sun'
    };
    for (int index = 0; index < datebarLength; index++) {
      dateBar.add(Container(
        height: 100,
        width: (screenWidth - 70) / 5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              weekday[tempDate.add(Duration(days: index)).weekday],
              style: selectedDateIndex == index
                  ? TextStyle(
                      color: blueText,
                      fontSize: 18,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w700)
                  : TextStyle(
                      color: blueText,
                      fontSize: 14,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w700),
            ),
            Text(
              tempDate.add(Duration(days: index)).day.toString(),
              style: selectedDateIndex == index
                  ? TextStyle(
                      color: blueText,
                      fontSize: 28,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w700)
                  : TextStyle(
                      color: blueText,
                      fontSize: 24,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ));
    }
    return dateBar;
  }

  List<Widget> homeSubjectsWidget(
      {screenWidth, Map<String, Map> subjectsAndTimeSlots}) {
    List<Widget> dateAndSubjectList = [
      DefaultTabController(
        length: datebarLength,
        initialIndex: 2,
        child: Column(
          children: [
            Container(
              color: dividerColor,
              height: 1,
            ),
            SizedBox(
              height: 7,
            ),
            TabBar(
              indicator: CustomTabIndicator(),
              isScrollable: true,
              labelPadding: EdgeInsets.zero,
              tabs: buildDateBar(screenWidth),
              onTap: (index) {
                setState(() {
                  selectedDateIndex = index;
                });
              },
            ),
            SizedBox(
              height: 7,
            ),
            Container(
              color: dividerColor,
              height: 1,
            ),
          ],
        ),
      ),
    ];
    String dateText = 'Today';
    Map<int, String> months = {
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
    if (selectedDateIndex < 2) {
      DateTime date =
          DateTime.now().subtract(Duration(days: 2 - selectedDateIndex));
      dateText = date.day.toString() + 'th ' + months[date.month];
    } else if (selectedDateIndex > 2) {
      DateTime date = DateTime.now().add(Duration(days: selectedDateIndex - 2));
      dateText = date.day.toString() + 'th ' + months[date.month];
    }
    dateAndSubjectList.add(Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Text(dateText,
          style: TextStyle(
              color: greyText, fontSize: 20, fontWeight: FontWeight.w700)),
    ));
    //http request will provide subjects(timetable) for a specific date.
    List<String> subjects = subjectsAndTimeSlots.keys.toList();
    dateAndSubjectList.add(Expanded(
      child: ListView.builder(
          itemCount: subjectsAndTimeSlots.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
              child: Container(
                height: 80,
                decoration: BoxDecoration(
                    color: subjectsAndTimeSlots[subjects[index]]['color']
                        .withOpacity(0.07),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 10,
                      decoration: BoxDecoration(
                        color: subjectsAndTimeSlots[subjects[index]]['color'],
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          subjects[index],
                          style: TextStyle(
                              color: darkGreyText,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          subjectsAndTimeSlots[subjects[index]]['timeSlot'],
                          style: TextStyle(color: lightGreytext, fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
    ));
    return dateAndSubjectList;
  }
}

class CustomTabIndicator extends Decoration {
  @override
  _CustomPainter createBoxPainter([VoidCallback onChanged]) {
    return new _CustomPainter(this, onChanged);
  }
}

class _CustomPainter extends BoxPainter {
  final CustomTabIndicator decoration;

  _CustomPainter(this.decoration, VoidCallback onChanged)
      : assert(decoration != null),
        super(onChanged);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration != null);
    assert(configuration.size != null);

    //offset is the position from where the decoration should be drawn.
    //configuration.size tells us about the height and width of the tab.
    final Rect rect = offset & configuration.size;
    final Paint paint = Paint();
    paint.color = dateIndicator;
    paint.style = PaintingStyle.fill;
    canvas.drawRRect(
        RRect.fromRectAndRadius(rect, Radius.circular(10.0)), paint);
  }
}
