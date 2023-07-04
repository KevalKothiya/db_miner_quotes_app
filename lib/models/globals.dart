
import 'dart:ui';

class SettingController_Model {
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
        fav: data["fav"],
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
  String? favourite;

  DataBase({
    required this.id,
    required this.idd,
    required this.author,
    required this.quote,
    required this.favourite,
  });

  factory DataBase.fromMap({required Map? data}) {
    return DataBase(
      id: data!["id"],
      idd: data["idd"],
      quote: data["quote"],
      author: data["author"],
      favourite: data["favourite"],
    );
  }
} // Table

class NewFolderList_Model {
  List newFolderList = [];

  NewFolderList_Model({
    required this.newFolderList,
  });
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
  int idd;
  String name;
  String author;
  String quote;

  NewFolderData({
    required this.id,
    required this.idd,
    required this.name,
    required this.author,
    required this.quote,
  });

  factory NewFolderData.fromMap({required Map? data}) {
    return NewFolderData(
      id: data?["id"],
      idd: data?["idd"],
      name: data?["name"],
      author: data?["author"],
      quote: data?["quote"],
    );
  }
}

class Favourite_Data {
  String fav;

  Favourite_Data({
    required this.fav,
  });

  factory Favourite_Data.fromMap({required Map data}){
    return Favourite_Data(fav: data['like']);
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

  StorageData({
    required this.storageData,
    required this.storage,
    required this.storageFavourite,
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

  factory Image_Model.fromMap({required Map data}) {
    return Image_Model(image: data['largeImageURL']);
  }
}

class TextEditMenu_Model {
  Color color;
  Color backGroundColor;
  FontWeight fontWeight;
  FontStyle fontStyle;
  double fontSize;
  double letterSpacing;
  double wordSpacing;

  TextEditMenu_Model({
    required this.color,
    required this.backGroundColor,
    required this.fontWeight,
    required this.fontStyle,
    required this.fontSize,
    required this.letterSpacing,
    required this.wordSpacing,
  });
}
