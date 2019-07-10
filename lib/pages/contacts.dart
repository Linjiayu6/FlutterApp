
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void getHttp() async {
  try {
    Response response = await Dio().get('http://39.100.116.12:8080/flutter/chatlist');
    print(response);
  } catch (e) {
    print(e);
  }
}

class Contacts extends StatefulWidget {
  Contacts({ Key key}) : super(key: key);
  
  ContactsState createState () => ContactsState();
}

class ContactsState extends State<Contacts> {
  @override
  Widget build(BuildContext context) {
    getHttp();
    return Center(
      child: Text('Contacts Widget')
    );
  }
}
