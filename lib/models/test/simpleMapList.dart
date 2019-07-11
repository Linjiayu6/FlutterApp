import 'package:dio/dio.dart';
/**
 * 含有数组的简单结构
 * {
      "city": "Mumbai",
      "streets": [
        "address1",
        "address2"
      ]
    }
 */

class SimpleMapList {
  String city;
  List <String> streets;

  SimpleMapList({
    this.city,
    this.streets,
  });

  factory SimpleMapList.fromJson(Map<String, dynamic> parsedJson) {
    var streets = parsedJson['streets'];
    // 返回值: [address1, address2]
    print(streets);
    // 返回值: [address1, address2]
    print(List<String>.from(streets));
    return new SimpleMapList(
      city: parsedJson['city'],
      // streets: parsedJson['streets'],
      // type 'List<dynamic>' is not a subtype of type 'List<String>' 报错
      // 我们正在请求 List<String> 但我们得到一个 List<dynamic> ，因为我们的应用程序还无法识别它的类型
      // 我们首先把变量映射到 streetsFromJson streets 实体。
      // streetsFromJson 仍然是一个 List<dynamic>。
      // 现在我们显式地创造了一个 List<String> streetsList，它包含了 来自 streetsFromJson的所有元素。
      streets: List<String>.from(streets),
    );
  }
}

Future<SimpleMapList> getSimpleMapList() async {
  try {
    final response = await Dio().get('http://39.100.116.12:8080/flutter/simplemaplist');
    if (response.statusCode == 200) {
      SimpleMapList data = SimpleMapList.fromJson(response.data);
      print(data);
      return data;
    }
  } catch (e) {
    print(e);
  }
}