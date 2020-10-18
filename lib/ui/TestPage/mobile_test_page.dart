import 'package:flutter/material.dart';
import 'package:tution_student/colors/colors.dart';
import 'package:tution_student/ui/TestPage/HttpService/http_service.dart';
import 'package:tution_student/ui/TestPage/Widgets/next_test_widget.dart';
import 'package:tution_student/ui/TestPage/Widgets/subject_wise_test_history.dart';
import 'package:tution_student/ui/TestPage/Widgets/test_performance_widget.dart';
import 'package:tution_student/ui/TestPage/model/test_page_model.dart';

class MobileTestPage extends StatefulWidget {
  @override
  _MobileTestPageState createState() => _MobileTestPageState();
}

class _MobileTestPageState extends State<MobileTestPage> {
  //HTTP Variables
  HttpService _httpService = HttpService();
  Future _getTestDetails;

  @override
  void initState() {
    super.initState();
    _getTestDetails = _httpService.getData(urlSuffix: '/get-test-details');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bodyColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: bodyColor,
          title: Text(
            'Test Details',
            style: TextStyle(color: darkGreyText, fontWeight: FontWeight.w700),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios),
            color: darkGreyText,
          ),
        ),
        body: FutureBuilder(
            future: _getTestDetails,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                TestDetails data = snapshot.data;
                return Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      NextTestWidget(
                        date: data.nextTestDetails.date,
                        timeSlot: data.nextTestDetails.timeslot,
                        subject: data.nextTestDetails.subjectName,
                      ),
                      TestPerformanceWidget(
                        data: data.testHistory,
                      ),
                      Expanded(
                          flex: 3,
                          child: SubjectWiseTestHistory(
                            data: data.testHistory,
                            optedSubjects: data.optedSubjects,
                          )),
                    ],
                  ),
                );
              }
              return Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }
}
