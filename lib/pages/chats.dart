
import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Center(
      // child: Text(widget.parentsProps)
      // child: Text('Chats Widget')
      child: FriendList()
    );
  }
}

class FriendList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  // 列表内容 例子借鉴 https://juejin.im/post/5b596c89e51d4519945ffb66
  // https://juejin.im/post/5c88d6c4f265da2de970bc24
  ListView _buildBody () {
    return ListView(
      children: <Widget>[
        new ListTile(
          title: Text('林佳钰1'),
          subtitle: Text('2 aaaaaaa 说什么呢 您呢 aaaaaaa 说什么呢'),
          trailing: Text('2019.10.11'),
          leading: FlutterLogo(size: 56.0),
        ),
        new ListTile(
          title: Text('林佳钰2'),
          subtitle: Text('2 aaaaaaa 说什么呢 您呢 aaaaaaa 说什么呢'),
          trailing: Text('2019.10.01'),
          leading: FlutterLogo(size: 56.0),
        ),
      ]
    );
  }
}
