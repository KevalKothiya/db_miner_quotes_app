
import 'package:flutter/material.dart';

class SettingController_Model{
  bool isDarkMode;

  SettingController_Model({
    required this.isDarkMode,
  });
}

class QuotesModel {
  int id;
  String name;
  List<Quote> quotes;

  QuotesModel({
    required this.id,
    required this.name,
    required this.quotes,
  });

  factory QuotesModel.fromMap({required Map<String, dynamic> data}) {
    return QuotesModel(
      id: data["id"],
      name: data["name"],
      quotes:
          List<Quote>.from(data["quotes"].map((x) => Quote.fromMap(data: x))),
    );
  }
}

class Quote {
  int id;
  int idd;
  String quote;
  String author;
  String fav;

  Quote({
    required this.id,
    required this.idd,
    required this.quote,
    required this.author,
    required this.fav,
  });

  factory Quote.fromMap({required Map data}) => Quote(
        id: data["id"],
        idd: data["idd"],
        quote: data["quote"],
        author: data["author"],
        fav : data["like"],
      );
}
// jsonBank

class DataBase_Model {
  int id;
  String name;

  DataBase_Model({
    required this.id,
    required this.name,
  });

  factory DataBase_Model.fromMap({required Map? data}) {
    return DataBase_Model(
      id: data!['id'],
      name: data['name'],
    );
  }
}

class DataBase {
  int id;
  int idd;
  String quote;
  String author;
  String fav;

  DataBase({
    required this.id,
    required this.idd,
    required this.author,
    required this.quote,
    required this.fav,
  });

  factory DataBase.fromMap({required Map? data}) {
    return DataBase(
      id: data!["id"],
      idd: data["idd"],
      quote: data["quote"],
      author: data["author"],
      fav : data["favourite"],
    );
  }
}

class DataBaseFavourite {
  int id;
  int idd;
  String quote;
  String author;
  String fav;

  DataBaseFavourite({
    required this.id,
    required this.idd,
    required this.author,
    required this.quote,
    required this.fav,
  });

  factory DataBaseFavourite.fromMap({required Map? data}) {
    return DataBaseFavourite(
      id: data!["id"],
      idd: data["idd"],
      quote: data["quote"],
      author: data["author"],
      fav : data["favourite"],
    );
  }
} // Table

class NewFolderList_Model {
  List newFolderList = [];

  NewFolderList_Model(
    this.newFolderList,
  );
}

class NewFolderList_DataBase {
  String? tableName;

  NewFolderList_DataBase({
    required this.tableName,
  });

  factory NewFolderList_DataBase.fromMap({required Map name}) {
    return NewFolderList_DataBase(tableName: name['name']);
  }
}

class NewFolderData {
  int id;
  String name;
  String author;
  String quote;

  NewFolderData({
    required this.id,
    required this.name,
    required this.author,
    required this.quote,
  });

  factory NewFolderData.fromMap({required Map? data}) {
    return NewFolderData(
      id: data?["id"],
      name: data?["name"],
      author: data?["author"],
      quote: data?["quote"],
    );
  }
}

class TabBarIndex_Model {
  int id;

  TabBarIndex_Model({
    required this.id,
  });
}

class StorageData {
  bool storageData;
  bool storage;
  bool storageFavourite;
  bool loaclStorage;

  StorageData({
    required this.storageData,
    required this.storage,
    required this.storageFavourite,
    required this.loaclStorage,
  });
}

class CarouselSliderImage_Model {
  String carouselimage;

  CarouselSliderImage_Model({
    required this.carouselimage,
  });
}

class Image_Model {
  String image;

  Image_Model({
    required this.image,
  });

  factory Image_Model.fromMap({required Map data}){
    return Image_Model(image: data['largeImageURL']);
  }
}

class TextEditMenu_Model{
 Color? color;
 Color? backgroundColor;
 FontWeight? fontWeight;
 double? fontSize;
 FontStyle? fontStyle;
 double letterSpacing;
 double? wordSpacing;

 TextEditMenu_Model({
    required this.color,
    required this.backgroundColor,
    required this.fontWeight,
    required this.fontSize,
    required this.fontStyle,
    required this.letterSpacing,
    required this.wordSpacing,
  });
}
