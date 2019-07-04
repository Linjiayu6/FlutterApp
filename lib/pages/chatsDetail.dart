
import 'package:flutter/material.dart';

class ChatsDetail extends StatefulWidget {
  ChatsDetail({ Key key}) : super(key: key);
  
  ChatsDetailState createState () => ChatsDetailState();
}

class ChatsDetailState extends State<ChatsDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        // webview 上面标题
        title: new Text('KeepLand 疯狂健身群'),
      ),
      body: Center(
        child: Text('详情群聊'),
      )
    );
  }
}
