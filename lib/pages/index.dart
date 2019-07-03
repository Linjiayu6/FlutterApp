
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
    new BottomNavigationBarItem(
      icon: new Icon(Icons.chat,color: Colors.grey),
      title: new Text('Chats'),
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

  final List<StatefulWidget> widgetList = [
    new Chats(),
    new Contacts(),
    new Discover(),
    new Me()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: new AppBar(
        // webview 上面标题
        title: new Text('WeChat'),
        // 右边的icon
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.add_circle_outline), 
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
        // child: Text(_currentIndex.toString())
        // child: Chats(
        //   // parentsProps: _currentIndex.toString(),
        // ),
        child: widgetList[_currentIndex] 
      )
    );
  }
}
