
import 'package:flutter/material.dart';

class Discover extends StatefulWidget {
  Discover({ Key key}) : super(key: key);
  
  DiscoverState createState () => DiscoverState();
}

class DiscoverState extends State<Discover> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Discover Widget')
    );
  }
}