import 'package:db_miner/models/globals.dart';
import 'package:db_miner/models/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingController_Getx extends GetxController {
  SettingController_Model settingController =
      SettingController_Model(isDarkMode: false);

  darkThemeUDF({required bool val}) {
    settingController.isDarkMode = val;
    (settingController.isDarkMode)
        ? Get.changeTheme(
            ThemeData.dark(
              useMaterial3: true,
            ),
          )
        : Get.changeTheme(
            ThemeData.light(useMaterial3: true),
          );
    update();
  }
}

class TabBarIndex_GetController extends GetxController {
  TabBarIndex_Model tabBarIndex_Model = TabBarIndex_Model(id: 0);

  Initialization({required int id}) {
    tabBarIndex_Model.id = id;
    update();
  }
}

class Image_GetController extends GetxController {
  List images = [
    "assets/images/friendship/1.jpg",
    "assets/images/motivational/1.jpg",
    "assets/images/inspirational/1.jpeg",
    "assets/images/knowledge/1.jpg",
    "assets/images/self/1.jpeg",
    "assets/images/success/1.jpg",
    "assets/images/motivational/5.jpg",
  ];
}

class Storage extends GetxController {
  StorageData storageData = StorageData(storageData: false, storage: false,storageFavourite: false);

  trueMethodData() async {
    storageData.storageData = true;
    box.write('storageData', storageData.storageData);
    update();
  }

  trueMethod() async {
    storageData.storage = true;
    box.write('storage', storageData.storage);
    update();
  }

  trueMethodFavourite() async {
    storageData.storageFavourite = true;
    box.write('favourite', storageData.storageFavourite);
    update();
  }

  falseMethodFavourite() async {
    storageData.storageFavourite = false;
    box.write('favourite', storageData.storageFavourite);
    update();
  }
}

class FetchId extends GetxController {
  int? i;

  fetchId({required int id}) {
    i = id;
  }
}

class CarouselSliderImage_Getx extends GetxController {
  CarouselSliderImage_Model carousel_Model = CarouselSliderImage_Model(
      carouselimage:
          "https://pixabay.com/get/ged0c5f73d0e5e5101718876808bc5b9fa0f65092efbb866380310e8bfd3b9418287c940bf9db02fec8a7a4d3ecb8dd487a14d9ef19b67d08b6f0dfd0f5059644_1280.jpg");

  getter({required String selectedImage}) async {
    carousel_Model.carouselimage = selectedImage;
  }
}

class NewFolderList_Getx extends GetxController {
  NewFolderList_Model newFolder =
      NewFolderList_Model(newFolderList: box.read('newFolder') ?? []);

  init({required String tableName}) async {
    newFolder.newFolderList.add(tableName);

    box.write('newFolder', newFolder.newFolderList);

    update();
  }
}

class TextEditMenu_Getx extends GetxController {
  TextEditMenu_Model textEditMenu_Model = TextEditMenu_Model(
    color: box.read('color') ?? CupertinoColors.black,
    backGroundColor: box.read('backGroundColor') ?? CupertinoColors.black,
    fontWeight: box.read('fontWeight') ?? FontWeight.normal,
    fontStyle: box.read('fontStyle') ?? FontStyle.normal,
    fontSize: box.read('fontSize') ?? 16,
    letterSpacing: box.read('letterSpacing') ?? 0,
    wordSpacing: box.read('wordSpacing') ?? 0,
  );

  initializationInColor({required Color color}) {
    textEditMenu_Model.color = color;
    box.write('color', textEditMenu_Model.color);
    update();
  }

  initializationInBackGroundColor({required Color backGroundColor}) {
    textEditMenu_Model.backGroundColor = backGroundColor;
    box.write('backGroundColor', textEditMenu_Model.backGroundColor);
    update();
  }

  initializationInFontWeight({required FontWeight fontWeight}) {
    textEditMenu_Model.fontWeight = fontWeight;
    box.write('fontWeight', textEditMenu_Model.fontWeight);
    update();
  }

  initializationInFontStyle({required FontStyle fontStyle}) {
    textEditMenu_Model.fontStyle = fontStyle;
    box.write('fontStyle', textEditMenu_Model.fontStyle);
    update();
  }

  initializationInFontSize({required double fontSize}) {
    textEditMenu_Model.fontSize = fontSize;
    box.write('fontSize', textEditMenu_Model.fontSize);
    update();
  }

  initializationInLetterSpacing({required double letterSpacing}) {
    textEditMenu_Model.letterSpacing = letterSpacing;
    box.write('letterSpacing', textEditMenu_Model.letterSpacing);
    update();
  }

  initializationInWordSpacing({required double wordSpacing}) {
    textEditMenu_Model.wordSpacing = wordSpacing;
    box.write('wordSpacing', textEditMenu_Model.wordSpacing);
    update();
  }
}
