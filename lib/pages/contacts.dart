
import 'package:flutter/material.dart';

class Contacts extends StatefulWidget {
  Contacts({ Key key}) : super(key: key);
  
  ContactsState createState () => ContactsState();
}

class ContactsState extends State<Contacts> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Contacts Widget')
    );
  }
}