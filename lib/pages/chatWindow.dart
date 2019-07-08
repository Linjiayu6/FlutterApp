
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
        // 展示区域: 用户输入的输出内容列表
        Flexible(
          child: ListView.builder(
            padding: EdgeInsets.all(6.0),
            reverse: true, // 从下往上显示
            itemCount: _messages.length,
            itemBuilder: (BuildContext context, int index) {
              return _renderChatItem(context, _messages[index]);
            }
          )
        ),

        // 一个分界线
        Divider(height: 1.0),

        // 输入区域: 左边是输入框 右边是Submit
        Container(
          padding: EdgeInsets.only(top: 3.0, bottom: 20.0, right: 10.0, left: 20.0),
          child: Row(
            children: <Widget>[
              Flexible(
                child: TextField(
                  controller: _controller,
                  autocorrect: true, // 是否自动更正
                  maxLines: 1, // 最大行数
                  autofocus: true, // 是否自动对焦
                  style: TextStyle(fontSize: 15.0, color: Colors.grey[800]),//输入文本的样式
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


  Widget _renderChatItem(context, chatItem) {
    return Container(
      // 文字间的间距
      margin: EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // 头像区域
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(child: Text('a')),
          ),

          // 名字和用户输入内容
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(chatItem.time),
                Container(
                  color: Colors.grey[300],
                  padding: EdgeInsets.all(6.0),
                  margin: EdgeInsets.only(top: 5.0, right: 50.0),
                  child: Text(chatItem.text),
                )
              ]
            )
          )
        ]
      )
    );
  }

  // 输入信息处理
  void _handleSubmitted(String text) {
    if (text.length == 0) {
      return null;
    }
    // 输入完后, 清空输入内容
    _controller.clear();

    // 将输入放到_messages里面
    ChatMessage msgLeft = new ChatMessage(
      id: 'left',
      sender: 'linjiayu',
      text: text,
      time: new DateTime.now().toString()
    );

    ChatMessage msgRight = new ChatMessage(
      id: 'left',
      sender: 'linjiayu',
      text: '老子回复你了 别说话了',
      time: new DateTime.now().toString()
    );

    // 要有setState来传递值的变化
    setState(() {
      _messages.insert(0, msgLeft);
      _messages.insert(0, msgRight);
    });
  }
}
