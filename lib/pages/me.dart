
import 'package:flutter/material.dart';

class Me extends StatefulWidget {
  Me({ Key key}) : super(key: key);
  
  MeState createState () => MeState();
}

class MeState extends State<Me> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Me Widget')
    );
  }
}