
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../models/friendList_model.dart';

class Chats extends StatefulWidget {
  /**
   * 这里类似React this.props.xxx 说明是从上级或者父组件传过来的
   * 这三个从父组件传进来的参数一定要定义
   * (1) final这里定义;
   * (2) Chats({ ... 这里需要定义
   */
  // final String parentsProps;

  // Chats({
  //   Key key,
  //   this.parentsProps,
  // }) : super(key: key);

  Chats({ Key key}) : super(key: key);
  
  ChatsState createState () => ChatsState();
}

class ChatsState extends State<Chats> {
  List friendList = friendListData;
  @override
  Widget build(BuildContext context) {
    return Center(
      // child: Text(widget.parentsProps)
      // child: Text('Chats Widget')
      child: Column(
        children: [
          Container(
            height: 40.0,
            color: Colors.grey[200],
            alignment: Alignment(0.0, 0.0),
            child: Text('Logged in to Wechat for Mac.')
          ),
          
          Expanded(
            child: _FriendList(friendList: friendList),
          )
        ]
      )
    );
  }
}

class _FriendList extends StatelessWidget {
  // 无状态组件信息, 从父组件传入
  List friendList;
  _FriendList({Key key, this.friendList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _buildBody(friendList),
      )
    );
  }

  /**
   * 列表循环输出内容 例子https://juejin.im/post/5b596c89e51d4519945ffb66
   */
  _buildBody(friendList) {
    // 当没有获取到内容的时候, 菊花转
    // if (friendList.length == 0) {
    //   return Container(child: CupertinoActivityIndicator());
    // }

    return ListView.builder(
      itemCount: friendList.length,
      itemBuilder: (BuildContext context, int index) {
        return getItem(friendList[index]);
      },
    );
  }
  
  getItem(item) => Container(
    // margin: EdgeInsets.only(bottom: 1.0),
    child: Container(
      margin: EdgeInsets.only(left: 15.0, right: 0.0, top: 15.0),
      child: Row(
        children: <Widget>[ _leftAvatar(item.avatarUrl), _rightContent(item) ],
      )
    )
  );

  Widget _leftAvatar(avatarUrl) {
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

  Widget _rightContent(item) {
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
            _rightContent_top(item.name),
            // 聊天描述
            _rightContent_bottom(item.message),
          ]
        )
      )
    );
  }

  Widget _rightContent_top(name) {
    return Stack (
      children: <Widget>[
        Container(
          height: 25.0,
          padding: EdgeInsets.only(top: 3.0, bottom: 4.0, right: 100.0),
          child: Text(
            name,
            softWrap: true,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),

        Positioned(
          child: Text(
            '2019.05.25',
            style: TextStyle(fontSize: 10.0, color: Colors.grey[600]),
          ),
          top: 5.0,
          right: 20.0,
        ),

      ],
    );
  }

  Widget _rightContent_bottom(message) {
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
