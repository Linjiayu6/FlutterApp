
class ChatMessage {
  ChatMessage({
    this.sender,
    this.text,
    this.time
  });

  final String sender;
  final String text;
  final String time;
}

class RouteArguments {
  RouteArguments(
    this.name
  );

  final String name;
}