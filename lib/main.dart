
import 'package:flutter/material.dart';

import 'pages/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lin.JY APP',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.green[600],
      ),
      home: Center(
        child: Home(),
      )
    );
  }
}
