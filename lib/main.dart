import 'package:db_miner/screens/details_page.dart';
import 'package:db_miner/screens/homepage.dart';
import 'package:db_miner/screens/splashscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(
    Sizer(
      builder: (BuildContext buildContext, _, __) {
        return GetCupertinoApp(
          // theme: ThemeData(
          //   useMaterial3: true,
          //   colorSchemeSeed: Colors.purple,
          // ),
          theme: CupertinoThemeData(
            brightness: Brightness.light,
            primaryColor: CupertinoColors.systemPurple,
          ),
          getPages: [
            GetPage(name: '/', page: () => HomePage()),
            GetPage(name: '/details_page', page: () => DetailsPage()),
            GetPage(name: '/splash_screen', page: () => SplashScreen()),
          ],
        );
      },
    ),
  );
}
