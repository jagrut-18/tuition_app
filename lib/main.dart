import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp()); // This runs the app
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(
          title:
              'Flutter Demo Home Page'), //A widget MyHomePage in which title is passed as parameter
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //This two controls textfields
  TextEditingController textC = TextEditingController();

  //Just variables
  String fetchedData = 'No data yet';
  String url = 'http://10.0.2.2:5000/';
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // a base of an app on which everything is build (kind of canvas)
      appBar: AppBar(
        title: Text(widget.title), //Title bar
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 20), // 20 padding on both left and right
          child: SingleChildScrollView(
            // This is used for scrolling mechanism
            child: Column(
              // Arrange widgets in a column
              mainAxisAlignment: MainAxisAlignment
                  .center, // main-axis of column is vertical and cross-axis is horizontal
              children: <Widget>[
                TextField(
                  controller: textC,
                  decoration: InputDecoration(
                    labelText: 'Name',
                  ),
                ),
                FlatButton(
                  child: Text('Submit'),
                  color: Colors.blue[100],
                  onPressed: () {
                    var client = http.Client();
                    client
                        .get(url + 'save/' + textC.text)
                        .then((response) => print(response.body));
                  },
                ),
                SizedBox(
                  height: 50, //just of space between two widgets
                ),
                !loading
                    ? Text('DATA : ' + fetchedData)
                    : CircularProgressIndicator(), //changing widgets using if/else
                FlatButton(
                  child: Text('Fetch Data'),
                  color: Colors.blue[100],
                  onPressed: () {
                    setState(() {
                      loading = true; //this helps in showing loading widget
                      var client = http.Client();
                      client.get(url + 'get').then((response) {
                        setState(() {
                          if (response.statusCode == 200) {
                            print(response.body);
                            var data = jsonDecode(response.body);
                            fetchedData = data['name'];
                            loading = false;
                          }
                        });
                      });
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
