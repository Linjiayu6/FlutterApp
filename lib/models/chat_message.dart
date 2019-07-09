
/**
 * 聊天会话DS
 */
import 'package:intl/intl.dart';
class ChatMessage {
  ChatMessage({
    this.position,
    this.sender,
    this.text,
    this.time,
    this.avatarUrl
  });

  final String position;
  final String sender;
  final String text;
  final String time;
  final String avatarUrl;
}

class CreateChatMessage {
  // 发送者
  createSender(text) {
    ChatMessage msgLeft = new ChatMessage(
      position: 'right',
      sender: 'Lin.JY',
      text: text,
      time: new DateFormat("hh:mm:ss").format(new DateTime.now()),
      avatarUrl: 'https://avatars1.githubusercontent.com/u/13708045?s=40&v=4'
    ); 
    return msgLeft;
  }

  // 接受者
  createReceiver(_routerParams) {
    ChatMessage msgRight = new ChatMessage(
      position: 'left',
      sender: _routerParams.name,
      text: _routerParams.name + '说: 你要说什么听不懂',
      time: new DateFormat("hh:mm:ss").format(new DateTime.now()),
      avatarUrl: _routerParams.avatarUrl
    );
    return msgRight;
  }
}

/**
 * 路由参数DS
 * 从chats.dart 到chatWindow.dart router params
 */
class RouteArguments {
  RouteArguments({
    this.name,
    this.message,
    this.avatarUrl
  });

  final String name;
  final String avatarUrl;
  final String message;
}