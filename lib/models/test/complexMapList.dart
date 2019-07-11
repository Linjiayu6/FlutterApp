import 'package:dio/dio.dart';
/**
 * 
 * {
    "id":1,
    "name":"ProductName",
    "images":[
      {
        "id":11,
        "imageName":"xCh-rhy"
      },
      {
        "id":31,
        "imageName":"fjs-eun"
      }
    ]
  }
 */

class Image {
  final int id;
  final String imageName;

  Image({
    this.id,
    this.imageName
  });

  factory Image.fromJson(Map<String, dynamic> parsedJson){
    return Image(
      id: parsedJson['id'],
      imageName:parsedJson['imageName']
    );
  }
}

class Product {
  final int id;
  final String name;
  final List<Image> images;
  
  Product({
    this.id,
    this.name,
    this.images
  });

  factory Product.fromJson(Map<String, dynamic> parsedJson){

    var list = parsedJson['images'] as List;
    // 返回 [{id: 11, imageName: xCh-rhy}, {id: 31, imageName: fjs-eun}]
    // print(parsedJson['images']);
    // parsedJson['images'] 需要遍历一遍, 将{id: 11, imageName: xCh-rhy} 对象映射到Images中
    // 然后我们将每个 map 对象放入一个带有 toList() 的新列表中
    List<Image> imagesList = list.map((i) => new Image.fromJson(i)).toList();

    return Product(
      id: parsedJson['id'],
      name: parsedJson['name'],
      images: imagesList,
      // type 'List<dynamic>' is not a subtype of type 'Images'
      // 所以我们必须创建一个 List<Image> 然后将它分配给 images
      // images: parsedJson['images'],
    );
  }
}

Future<Product> getComplexMapList() async {
  try {
    final response = await Dio().get('http://39.100.116.12:8080/flutter/complexMapList');
    if (response.statusCode == 200) {
      Product mapData = Product.fromJson(response.data);
      print(response.data);
      print(mapData);
      return mapData;
    }
  } catch (e) {
    print(e);
  }
}