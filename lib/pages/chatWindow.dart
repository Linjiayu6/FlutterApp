
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
    final RouteArguments _routerParams = ModalRoute.of(context).settings.arguments;
    
    return Scaffold(
      appBar: AppBar(
        title: Text(_routerParams.name),
      ),
      backgroundColor: Colors.grey[300],
      body: _renderBody(context, _messages, _routerParams)
    );
  }

  /**
   * _renderBody
   * 三个部分: 1. 展示信息区域 2. 分界线 3. 输入内容区域
   */
  Widget _renderBody(context, _messages, _routerParams) {
    return Column(
      children: <Widget>[
        // 1. 展示区域: 用户输入的输出内容列表
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

        // 2. 一个分界线
        Divider(height: 2.0),

        // 3. 输入区域: 左边是输入框 右边是Submit
        Container(
          padding: EdgeInsets.only(top: 3.0, bottom: 20.0, right: 10.0, left: 20.0),
          child: Row(
            children: <Widget>[
              // 左边是输入框
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

              // 右边是Submit
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
                  onPressed: () => _handleSubmitted(_controller.text, _routerParams)
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
        
        // 左右两侧 会话的布局问题
        children: chatItem.position == 'left' ? 
          <Widget>[
            _renderAvatar(chatItem, 'left'),
            _renderMsg(chatItem, 'left'),
          ] : 
          <Widget>[
            _renderMsg(chatItem, 'right'),
            _renderAvatar(chatItem, 'right'),
          ]
      )
    );
  }

  /**
   * _renderAvatar 头像
   */
  Widget _renderAvatar(chatItem, direction) {
    var crossAxisAlignment = CrossAxisAlignment.start;
    var magin = EdgeInsets.only(right: 10.0);
    
    if (direction == 'right') {
      crossAxisAlignment = CrossAxisAlignment.end;
      magin = EdgeInsets.only(left: 10.0);
    }
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: <Widget>[
        Container(
          margin: magin,
          child: CircleAvatar(
            radius: 20.0,
            backgroundImage: NetworkImage(chatItem.avatarUrl),
          ),
        ),
      ]
    );
  }

  /**
   * _renderMsg 信息展示
   */
  Widget _renderMsg(chatItem, direction) {
    var crossAxisAlignment = CrossAxisAlignment.start;
    var margin = EdgeInsets.only(top: 3.0, right: 80.0);
    if (direction == 'right') {
      crossAxisAlignment = CrossAxisAlignment.end;
      margin = EdgeInsets.only(top: 3.0, left: 80.0);
    }
    return Expanded(
      child: Column(
        crossAxisAlignment: crossAxisAlignment,
        children: <Widget>[
          Text(
            // chatItem.sender,
            chatItem.time,
            style: TextStyle( fontSize: 11.0, color: Colors.grey[500] )
          ),
          
          Container(
            color: Colors.grey[200],
            padding: EdgeInsets.only(top: 7.0, bottom: 7.0, left: 9.0, right: 9.0),
            margin: margin,
            child: Text(
              chatItem.text,
              style: TextStyle( fontSize: 13.0, color: Colors.grey[900] )
            ),
          )
        ]
      )
    );
  }

  // 输入信息处理
  void _handleSubmitted(String text, _routerParams) {
    if (text.length == 0) {
      return null;
    }
    // 输入完后, 清空输入内容
    _controller.clear();

    // 要有setState来传递值的变化, 产生会话数据: new CreateChatMessage().createSender(text)
    setState(() {
      _messages.insert(0, new CreateChatMessage().createSender(text));
      _messages.insert(0, new CreateChatMessage().createReceiver(_routerParams));
    });
  }
}
