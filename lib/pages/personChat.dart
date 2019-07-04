
import 'package:flutter/material.dart';

class PersonChat extends StatefulWidget {
  PersonChat({ Key key}) : super(key: key);
  
  PersonChatState createState () => PersonChatState();
}

class PersonChatState extends State<PersonChat> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('PersonChatState')
    );
  }
}
