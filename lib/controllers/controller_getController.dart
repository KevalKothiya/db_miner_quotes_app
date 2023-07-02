import 'package:db_miner/models/globals.dart';
import 'package:db_miner/models/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

class OneTime_GetxController extends GetxController {
  int count = 0;

  increment() {
    count = 1;
    update();
  }
}

class Storage extends GetxController {
  StorageData storageData = StorageData(storageData: false, storage: false, storageFavourite: false,loaclStorage: false);

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

  trueMethodOfFavourite() async {
    storageData.storageFavourite = true;
    box.write('storageFavourite', storageData.storageFavourite);
    update();
  }
  trueMethodOfLocal() async {
    storageData.loaclStorage = true;
    box.write('loaclStorage', storageData.loaclStorage);
    update();
  }
}

class FetchId extends GetxController {
  RxInt? i;

  fetchId({required int id}) {
    i = id.obs;
  }
}

class CarouselSliderImage_Getx extends GetxController {
  CarouselSliderImage_Model carousel_Model = CarouselSliderImage_Model(
      carouselimage:
          "https://pixabay.com/get/g9ac2e2bbdc81843e86e9ef7ddbfaa67d69b2f32807adeb4e69e4b79832a0dfcbc389493071262e7bcc357b5fb1fb8531b489a2fa46683129d621432926d2b53e_1280.jpg");

  getter({required String selectedImage}) async {
    carousel_Model.carouselimage = selectedImage;
  }
}

class NewFolderList_Getx extends ChangeNotifier {
  NewFolderList_Model newFolder =
      NewFolderList_Model(box.read('newFolderList') ?? []);

  init({required String tableName}) async {
    newFolder.newFolderList.add(tableName);

    box.write('newFolderList', newFolder.newFolderList);

    notifyListeners();
  }
}

class TextEditMenu_Getx extends GetxController {
  TextEditMenu_Model textEditMenu_Model = TextEditMenu_Model(
    color: box.read('color') ?? Colors.black,
    backgroundColor: box.read('backgroundColor') ?? Colors.transparent,
    fontWeight: box.read('fontWeight') ?? FontWeight.normal,
    fontSize: box.read('fontSize') ?? 14,
    fontStyle: box.read('fontStyle') ?? FontStyle.normal,
    letterSpacing: box.read('letterSpacing') ?? 0,
    wordSpacing: box.read('wordSpacing') ?? 0,
  );

  initializationInColor({
    required Color color,
  }) {
    textEditMenu_Model.color = color;
    box.write('color', textEditMenu_Model.color);
    update();
  }

  initializationInBackgroundColor({
    required Color backgroundColor,
  }) {
    textEditMenu_Model.backgroundColor = backgroundColor;
    box.write('backgroundColor', textEditMenu_Model.backgroundColor);
    update();
  }

  initializationInFontWeight({
    required FontWeight fontWeight,
  }) {
    textEditMenu_Model.fontWeight = fontWeight;
    box.write('fontWeight', textEditMenu_Model.fontWeight);
    update();
  }

  initializationInFontSize({
    required double fontSize,
  }) {
    textEditMenu_Model.fontSize = fontSize;
    box.write('fontSize', textEditMenu_Model.fontSize);
    update();
  }

  initializationInFontStyle({
    required FontStyle fontStyle,
  }) {
    textEditMenu_Model.fontStyle = fontStyle;
    box.write('fontStyle', textEditMenu_Model.fontStyle);
    update();
  }

  initializationInLetterSpacing({
    required double letterSpacing,
  }) {
    textEditMenu_Model.letterSpacing = letterSpacing;
    box.write('letterSpacing', textEditMenu_Model.letterSpacing);
    update();
  }

  initializationInWordSpacing({
    required double wordSpacing,
  }) {
    textEditMenu_Model.wordSpacing = wordSpacing;
    box.write('wordSpacing', textEditMenu_Model.wordSpacing);
    update();
  }
}
