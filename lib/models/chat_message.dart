
class ChatUser {
  ChatUser({
    this.name,
    this.imageUrl,
  });

  final String name;
  final String imageUrl;
}

class ChatMessage {
  ChatMessage({
    this.sender,
    this.text,
  });

  final ChatUser sender;
  final String text;
}
