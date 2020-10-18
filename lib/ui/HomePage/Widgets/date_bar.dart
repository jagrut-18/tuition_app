import 'package:flutter/material.dart';
import 'package:tution_student/colors/colors.dart';
import 'package:tution_student/utils/responsive_builder.dart';
import 'package:tution_student/utils/screen_type.dart';

class DateBar extends StatefulWidget {
  final int selectedDateIndex;
  final Function(int) onChange;
  static Map<int, String> weekday = {
    1: 'Mon',
    2: 'Tue',
    3: 'Wed',
    4: 'Thu',
    5: 'Fri',
    6: 'Sat',
    7: 'Sun'
  };
  static Map<int, String> months = {
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

  const DateBar(
      {Key key, @required this.selectedDateIndex, @required this.onChange})
      : super(key: key);

  @override
  _DateBarState createState() => _DateBarState();
}

class _DateBarState extends State<DateBar> {
  DateTime tempDate = DateTime.now().subtract(Duration(days: 2));
  @override
  Widget build(BuildContext context) {
    return Container(
      child: DefaultTabController(
        length: 7,
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
              tabs: List.generate(
                  7,
                  (index) => ResponsiveBuilder(builder: (context, sizingInfo) {
                        return Container(
                          height: sizingInfo.screenType == ScreenType.Tablet
                              ? (sizingInfo.screenSize.width - 70) / 5
                              : 100,
                          width: sizingInfo.screenType == ScreenType.Tablet
                              ? (sizingInfo.screenSize.height - 70) / 5
                              : (sizingInfo.screenSize.width - 70) / 5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: RotatedBox(
                            quarterTurns:
                                sizingInfo.screenType == ScreenType.Tablet
                                    ? 3
                                    : 0,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  DateBar.weekday[tempDate
                                      .add(Duration(days: index))
                                      .weekday],
                                  style: widget.selectedDateIndex == index
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
                                  tempDate
                                      .add(Duration(days: index))
                                      .day
                                      .toString(),
                                  style: widget.selectedDateIndex == index
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
                          ),
                        );
                      })),
              onTap: (index) {
                widget.onChange(index);
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
    );
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
