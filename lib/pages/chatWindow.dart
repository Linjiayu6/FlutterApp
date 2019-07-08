
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// Model: ChatMessage
import '../models/chat_message.dart';

class ChatWindow extends StatefulWidget {
  ChatWindow({ Key key }) : super(key: key);

  ChatWindowState createState () => ChatWindowState();
}

class ChatWindowState extends State<ChatWindow> {

  // 创建输入时候的保存信息
  List <ChatMessage> _messages = [];
  final TextEditingController _controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    // url上带参数处理
    final RouteArguments params = ModalRoute.of(context).settings.arguments;
    
    return Scaffold(
      appBar: AppBar(
        title: Text(params.name),
      ),

      body: _renderBody(context, _messages)
    );
  }

  Widget _renderBody(context, _messages) {
    return Column(
      children: <Widget>[
        // 用户输入的输出内容列表
        Flexible(
          child: ListView.builder(
            padding: EdgeInsets.all(6.0),
            reverse: true, // 从下往上显示
            itemCount: _messages.length,
            itemBuilder: (BuildContext context, int index) {
              return Text(_messages[index].text);
            }
          )
        ),

        Divider(height: 1.0),

        Container(
          padding: EdgeInsets.only(top: 3.0, bottom: 20.0, right: 10.0, left: 20.0),
          child: Row(
            children: <Widget>[
              Flexible(
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: 'Please Type ...',
                  ),
                ),
              ),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 3.0),
                child: CupertinoButton(
                  child: Text(
                    'Submit',
                    style: TextStyle(
                      color: Colors.green[800],
                      fontSize: 16.0,
                    )
                  ),
                  onPressed: () => _handleSubmitted(_controller.text)
                )
              )
            ],
          )
        ),
      ]
    );
  }

  void _handleSubmitted(String text) {
    // 输入完后, 清空输入内容
    _controller.clear();

    // 将输入放到_messages里面
    ChatMessage msgItem = new ChatMessage(
      sender: 'linjiayu',
      text: text,
      time: '时间',
    );

    // 要有setState来传递值的变化
    setState(() {
      _messages.insert(0, msgItem);
    });
  }
}
