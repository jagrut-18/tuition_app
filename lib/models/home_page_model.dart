// To parse this JSON data, do
//
//     final homePageModel = homePageModelFromJson(jsonString);

import 'dart:convert';

HomePageModel homePageModelFromJson(String str) =>
    HomePageModel.fromJson(json.decode(str));

String homePageModelToJson(HomePageModel data) => json.encode(data.toJson());

class HomePageModel {
  HomePageModel({
    this.firstName,
    this.batchName,
    this.subjects,
    this.timetable,
  });

  String firstName;
  String batchName;
  List<String> subjects;
  List<dynamic> timetable;

  factory HomePageModel.fromJson(Map<String, dynamic> json) => HomePageModel(
        firstName: json["first_name"],
        batchName: json["batch_name"],
        subjects: List<String>.from(json["subjects"].map((x) => x)),
        timetable: List<dynamic>.from(json["timetable"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "batch_name": batchName,
        "subjects": List<dynamic>.from(subjects.map((x) => x)),
        "timetable": List<dynamic>.from(timetable.map((x) => x)),
      };
}
