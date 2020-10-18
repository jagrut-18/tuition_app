import 'package:flutter/material.dart';
import 'package:tution_student/colors/colors.dart';

List<Widget> homeSubjectsWidget(
    {@required String dateText,
    @required screenWidth,
    @required var subjectsAndTimeSlots}) {
  List<Widget> dateAndSubjectList = [];

  dateAndSubjectList.add(Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    child: Text(dateText,
        style: TextStyle(
            color: greyText, fontSize: 20, fontWeight: FontWeight.w700)),
  ));
  subjectsAndTimeSlots.forEach((subject, timeSlots) {
    timeSlots.forEach((timeSlot) {
      dateAndSubjectList.add(
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
          child: Container(
            height: 80,
            decoration: BoxDecoration(
                color: subjectBarRed.withOpacity(0.07),
                borderRadius: BorderRadius.circular(15)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 10,
                  decoration: BoxDecoration(
                    color: subjectBarRed,
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
                      subject,
                      style: TextStyle(
                          color: darkGreyText,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      timeSlot,
                      style: TextStyle(color: lightGreytext, fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  });
  // dateAndSubjectList.add(Expanded(
  //   child: ListView.builder(
  //       itemCount: subjectsAndTimeSlots.length,
  //       itemBuilder: (context, index) {
  //         return Padding(
  //           padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
  //           child: Container(
  //             height: 80,
  //             decoration: BoxDecoration(
  //                 color: subjectBarRed
  //                     .withOpacity(0.07),
  //                 borderRadius: BorderRadius.circular(15)),
  //             child: Row(
  //               mainAxisAlignment: MainAxisAlignment.start,
  //               children: [
  //                 Container(
  //                   width: 10,
  //                   decoration: BoxDecoration(
  //                     color: subjectBarRed,
  //                     borderRadius: BorderRadius.circular(10),
  //                   ),
  //                 ),
  //                 SizedBox(
  //                   width: 30,
  //                 ),
  //                 Column(
  //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     Text(
  //                       subjects[index],
  //                       style: TextStyle(
  //                           color: darkGreyText,
  //                           fontSize: 20,
  //                           fontWeight: FontWeight.w700),
  //                     ),
  //                     Text(
  //                       subjectsAndTimeSlots[subjects[index]]['timeSlot'],
  //                       style: TextStyle(color: lightGreytext, fontSize: 14),
  //                     ),
  //                   ],
  //                 ),
  //               ],
  //             ),
  //           ),
  //         );
  //       }),
  // ));
  return dateAndSubjectList;
}
