
import 'package:flutter/material.dart';

import 'pages/index.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lin.JY APP',

      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.green,
      ),

      home: Center(
        child: Index(),
      )
    );
  }
}
