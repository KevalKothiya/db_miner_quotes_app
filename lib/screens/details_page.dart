import 'dart:io';
import 'dart:ui' as ui;

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:async_wallpaper/async_wallpaper.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:crop/crop.dart';
import 'package:db_miner/controllers/controller_getController.dart';
import 'package:db_miner/controllers/dp_helper.dart';
import 'package:db_miner/models/globals.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:sizer/sizer.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final controller = CropController(aspectRatio: 1000 / 667.0);

  FetchId fetchId = Get.find<FetchId>();

  Future<List<DataBase>>? getQutoes;

  Future<List<NewFolderList_DataBase>?>? getTableName;

  SettingController_Getx settingController = Get.put(SettingController_Getx());

  CarouselSliderImage_Getx carouselImage = Get.put(CarouselSliderImage_Getx());

  int _counter = 0;
  Uint8List? _imageFile;

  ScreenshotController screenshotController = ScreenshotController();

  @override
  void initState() {
    super.initState();

    getQutoes = DBHelper.dbHelper.fetchAllRecordsData(id: fetchId.i!.value);

    getTableName = DBHelper.dbHelper.fetchIntoNewFolderNameSave();
  }

  // final DecorationTween _tween = DecorationTween(
  //   begin: BoxDecoration(
  //     color: Colors.transparent,
  //     boxShadow: const <BoxShadow>[],
  //     borderRadius: BorderRadius.circular(20.0),
  //   ),
  //   end: BoxDecoration(
  //     color: Colors.transparent,
  //     boxShadow: CupertinoContextMenu.kEndBoxShadow,
  //     borderRadius: BorderRadius.circular(20.0),
  //   ),
  // );
  //
  //  Animation<Decoration> _boxDecorationAnimation(
  //     Animation<double> animation) {
  //   return _tween.animate(
  //     CurvedAnimation(
  //       parent: animation,
  //       curve: Interval(
  //         0.0,
  //         CupertinoContextMenu.animationOpensAt,
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    DataBase_Model data =
        ModalRoute.of(context)!.settings.arguments as DataBase_Model;

    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            child: FutureBuilder(
              future: getQutoes,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text("Error : ${snapshot.error}"),
                  );
                } else if (snapshot.hasData) {
                  List<DataBase>? ss = snapshot.data;

                  if (ss!.isEmpty) {
                    return Center(
                      child: Text("Empty"),
                    );
                  } else {
                    return Builder(builder: (context) {
                      return Screenshot(
                        controller: screenshotController,
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                carouselImage.carousel_Model.carouselimage,
                              ),
                              fit: BoxFit.cover,
                              opacity: 0.9,
                            ),
                          ),
                          child: Container(
                            child: CarouselSlider.builder(
                              itemCount: ss.length,
                              itemBuilder: (context, i, realIndex) {
                                return Container(
                                  color: Colors.transparent,
                                  padding: EdgeInsets.all(16),
                                  alignment: AlignmentDirectional.center,
                                  child: Column(
                                    children: [
                                      Spacer(),
                                      Wrap(
                                        children: [
                                          Text(
                                            ss[i].quote,
                                            style: TextStyle(
                                              fontSize: 2.5.h,
                                              color:
                                                  CupertinoColors.systemGrey5,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          AnimatedTextKit(
                                            animatedTexts: [
                                              TypewriterAnimatedText(
                                                ss[i].author,
                                                textStyle: TextStyle(
                                                  fontSize: 2.5.h,
                                                  color: CupertinoColors
                                                      .systemGrey,
                                                ),
                                                speed: Duration(
                                                  milliseconds: 100,
                                                ),
                                              ),
                                            ],
                                            totalRepeatCount: 2,
                                            pause: const Duration(
                                                milliseconds: 2000),
                                            displayFullTextOnTap: true,
                                            stopPauseOnTap: true,
                                            onTap: () {},
                                          ),
                                        ],
                                      ),
                                      Spacer(),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          cupertinoButton(
                                            icon: CupertinoIcons.heart_fill,
                                            color:
                                                CupertinoColors.destructiveRed,
                                            onPressed: null,
                                          ),
                                          cupertinoButton(
                                            icon: CupertinoIcons.share_up,
                                            color: CupertinoColors.white,
                                            onPressed: null,
                                          ),
                                          FutureBuilder(
                                              future: getTableName,
                                              builder: (context, snapshot) {
                                                if (snapshot.hasError) {
                                                  return Center(
                                                    child: Text(
                                                        "Error :${snapshot.error}"),
                                                  );
                                                } else if (snapshot.hasData) {
                                                  List<NewFolderList_DataBase>?
                                                      sss = snapshot.data;
                                                  return (sss!.isEmpty)
                                                      ? Center(
                                                          child: Text(
                                                              "Error :${snapshot.error}"),
                                                        )
                                                      : Container(
                                                          height: 25,
                                                          width: 25,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                            color:
                                                                CupertinoColors
                                                                    .white,
                                                          ),
                                                          // color: CupertinoColors.black,
                                                          child:
                                                              CupertinoContextMenu(
                                                            actions: sss.map(
                                                              (e) {
                                                                int i = sss
                                                                    .indexOf(e);
                                                                return CupertinoContextMenuAction(
                                                                  child: Text(
                                                                      "${e.tableName}"),
                                                                  onPressed:
                                                                      () async {
                                                                    print(e
                                                                        .tableName);
                                                                    await DBHelper
                                                                        .dbHelper
                                                                        .addNewFolder(
                                                                            name:
                                                                                e.tableName);
                                                                    print("1");
                                                                    await DBHelper
                                                                        .dbHelper
                                                                        .insertIntoNewFolder(
                                                                      tableName:
                                                                          e.tableName,
                                                                      id: ss[i]
                                                                          .id,
                                                                      name: data
                                                                          .name,
                                                                      author: ss[
                                                                              i]
                                                                          .author,
                                                                      quote: ss[
                                                                              i]
                                                                          .quote,
                                                                    );
                                                                    print("2");
                                                                    Get.snackbar(
                                                                        "SUSSESS",
                                                                        "Successfully Insert Into ${e.tableName}");
                                                                    print("3");
                                                                  },
                                                                );
                                                              },
                                                            ).toList(),
                                                            child: Container(
                                                              height: 25,
                                                              width: 25,
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5),
                                                                color:
                                                                    CupertinoColors
                                                                        .white,
                                                              ),
                                                              child: Icon(
                                                                CupertinoIcons
                                                                    .add,
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                }
                                                return Center(
                                                  child:
                                                      CupertinoActivityIndicator(),
                                                );
                                              }),
                                          // cupertinoButton(
                                          //   icon: CupertinoIcons.add,
                                          //   color: CupertinoColors.white,
                                          //   onPressed: () {
                                          //     Container(
                                          //       child: ,
                                          //     );
                                          //   },
                                          // ),
                                          cupertinoButton(
                                            icon: CupertinoIcons.camera,
                                            color: CupertinoColors.white,
                                            onPressed: () {
                                              // screenshotController
                                              //     .capture(
                                              //     delay: Duration(
                                              //         milliseconds: 10))
                                              //     .then((capturedImage) async {
                                              //   ShowCapturedWidget(
                                              //       context, capturedImage!);
                                              //   _imageFile = capturedImage;
                                              //   setState(() {});
                                              // }).catchError((onError) {
                                              //   print(onError);
                                              // });

                                              showCupertinoDialog(
                                                context: context,
                                                builder: (context) {
                                                  return CupertinoAlertDialog(
                                                    actions: [
                                                      CupertinoDialogAction(
                                                        child:
                                                            Text("Home Screen"),
                                                        onPressed: () async {
                                                          setWallpaper(
                                                            wallpaperLocation:
                                                                AsyncWallpaper
                                                                    .HOME_SCREEN,
                                                          );
                                                        },
                                                      ),
                                                      CupertinoDialogAction(
                                                        child:
                                                            Text("Lock Screen"),
                                                        onPressed: () async {
                                                          setWallpaper(
                                                            wallpaperLocation:
                                                                AsyncWallpaper
                                                                    .LOCK_SCREEN,
                                                          );
                                                        },
                                                      ),
                                                      CupertinoDialogAction(
                                                        child:
                                                            Text("Both Screen"),
                                                        onPressed: () async {
                                                          setWallpaper(
                                                            wallpaperLocation:
                                                                AsyncWallpaper
                                                                    .BOTH_SCREENS,
                                                          );
                                                        },
                                                      ),
                                                    ],
                                                    title:
                                                        Text("Set Wallpaper"),
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                          cupertinoButton(
                                            icon: CupertinoIcons.delete,
                                            color: CupertinoColors.white,
                                            onPressed: null,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                );
                              },
                              options: CarouselOptions(
                                height: 400,
                                scrollDirection: Axis.vertical,
                                viewportFraction: 1,
                                enlargeCenterPage: true,
                              ),
                            ),
                          ),
                        ),
                      );
                    });
                  }
                }
                return Center(
                  child: CupertinoActivityIndicator(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  cupertinoButton({
    required IconData icon,
    required Color color,
    required onPressed,
  }) {
    return CupertinoButton(
      child: Icon(
        icon,
        color: color,
      ),
      onPressed: onPressed,
    );
  }

  Future<dynamic> ShowCapturedWidget(
      BuildContext context, Uint8List capturedImage) {
    return showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoPageScaffold(
        child: CustomScrollView(
          slivers: [
            CupertinoSliverNavigationBar(
              largeTitle: Text("Captured widget screenshot"),
            ),
            SliverFillRemaining(
              child: Stack(
                children: [
                  Center(
                      child: capturedImage != null
                          ? Image.memory(capturedImage)
                          : Container()),
                  CupertinoButton(
                    child: Icon(Icons.wallpaper),
                    onPressed: () {
                      showCupertinoDialog(
                        context: context,
                        builder: (context) {
                          return CupertinoAlertDialog(
                            actions: [
                              CupertinoDialogAction(
                                child: Text("Home Screen"),
                                onPressed: () async {
                                  setWallpaper(
                                      wallpaperLocation:
                                          AsyncWallpaper.HOME_SCREEN);
                                },
                              ),
                              CupertinoDialogAction(
                                child: Text("Lock Screen"),
                                onPressed: () async {},
                              ),
                              CupertinoDialogAction(
                                child: Text("Both Screen"),
                                onPressed: () async {},
                              ),
                            ],
                            title: Text("Set Wallpaper"),
                          );
                        },
                      );
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> setWallpaper({required wallpaperLocation}) async {
    Uint8List? uint8list = await screenshotController.capture();

    if (uint8list != null) {
      final directory = (await getTemporaryDirectory()).path;

      final imagePath = '$directory/screenshot.png';

      File imageFile = File(imagePath);

      await imageFile.writeAsBytes(uint8list);

// Set the wallpaper from the file
      await AsyncWallpaper.setWallpaperFromFile(
        filePath: imagePath,
        wallpaperLocation: wallpaperLocation,
      );
    }
  }
}
