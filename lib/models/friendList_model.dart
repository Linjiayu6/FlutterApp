
class FriendListModel {
  final String name;
  final String avatarUrl;
  final String message;
  final String time;

  FriendListModel({
    this.name,
    this.avatarUrl,
    this.message,
    this.time
  });
}

List<FriendListModel> friendListData = [
  new FriendListModel(
    name: '美少女战士',
    message: '《美少女战士》是1992年3月7日到1993年2月27日播放的日本动画作品',
    avatarUrl: 'http://b-ssl.duitang.com/uploads/item/201412/30/20141230001422_kRihV.thumb.1000_0.jpeg',
    time: '2019.07.04',
  ),
  new FriendListModel(
    name: '蜡笔小新',
    message: '《蜡笔小新》是由臼井仪人创作的漫画，1990年8月，在《weekly漫画action》上开始连载。',
    avatarUrl: 'https://b-ssl.duitang.com/uploads/item/201311/05/20131105110122_VHujH.thumb.700_0.jpeg',
    time: '2019.07.02',
  )
];
