
import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Center(
      // child: Text(widget.parentsProps)
      child: Text('Chats Widget')
    );
  }
}