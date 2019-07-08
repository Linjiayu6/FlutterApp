
class ChatMessage {
  ChatMessage({
    this.id,
    this.sender,
    this.text,
    this.time
  });

  final String id;
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