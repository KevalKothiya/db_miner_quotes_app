import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:db_miner/controllers/controller_getController.dart';
import 'package:db_miner/controllers/dp_helper.dart';
import 'package:db_miner/models/globals.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({Key? key}) : super(key: key);

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  Future<List<DataBase>>? getAllData;

  SettingController_Getx settingController = Get.put(SettingController_Getx());

  TextEditMenu_Getx _editMenu_Getx = Get.put(TextEditMenu_Getx());


  @override
  void initState() {
    super.initState();
    getAllData = DBHelper.dbHelper.fetchAllDataFavourite();
  }

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
                : CupertinoColors.activeBlue.withOpacity(0.3),
            largeTitle: Text("Favourite",
              style: TextStyle(
                color:
                (settingController.settingController.isDarkMode)
                    ? CupertinoColors.white
                    : CupertinoColors.black,
              ),),
          ),
          SliverFillRemaining(
            child: Container(
              decoration: BoxDecoration(
                color:
                (settingController.settingController.isDarkMode)
                    ? CupertinoColors.black
                    : CupertinoColors.white,
              ),
              child: FutureBuilder(
                future: getAllData,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text("Error : ${snapshot.error}"),
                    );
                  } else if (snapshot.hasData) {
                    List<DataBase>? ss = snapshot.data;
                    return (ss!.isEmpty)
                        ? Container(
                     color: (settingController.settingController.isDarkMode)
                          ? CupertinoColors.black
                          : CupertinoColors.activeBlue.withOpacity(0.5),
                          child: Center(
                              child: Text("No Data Available...",
                                style: TextStyle(
                                  color:
                                  (settingController.settingController.isDarkMode)
                                      ? CupertinoColors.white
                                      : CupertinoColors.black,
                                ),),
                            ),
                        )
                        : Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: (settingController
                                        .settingController.isDarkMode)
                                    ? NetworkImage(
                                        "https://uxmisfit.com/wp-content/uploads/2021/01/glass_card_04.jpg",)
                                    : NetworkImage(
                                        "https://img.freepik.com/premium-vector/glassmorphism-style-social-media-concept-photo-carousel-blank-template-realistic-glass-morphism-effect-with-set-transparent-glass-plates-vector-illustration_399089-856.jpg?w=360"
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
                                        Spacer(
                                          flex: (settingController.settingController.isDarkMode)?2:1,
                                        ),
                                        Wrap(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 60),
                                              child: Text(
                                                ss[i].quote.toString(),
                                                style: TextStyle(
                                                  fontSize: _editMenu_Getx.textEditMenu_Model.fontSize,
                                                  letterSpacing: _editMenu_Getx.textEditMenu_Model.letterSpacing,
                                                  wordSpacing: _editMenu_Getx.textEditMenu_Model.wordSpacing,
                                                  fontWeight: _editMenu_Getx.textEditMenu_Model.fontWeight,
                                                  fontStyle: _editMenu_Getx.textEditMenu_Model.fontStyle,
                                                  color:
                                                  (settingController.settingController.isDarkMode)
                                                      ? CupertinoColors.white
                                                      : CupertinoColors.black,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        AnimatedTextKit(
                                          animatedTexts: [
                                            TypewriterAnimatedText(
                                              ss[i].author,
                                              textStyle: TextStyle(
                                                fontSize: _editMenu_Getx.textEditMenu_Model.fontSize,
                                                letterSpacing: _editMenu_Getx.textEditMenu_Model.letterSpacing,
                                                wordSpacing: _editMenu_Getx.textEditMenu_Model.wordSpacing,
                                                fontWeight: _editMenu_Getx.textEditMenu_Model.fontWeight,
                                                fontStyle: _editMenu_Getx.textEditMenu_Model.fontStyle,
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
                                        Spacer(),
                                        SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              cupertinoButton(
                                                icon: CupertinoIcons.share_up,
                                                color:
                                                    CupertinoColors.systemGrey,
                                                onPressed: null,
                                              ),
                                              cupertinoButton(
                                                icon: CupertinoIcons.delete,
                                                color:
                                                    CupertinoColors.systemGrey,
                                                onPressed: null,
                                              ),
                                            ],
                                          ),
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
                          );
                  }
                  return Center(
                    child: CupertinoActivityIndicator(),
                  );
                },
              ),
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
}
