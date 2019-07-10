
/**
 * 聊天会话DS
 */
import 'package:intl/intl.dart';
import 'dart:math'; 

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
    var rng = new Random().nextInt(7); 
    List response = [
      '对方拒绝接受消息',
      '\u{1f644}',
      '你开心就好  \u{1f600} ',
      'hhhhhhhhhhh \u{1f618} \u{1f618} \u{1f618} \u{1f618} \u{1f618} \u{1f618}',
      '老子要睡觉了, 晚安 \u{1f602}',
      '你是个好人 \u{1f605} 你会找到更好的',
      '\u{1f644}',
    ];

    ChatMessage msgRight = new ChatMessage(
      position: 'left',
      sender: _routerParams.name,
      text: response[rng],
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