import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:tution_student/models/home_page_model.dart';

class HttpService {
  final baseUrl = 'http://demo2034316.mockable.io';
  Map<String, String> headers = {"Accept": "application/json"};

  Future getData({@required String urlSuffix}) async {
    Response response = await get(baseUrl + urlSuffix, headers: headers);
    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      final homePageModel = homePageModelFromJson(response.body);
      return homePageModel;
    } else {
      return null;
    }
  }
  // Future getData({@required String urlSuffix}) async {
  //   Response response = await get(baseUrl + urlSuffix, headers: headers);
  //   if (response.statusCode == 200) {
  //     print(jsonDecode(response.body));
  //     final homePageModel = homePageModelFromJson(response.body);
  //     return homePageModel;
  //   } else {
  //     return null;
  //   }
  // }
}
