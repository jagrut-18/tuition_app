import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:tution_student/next_page.dart';
import 'package:tution_student/ui/AttendancePage/attendance_page.dart';
import 'package:tution_student/ui/HomePage/Widgets/date_bar.dart';
import 'package:tution_student/ui/HomePage/home_page.dart';
import 'package:tution_student/ui/TestPage/test_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'VarelaRound',
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String url = 'Not set';
  TextEditingController urlC = TextEditingController();

  TextEditingController usernameC = TextEditingController();
  TextEditingController passwordC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          FlatButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => NextPage()));
              },
              child: Text('Next')),
          TextField(
            controller: urlC,
            decoration: InputDecoration(hintText: 'URL'),
          ),
          FlatButton(
            onPressed: () {
              setState(() {
                url = urlC.text;
              });
            },
            child: Text(
              'Set URL',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.deepPurple,
          ),
          Text('URL : ' + url),
          TextField(
            controller: usernameC,
            decoration: InputDecoration(hintText: 'Username'),
          ),
          TextField(
            controller: passwordC,
            decoration: InputDecoration(hintText: 'Password'),
          ),
          FlatButton(
            onPressed: () {
              Map<String, String> headers = {"Accept": "application/json"};

              var json = jsonEncode({
                'username': usernameC.text,
                'password_student': passwordC.text,
              });

              http.post(url, headers: headers, body: json).then((response) {
                //response.body is the response got from the http request.
                print(response.body);
              });
            },
            child: Text(
              'Login',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.deepPurple,
          ),
        ],
      ),
    );
  }
}
