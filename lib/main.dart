
import 'package:flutter/material.dart';

import 'pages/index.dart';
import 'pages/chatWindow.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lin.JY APP',

      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.grey[300],
      ),

      home: Center(
        child: Index(),
      ),

      routes: <String, WidgetBuilder> {
        '/chats/window': (_) => ChatWindow(),
      }
    );
  }
}
