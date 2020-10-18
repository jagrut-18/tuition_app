import 'package:flutter/material.dart';
import 'package:tution_student/colors/colors.dart';
import 'package:tution_student/ui/TestPage/model/test_page_model.dart';
import 'package:tution_student/utils/responsive_builder.dart';

class SubjectWiseTestHistory extends StatefulWidget {
  final data;
  final List<String> optedSubjects;

  const SubjectWiseTestHistory(
      {Key key, @required this.data, @required this.optedSubjects})
      : super(key: key);
  @override
  _SubjectWiseTestHistoryState createState() => _SubjectWiseTestHistoryState();
}

class _SubjectWiseTestHistoryState extends State<SubjectWiseTestHistory> {
  // Map data = {
  //   'Subject1': {
  //     0: {
  //       'date': '17th May 2020',
  //       'marks': 18,
  //       'total': 20,
  //     },
  //     1: {
  //       'date': '10th Jun 2020',
  //       'marks': 12,
  //       'total': 20,
  //     },
  //     2: {
  //       'date': '07th Apr 2020',
  //       'marks': 18,
  //       'total': 30,
  //     }
  //   },
  //   'Subject2': {
  //     0: {
  //       'date': '17th May 2020',
  //       'marks': 18,
  //       'total': 20,
  //     },
  //     1: {
  //       'date': '07th May 2020',
  //       'marks': 19,
  //       'total': 20,
  //     },
  //     2: {
  //       'date': '05th Apr 2020',
  //       'marks': 08,
  //       'total': 30,
  //     }
  //   },
  //   'Subject3': {
  //     0: {
  //       'date': '17th May 2020',
  //       'marks': 18,
  //       'total': 20,
  //     },
  //     1: {
  //       'date': '10th Jun 2020',
  //       'marks': 12,
  //       'total': 20,
  //     },
  //   },
  // };
  // List<String> subjects = ['Subject1', 'Subject2', 'Subject3'];
  String selectedSubject;

  @override
  void initState() {
    super.initState();
    selectedSubject = widget.optedSubjects[0];
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInfo) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 40,
            width: sizingInfo.screenSize.width - 20,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: widget.optedSubjects
                    .map<Widget>((subject) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: GestureDetector(
                            child: Container(
                              height: 40,
                              width: (sizingInfo.screenSize.width - 50) / 3,
                              decoration: BoxDecoration(
                                color: selectedSubject == subject
                                    ? blueText
                                    : dividerColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  subject,
                                  style: TextStyle(
                                      color: selectedSubject == subject
                                          ? Colors.white
                                          : darkGreyText,
                                      fontSize: 16),
                                ),
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                selectedSubject = subject;
                              });
                            },
                          ),
                        ))
                    .toList(),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: getMarksHistory(widget.data, selectedSubject)
                  .marksHistory
                  .map<Widget>((marksHistory) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 6,
                          ),
                          Container(
                            height: 10,
                            width: 10,
                            decoration: BoxDecoration(
                              color: darkGreyText,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            marksHistory.date,
                            style: TextStyle(color: darkGreyText, fontSize: 16),
                          ),
                          Container(
                            height: 2,
                            width: sizingInfo.screenSize.width * 0.60,
                            decoration: BoxDecoration(
                              color: dividerColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: 2,
                                  width: (sizingInfo.screenSize.width * 0.60) *
                                      (int.parse(marksHistory.marks) /
                                          int.parse(marksHistory.total)),
                                  decoration: BoxDecoration(
                                      color: darkGreyText,
                                      borderRadius: BorderRadius.circular(10)),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Text(
                        marksHistory.marks + '/' + marksHistory.total,
                        style: TextStyle(color: darkGreyText, fontSize: 16),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      );
    });
  }

  getMarksHistory(List<TestHistory> data, String selectedSubject) {
    for (var subjectData in data) {
      if (selectedSubject == subjectData.subjectName) {
        return subjectData;
      }
    }
  }
}
