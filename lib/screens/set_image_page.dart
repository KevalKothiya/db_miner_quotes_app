
import 'package:db_miner/controllers/controller_getController.dart';
import 'package:db_miner/controllers/dp_helper.dart';
import 'package:db_miner/models/globals.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ImagePage extends StatefulWidget {
  const ImagePage({Key? key}) : super(key: key);

  @override
  State<ImagePage> createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  late Future<List<Image_Model>?> getAllImages;
  SettingController_Getx settingController = Get.put(SettingController_Getx());
  CarouselSliderImage_Getx carouselSlider = Get.put(CarouselSliderImage_Getx());
  ScrollController _scrollController = ScrollController();

  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    getAllImages = WIHelper.wiHelper.fetchAllImages(search: "Lion");
  }

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
              "Wall",
              style: TextStyle(
                color: (settingController.settingController.isDarkMode)
                    ? CupertinoColors.systemPurple
                    : CupertinoColors.black,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: (settingController.settingController.isDarkMode)
                  ? CupertinoColors.black
                  : CupertinoColors.white,
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  CupertinoTextFormFieldRow(
                    controller: _controller,
                    placeholderStyle: TextStyle(
                      color: (settingController.settingController.isDarkMode)
                          ? CupertinoColors.systemPurple
                          : CupertinoColors.black,
                    ),
                    style: TextStyle(
                      color: (settingController.settingController.isDarkMode)
                          ? CupertinoColors.systemPurple
                          : CupertinoColors.white,
                    ),
                    placeholder: "Saarch....",
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: (settingController.settingController.isDarkMode)
                            ? CupertinoColors.systemPurple
                            : CupertinoColors.activeBlue,
                      ),
                    ),
                    onFieldSubmitted: (val) {
                      setState(() {
                        getAllImages =
                            WIHelper.wiHelper.fetchAllImages(search: val);
                      });
                    },
                  ),
                  FutureBuilder(
                      future: getAllImages,
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Center(
                            child: Text("Error : ${snapshot.error}"),
                          );
                        } else if (snapshot.hasData) {
                          List<Image_Model>? data = snapshot.data;

                          return (data!.isEmpty)
                              ? Center(
                                  child: Text("Error"),
                                )
                              : GridView.builder(
                                  controller: _scrollController,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          mainAxisSpacing: 8,
                                          crossAxisSpacing: 8,
                                          childAspectRatio: 2 / 3),
                                  itemCount: data.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, i) {
                                    return CupertinoContextMenu.builder(
                                      actions: [
                                        CupertinoContextMenuAction(
                                          child: Text("Set QuotesScreen"),
                                          isDefaultAction: true,
                                          onPressed: () {
                                            print("Start");
                                            // print("${allImages[i]}");
                                            carouselSlider.getter(
                                                selectedImage: data[i].image);
                                            print("End");
                                            Get.back();
                                          },
                                        ),
                                        CupertinoContextMenuAction(
                                          child: Text("Set HomeScreen"),
                                          onPressed: () async {
                                            // var file = await DefaultCacheManager().getSingleFile(url);
                                            // AsyncWallpaper.setWallpaperFromFile(filePath: filePath)

                                            Get.back();
                                          },
                                        ),
                                        CupertinoContextMenuAction(
                                          child: Text("Set LockScreen"),
                                        ),
                                        CupertinoContextMenuAction(
                                          child: Text("Both Screen"),
                                          isDestructiveAction: true,
                                        ),
                                      ],
                                      builder: (context, _) {
                                        return Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                data[i].image,
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                            border: Border.all(
                                              color: (settingController
                                                      .settingController
                                                      .isDarkMode)
                                                  ? CupertinoColors.white
                                                      .withOpacity(0.5)
                                                  : Colors.transparent,
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                );
                        }

                        return Center(
                          child: CupertinoActivityIndicator(),
                        );
                      }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
