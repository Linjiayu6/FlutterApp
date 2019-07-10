
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../models/chat_message.dart';

/**
 * Service: pages/chats.dart
 * Description: list for all friends; Stateless Widget;
 * 
 * Params: @friendList
 */

class FriendList_Widget extends StatelessWidget {
  // 无状态组件信息, 从父组件传入
  List friendList;
  FriendList_Widget({
    Key key,
    this.friendList
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _buildBody(context, friendList),
      )
    );
  }

  /**
   * 列表循环输出内容 例子https://juejin.im/post/5b596c89e51d4519945ffb66
   */
  _buildBody(context, friendList) {
    // 当没有获取到内容的时候, 菊花转
    if (friendList.length == 0) {
      return Container(child: CupertinoActivityIndicator());
    }

    return ListView.builder(
      itemCount: friendList.length,
      itemBuilder: (BuildContext context, int index) {
        return _renderItem(context, friendList[index]);
      },
    );
  }
  
  _renderItem(context, item) => GestureDetector(
    onTap: () {
      // 点击详情跳转至聊天详情页
      Navigator.pushNamed(
        context,
        '/chats/window',
        arguments: RouteArguments(
          name: item.name,
          avatarUrl: item.avatarUrl,
          message: item.message,
        ),
      );
    },
    child: Container(
      margin: EdgeInsets.only(left: 15.0, right: 0.0, top: 15.0),
      child: Row(
        children: <Widget>[
          _left_avatar(item.avatarUrl),
          _right_detail(item) 
        ],
      )
    )
  );

  /**
   * 右侧内容
   * 1. 左边 用户名, 时间描述
   * 2. 聊天描述
   */
  Widget _right_detail(item) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(left: 10.0),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              style: BorderStyle.solid,
              color: Colors.grey[200],
              width: 1.0
            )
          ),
        ),
        height: 50.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // 左边是用户名称, 右边是时间描述
            _right_nameAndTime(item.name),
            // 聊天描述
            _right_chatDes(item.message),
          ]
        )
      )
    );
    }

  /**
   * 左边是用户名称, 右边是时间描述
   */
  Widget _right_nameAndTime(name) {
    return Stack(
      children: <Widget>[
        Align(
          alignment: new FractionalOffset(0.0, 0.0),
          child: Container(
            height: 25.0,
            padding: EdgeInsets.only(top: 3.0, bottom: 4.0, right: 100.0),
            child: Text(
              name,
              softWrap: true,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          )
        ),

        Align(
          alignment: FractionalOffset.bottomRight,
          child: Container(
            margin: EdgeInsets.only(right: 10.0),
            child: Text(
              '2019.05.25',
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: 10.0, color: Colors.grey[600]),
            ),
          )
        ),
      ],
    );
  } 

  /**
   * 左侧头像图片
   */
  Widget _left_avatar(avatarUrl) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(4)),
      child: Image.network(
        avatarUrl,
        width: 46.0, 
        height: 46.0,
        fit: BoxFit.cover,
      ),
    );
  }

  /**
   * 聊天描述
   */
  Widget _right_chatDes(message) {
    return Container(
      padding: EdgeInsets.only(right: 20.0),
      child: Text(
        message,
        style: TextStyle(fontSize: 10.0, color: Colors.grey[600]),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      )
    );
  }
}
