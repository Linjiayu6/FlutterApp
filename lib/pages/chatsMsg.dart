
import 'package:flutter/material.dart';

import '../models/chat_message.dart';

class ChatsMsg extends StatefulWidget {
  ChatsMsg({ Key key }) : super(key: key);

  ChatsMsgState createState () => ChatsMsgState();
}

class ChatsMsgState extends State<ChatsMsg> {
  // 保存信息内容
  List<String> _messages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        // webview 上面标题
        title: new Text('美少女战士'),
      ),

      body: Column(
        children: <Widget> [
          new Divider(height: 1.0),

          new Container(
            child: _buildMessages(),
          ),
        ]
      )
    );
  }
}

class ChatMessageListItem extends StatelessWidget {
  // 接收传入数据
  ChatMessageListItem(this.message);
  final ChatMessage message;

  @override
  Widget build(BuildContext context) {
    return Text('message');
  }
}

class _buildMessages extends StatelessWidget {
  // A TextEditingController is basically a class that listens to its assigned TextField, and updates it's own internal state every time the text in the TextField changes.
  final TextEditingController _controller = new TextEditingController();
  List<String> _messages = [];

  void _handleSubmitted(String text) {
    print(text);
    // 输入完后, 清空输入内容
    _controller.clear();
    // 将输入放到_messages里面
    _messages.insert(0, text);
    print(_messages);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextField(
          controller: _controller,
          decoration: new InputDecoration(
            hintText: 'Wechat Type',
          ),
        ),

        RaisedButton(
          onPressed: () {
            _handleSubmitted(_controller.text);
          },
          child: new Text('DONE'),
        ),
      ],
    );
  }
}