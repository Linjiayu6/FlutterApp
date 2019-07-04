
import 'package:flutter/material.dart';

class Me extends StatefulWidget {
  Me({ Key key}) : super(key: key);
  
  MeState createState () => MeState();
}

class MeState extends State<Me> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () { 
        Navigator.pushNamed(context, '/chats/detail');
      },
      child: Center(
        child: Text('Me Widget')
      )
    );
  }
}