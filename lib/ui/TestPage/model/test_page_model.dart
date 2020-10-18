// To parse this JSON data, do
//
//     final testDetails = testDetailsFromJson(jsonString);

import 'dart:convert';

TestDetails testDetailsFromJson(String str) =>
    TestDetails.fromJson(json.decode(str));

String testDetailsToJson(TestDetails data) => json.encode(data.toJson());

class TestDetails {
  TestDetails({
    this.nextTestDetails,
    this.optedSubjects,
    this.testHistory,
  });

  NextTestDetails nextTestDetails;
  List<String> optedSubjects;
  List<TestHistory> testHistory;

  factory TestDetails.fromJson(Map<String, dynamic> json) => TestDetails(
        nextTestDetails: NextTestDetails.fromJson(json["next_test_details"]),
        optedSubjects: List<String>.from(json["opted_subjects"].map((x) => x)),
        testHistory: List<TestHistory>.from(
            json["test_history"].map((x) => TestHistory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "next_test_details": nextTestDetails.toJson(),
        "opted_subjects": List<dynamic>.from(optedSubjects.map((x) => x)),
        "test_history": List<dynamic>.from(testHistory.map((x) => x.toJson())),
      };
}

class NextTestDetails {
  NextTestDetails({
    this.date,
    this.timeslot,
    this.subjectName,
  });

  String date;
  String timeslot;
  String subjectName;

  factory NextTestDetails.fromJson(Map<String, dynamic> json) =>
      NextTestDetails(
        date: json["date"],
        timeslot: json["timeslot"],
        subjectName: json["subject_name"],
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "timeslot": timeslot,
        "subject_name": subjectName,
      };
}

class TestHistory {
  TestHistory({
    this.subjectName,
    this.average,
    this.marksHistory,
  });

  String subjectName;
  String average;
  List<MarksHistory> marksHistory;

  factory TestHistory.fromJson(Map<String, dynamic> json) => TestHistory(
        subjectName: json["subject_name"],
        average: json["average"],
        marksHistory: List<MarksHistory>.from(
            json["marks_history"].map((x) => MarksHistory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "subject_name": subjectName,
        "average": average,
        "marks_history":
            List<dynamic>.from(marksHistory.map((x) => x.toJson())),
      };
}

class MarksHistory {
  MarksHistory({
    this.date,
    this.total,
    this.marks,
  });

  String date;
  String total;
  String marks;

  factory MarksHistory.fromJson(Map<String, dynamic> json) => MarksHistory(
        date: json["date"],
        total: json["total"],
        marks: json["marks"],
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "total": total,
        "marks": marks,
      };
}
