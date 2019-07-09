
/**
 * 聊天会话DS
 */
class ChatMessage {
  ChatMessage({
    this.position,
    this.sender,
    this.text,
    this.time
  });

  final String position;
  final String sender;
  final String text;
  final String time;
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