
/**
 * 相当于总路由层, 
 */

import 'package:flutter/material.dart';

import 'chats.dart';
import 'contacts.dart';
import 'me.dart';
import 'discover.dart';

class Index extends StatefulWidget {
  @override
  IndexState createState () => IndexState();
}

class IndexState extends State<Index> {
  // final List<String> textList = ['Chats', 'Contacts', 'Discover', 'Me'];

  // TODO: How to optimize them?????
  final List<BottomNavigationBarItem> bottomNavigationBarList = [
    BottomNavigationBarItem(
      icon: Icon(Icons.chat,color: Colors.grey),
      title: Text('Chats'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.room,color: Colors.grey),
      title: Text("Contacts"),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.room,color: Colors.grey),
      title: Text("Discover"),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.perm_identity,color: Colors.grey),
      title: Text("Me"),
    ),
  ];

  // !!! 状态数据不要写到build里面
  int _currentIndex = 0;

  final List<StatefulWidget> widgetList = [
    new Chats(),
    new Contacts(),
    new Discover(),
    new Me()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        // webview 上面标题
        title: Text('WeChat'),
        // 右边的icon
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add_circle_outline), 
            onPressed: () {
              print('Trigger icon on the right');
            },
          ),
        ],
      ),


      // 底部的导航button
      bottomNavigationBar: BottomNavigationBar(
        // Required
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.green[800],
        unselectedItemColor: Colors.grey[800],
        items: bottomNavigationBarList,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        // 当前页面索引
        currentIndex: _currentIndex,
      ),

      // 这里通过currentIndex 来判断去往哪个widget
      body: Center(
        child: widgetList[_currentIndex] 
      )
    );
  }
}
