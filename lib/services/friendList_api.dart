
import 'package:dio/dio.dart';
Dio dio = new Dio();

getHttp() async {
  try {
    Response response = await dio.get('http://39.100.116.12:8080/flutter/chatlist');
    print(response);
    return response;
  } catch (e) {
    print(e);
  }
}
