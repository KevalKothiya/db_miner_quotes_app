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
  StorageData storageData = StorageData(storageData: false, storage: false);

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
}

class FetchId extends GetxController {
  RxInt? i;

  fetchId({required int id}) {
    i = id.obs;
  }
}

class CarouselSliderImage_Getx extends GetxController {
  CarouselSliderImage_Model carousel_Model = CarouselSliderImage_Model(
      carouselimage: "https://pixabay.com/get/g479abda88f5a99b2e44b7e9fce2e55917159e2f5a47880077d6bf84bcbf9e8f34597b6458e5953ddc889d1b2105a67d375930de153ec2ecf316c1c05d49d58f6_1280.jpg");

  getter({required String selectedImage}) async {
    carousel_Model.carouselimage = selectedImage;
  }
}

class NewFolderList_Getx extends ChangeNotifier {
  NewFolderList_Model newFolder;

  NewFolderList_Getx({
    required this.newFolder,
  });

  init({required String tableName}) async {
    newFolder.newFolderList.add(tableName);
    SharedPreferences preferences = await SharedPreferences.getInstance();

    preferences.setStringList('newFolderNameList', newFolder.newFolderList);

    notifyListeners();
  }
}
