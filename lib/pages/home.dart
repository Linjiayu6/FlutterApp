
/**
 * 相当于总路由层, 
 */

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState () => HomeState();
}

class HomeState extends State<Home> {

  final List<BottomNavigationBarItem> bottomNavigationBarList = [
    new BottomNavigationBarItem(
      icon: new Icon(Icons.chat,color: Colors.grey),
      title: new Text("Chats"),
    ),
    new BottomNavigationBarItem(
      icon: new Icon(Icons.perm_contact_calendar,color: Colors.grey),
      title: new Text("Contacts"),
    ),
    new BottomNavigationBarItem(
      icon: new Icon(Icons.room,color: Colors.grey),
      title: new Text("Discover"),
    ),
    new BottomNavigationBarItem(
      icon: new Icon(Icons.perm_identity,color: Colors.grey),
      title: new Text("Me"),
    ),
  ];

  // !!! 状态数据不要写到build里面
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: new AppBar(
        // webview 上面标题
        title: new Text('WeChat'),
        // 右边的icon
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.list), onPressed: null),
        ],
      ),


      // 底部的导航button
      bottomNavigationBar: BottomNavigationBar(
        items: bottomNavigationBarList,
        // Required
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        // 当前页面索引
        currentIndex: _currentIndex,
      ),

      body: Center(
        child: Text(_currentIndex.toString())
      )
    );
  }
}
