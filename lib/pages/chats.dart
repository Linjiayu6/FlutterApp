
import 'package:flutter/material.dart';

class Chats extends StatefulWidget {
  /**
   * 这里类似React this.props.xxx 说明是从上级或者父组件传过来的
   */
  final String parentsProps;
  Chats({
    Key key,
    this.parentsProps
  }) : super(key: key);
  
  ChatsState createState () => ChatsState();
}

class ChatsState extends State<Chats> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(widget.parentsProps + '  这里是Chats')
    );
  }
}