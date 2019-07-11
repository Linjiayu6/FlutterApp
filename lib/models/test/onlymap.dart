
import 'package:dio/dio.dart';
/**
 * https://github.com/PoojaB26/ParsingJSON-Flutter/blob/master/lib/model/student_model.dart
 * 数据类型
 * 一个简单的Map
 * {
    "id": "487349",
    "score" : 1000
  }
 */
class SimpleMap {
  String id;
  int score;

  SimpleMap({
    this.id,
    this.score
  });

  // 因为 json 映射和这个 PODO 文件之间没有映射
  // 在这里，我们创建了一个叫做 Student.fromJson 的工厂方法，用来简单地反序列化你的 json。
  factory SimpleMap.fromJson(Map<String, dynamic> json){
    return SimpleMap(
      id: json['id'],
      score: json['score'],
    );
  }
}

Future<SimpleMap> getSimpleMap() async {
  try {
    final response = await Dio().get('http://39.100.116.12:8080/flutter/simplemap');
    if (response.statusCode == 200) {
      // 返回内容 {id: linjiayu, score: 666}
      // response.data is Map : true
      // mapData是 Instance of 'SimpleMap'
      SimpleMap mapData = SimpleMap.fromJson(response.data);
      return mapData;
    }
  } catch (e) {
    print(e);
  }
}