
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../widgets/friendList.dart';

import '../models/friendList_model.dart';

class Chats extends StatefulWidget {
  /**
   * 这里类似React this.props.xxx 说明是从上级或者父组件传过来的
   * 这三个从父组件传进来的参数一定要定义
   * (1) final这里定义;
   * (2) Chats({ ... 这里需要定义
   */
  // final String parentsProps;

  // Chats({
  //   Key key,
  //   this.parentsProps,
  // }) : super(key: key);

  Chats({ Key key}) : super(key: key);
  
  ChatsState createState () => ChatsState();
}

class ChatsState extends State<Chats> {
  List friendList = friendListData;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            height: 45.0,
            color: Colors.grey[200],
            alignment: Alignment(0.0, 0.0),
            child: Text('Logged in to Wechat for Mac.'),
          ),
          
          Expanded(
            child: FriendList_Widget(friendList: friendList),
          )
        ]
      )
    );
  }
}
