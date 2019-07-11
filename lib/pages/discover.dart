
import 'package:flutter/material.dart';

import '../models/test/onlymap.dart';
import '../models/test/simpleMapList.dart';
import '../models/test/mapnest.dart';
import '../models/test/complexMapList.dart';

class Discover extends StatefulWidget {
  Discover({ Key key}) : super(key: key);
  
  DiscoverState createState () => DiscoverState();
}

class DiscoverState extends State<Discover> {
  SimpleMap mapData;

  @override
  void initState() {
    super.initState();
    getSimpleMap().then((data) => {
      setState(() {
        mapData = data;
        // // Instance of 'SimpleMap'
        // print(mapData);
        // // linjiayu
        // print(mapData.id);
        // print(mapData.score);
      })
    });

    getSimpleMapList();
    getMapNest();
    getComplexMapList();
  }

  @override
  Widget build(BuildContext context) {
    if (mapData != null) {
      print(mapData.id);
    } else {
      print('mapData.id is null');
    }
    
    return Center(
      child: Row(
        children: <Widget>[
          Text('Discover Widget'),
          Text(mapData != null ? mapData.id : '空 没有返回数据'),
        ]
      )
    );
  }
}