import 'package:db_miner/controllers/controller_getController.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ImageDetailsPage extends StatefulWidget {
  const ImageDetailsPage({Key? key}) : super(key: key);

  @override
  State<ImageDetailsPage> createState() => _ImageDetailsPageState();
}

class _ImageDetailsPageState extends State<ImageDetailsPage> {
  SettingController_Getx settingController = Get.put(SettingController_Getx());

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        backgroundColor: (settingController.settingController.isDarkMode)
            ? CupertinoColors.black
            : CupertinoColors.white,
        child: CustomScrollView(
      slivers: [
        CupertinoSliverNavigationBar(
          backgroundColor: (settingController.settingController.isDarkMode)
              ? CupertinoColors.black
              : CupertinoColors.white,
          largeTitle: Text(
            "data",
            style: TextStyle(
              color: (settingController.settingController.isDarkMode)
                  ? CupertinoColors.white
                  : CupertinoColors.black,
            ),
          ),
        ),
        // SliverToBoxAdapter(
        //   child: Cupertino,
        // ),
      ],
    ));
  }
}
