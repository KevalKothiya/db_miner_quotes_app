import 'package:db_miner/controllers/controller_getController.dart';
import 'package:db_miner/screens/details_page.dart';
import 'package:db_miner/screens/favourite_page.dart';
import 'package:db_miner/screens/folder_details_page.dart';
import 'package:db_miner/screens/homepage.dart';
import 'package:db_miner/screens/profile_page.dart';
import 'package:db_miner/screens/fontsize_page.dart';
import 'package:db_miner/screens/set_image_page.dart';
import 'package:db_miner/screens/splashscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sizer/sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  await GetStorage.init();

  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences preferences = await SharedPreferences.getInstance();

  List<String> newFolderList =
      await preferences.getStringList('newFolderNameSave') ?? [];
  runApp(Sizer(
    builder: (BuildContext buildContext, _, __) {
      return Home();
    },
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  SettingController_Getx settingController = Get.put(SettingController_Getx());

  @override
  Widget build(BuildContext context) {
    return GetCupertinoApp(
      theme: CupertinoThemeData(
        brightness: Brightness.light,
        primaryColor: CupertinoColors.systemBlue,
      ),
      getPages: [
        GetPage(name: '/', page: () => HomePage()),
        GetPage(name: '/splash_screen', page: () => SplashScreen()),
        GetPage(name: '/details_page', page: () => DetailsPage()),
        GetPage(name: '/image_page', page: () => ImagePage()),
        GetPage(name: '/font_size_page', page: () => FontSizePage()),
        GetPage(name: '/favourite_page', page: () => FavouritePage()),
        GetPage(name: '/profile_page', page: () => ProfilePage()),
        GetPage(name: '/folder_details_page', page: () => FolderDetailsPage()),
      ],
    );
  }
}
