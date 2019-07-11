import 'package:dio/dio.dart';
/**
 * 简单的嵌套结构
 * {
      "shape_name":"rectangle",
      "property":{
        "width":5.0,
        "breadth":10.0
      }
    }
 */

class Property {
  final double width;
  final double breadth;

  Property({
    this.width,
    this.breadth,
  });

  factory Property.fromJson(Map<String, dynamic> json) {
    return Property(
      width: json['width'],
      breadth: json['breadth'],
    );
  }
}

class Info {
  final String shapeName;
  final Property property;

  Info({
    this.shapeName,
    this.property,
  });

  factory Info.fromJson(Map<String, dynamic> json) {
    var property = json['property'];
    return Info(
      shapeName: json['shapeName'],
      // type '_InternalLinkedHashMap<String, dynamic>' is not a subtype of type 'Property'
      // property: json['property']
      // 我们从 Property 类调用 Property.fromJson 方法，无论得到什么，我们都将它映射到 property 实体
      property: Property.fromJson(property) 
    );
  }
}

Future<Info> getMapNest() async {
  try {
    final response = await Dio().get('http://39.100.116.12:8080/flutter/mapnest');
    if (response.statusCode == 200) {
      Info mapData = Info.fromJson(response.data);
      return mapData;
    }
  } catch (e) {
    print(e);
  }
}