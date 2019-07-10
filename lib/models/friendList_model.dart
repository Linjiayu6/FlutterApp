
import 'package:dio/dio.dart';
import 'dart:convert';

/**
 * map列表: https://juejin.im/post/5b5d782ae51d45191c7e7fb3
 * [
 *  { name, message, avatarUrl, time },
 *  { name, message, avatarUrl, time }
 *  ...
 * ]
 */
class FriendModel {
  final String name;
  final String avatarUrl;
  final String message;
  final String time;

  FriendModel({
    this.name,
    this.avatarUrl,
    this.message,
    this.time
  });

  FriendModel.fromJson(Map<String, dynamic> json) 
  : name = json['name'],
    avatarUrl =json['avatarUrl'],
    message = json['message'],
    time = json['time'];
}

Future<List<FriendModel>> getFriendList() async {
  List friendList = defaultFriendList;
  try {
    final response = await Dio().get('http://39.100.116.12:8080/flutter/chatlist');
    if (response.statusCode == 200) {
      friendList = response.data;
      return friendList.map((item) {
        return new FriendModel.fromJson(item);
      }).toList();
    }
  } catch (e) {
    print(e);
  }
  return friendList;
}

/**
 * 默认值
 */
List<FriendModel> defaultFriendList = [
  new FriendModel(
    name: '美少女战士',
    message: '《美少女战士》是1992年3月7日到1993年2月27日播放的日本动画作品',
    avatarUrl: 'http://b-ssl.duitang.com/uploads/item/201412/30/20141230001422_kRihV.thumb.1000_0.jpeg',
    time: '2019.07.04',
  ),
  new FriendModel(
    name: '蜡笔小新',
    message: '《蜡笔小新》是由臼井仪人创作的漫画，1990年8月，在《weekly漫画action》上开始连载。',
    avatarUrl: 'https://b-ssl.duitang.com/uploads/item/201311/05/20131105110122_VHujH.thumb.700_0.jpeg',
    time: '2019.07.02',
  ),
  new FriendModel(
    name: '樱桃小丸子',
    message: '是由日本已故漫画家樱桃子创作的日本漫画作品，于1986年在少女漫画杂志《Ribon》开始连载，单行本由集英社发售全17册，后来改编成动画、游戏、电视剧。故事描叙小丸子以及其家人和同学展开，有关于亲情、友谊或是一些生活事情，令人回想起童年的稚气',
    avatarUrl: 'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3017480978,934230962&fm=26&gp=0.jpg',
    time: '2019.07.01',
  )
];