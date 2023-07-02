import 'package:db_miner/controllers/controller_getController.dart';
import 'package:db_miner/controllers/dp_helper.dart';
import 'package:db_miner/models/globals.dart';
import 'package:db_miner/models/utils.dart';
import 'package:db_miner/screens/profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  TabBarIndex_GetController tabBarIndex_getController =
      Get.put(TabBarIndex_GetController());

  Image_GetController image_model = Get.put(Image_GetController());

  // NewFolderList_Getx? newFolder = Get.put(NewFolderList_Getx());

  FetchId fetchId = Get.put(FetchId());

  Future<List<DataBase_Model>>? getQutoes;

  Future<List<NewFolderList_DataBase>?>? getTableName;

  final ScrollController _firstController = ScrollController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController _controller = TextEditingController();

  SettingController_Getx settingController = Get.put(SettingController_Getx());

  @override
  void initState() {
    super.initState();
    getQutoes = DBHelper.dbHelper.fetchAllRecords();
    getTableName = DBHelper.dbHelper.fetchIntoNewFolderNameSave();
  }

  @override
  Widget build(BuildContext context) {
    var data = ModalRoute.of(context)?.settings.arguments;

    return CupertinoPageScaffold(
      backgroundColor: (settingController.settingController.isDarkMode)
          ? CupertinoColors.black
          : CupertinoColors.white,
      child: FutureBuilder(
        future: getQutoes,
        builder: (context, ss) {
          if (ss.hasError) {
            return Center(
              child: Text("Error : ${ss.error}"),
            );
          } else if (ss.hasData) {
            List<DataBase_Model>? data = ss.data;
            return (data == null || data.isEmpty)
                ? Center(
                    child: Text("Error."),
                  )
                : CustomScrollView(
                    slivers: [
                      CupertinoSliverNavigationBar(
                        backgroundColor:
                            (settingController.settingController.isDarkMode)
                                ? CupertinoColors.black
                                : CupertinoColors.white,
                        largeTitle: Text(
                          "Explore",
                          style: TextStyle(
                            color:
                                (settingController.settingController.isDarkMode)
                                    ? CupertinoColors.white
                                    : CupertinoColors.black,
                          ),
                        ),
                        leading: CupertinoButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.leftToRightPop,
                                  child: ProfilePage(),
                                  inheritTheme: true,
                                  curve: Curves.easeInOut,
                                  childCurrent: Container(),
                                  duration: Duration(milliseconds: 2000),
                                  ctx: context),
                            );
                          },
                          child: Icon(
                            CupertinoIcons.profile_circled,
                          ),
                        ),
                        trailing: CupertinoButton(
                          child: Icon(CupertinoIcons.add_circled),
                          onPressed: () {
                            showCupertinoDialog(
                                context: context,
                                builder: (context) {
                                  return CupertinoAlertDialog(
                                    title: Text("New Folder"),
                                    content: Container(
                                      child: Column(
                                        children: [
                                          Text("Enter a name for this folder."),
                                          Form(
                                            key: formKey,
                                            child: CupertinoTextFormFieldRow(
                                              controller: _controller,
                                              validator: (val) {
                                                if (val!.isEmpty) {
                                                  return "FullName...";
                                                } else {
                                                  return null;
                                                }
                                              },
                                              placeholderStyle: TextStyle(
                                                color: CupertinoColors.black,
                                              ),
                                              style: TextStyle(
                                                color: CupertinoColors.black,
                                              ),
                                              placeholder: "Title",
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                  color: CupertinoColors.black,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    actions: [
                                      CupertinoDialogAction(
                                        child: Text("Cansel"),
                                        isDestructiveAction: true,
                                        onPressed: () {
                                          Get.back();
                                        },
                                      ),
                                      CupertinoDialogAction(
                                        child: Text("Save"),
                                        onPressed: () {
                                          if (formKey.currentState!
                                              .validate()) {
                                            formKey.currentState!.save();

                                            showCupertinoDialog(
                                                context: context,
                                                builder: (context) {
                                                  return CupertinoAlertDialog(
                                                    title: Text("Alert"),
                                                    content: Text(
                                                        "Proceed with destructive action?"),
                                                    actions: [
                                                      CupertinoDialogAction(
                                                        child: Text("No"),
                                                        onPressed: () {
                                                          Get.back();
                                                          Get.back();
                                                        },
                                                      ),
                                                      CupertinoDialogAction(
                                                        isDestructiveAction:
                                                            true,
                                                        child: Text("Yes"),
                                                        onPressed: () async {
                                                          Get.back();
                                                          Get.back();

                                                          await DBHelper
                                                              .dbHelper
                                                              .insertIntoNewFolderNameSave(
                                                                  name:
                                                                      _controller
                                                                          .text);

                                                          // newFolder?.init(tableName: _controller.text);
                                                          Provider.of<NewFolderList_Getx>(
                                                                  context,
                                                                  listen: false)
                                                              .init(
                                                                  tableName:
                                                                      _controller
                                                                          .text);

                                                          await DBHelper
                                                              .dbHelper
                                                              .addNewFolder(
                                                                  name:
                                                                      _controller
                                                                          .text);

                                                          Get.snackbar(
                                                            "SUCCESS",
                                                            "New Folder Created successfully...",
                                                            backgroundColor:
                                                                CupertinoColors
                                                                    .activeGreen,
                                                            snackPosition:
                                                                SnackPosition
                                                                    .BOTTOM,
                                                          );
                                                          setState(() {
                                                            _controller.clear();
                                                          });
                                                        },
                                                      ),
                                                    ],
                                                  );
                                                });
                                          }
                                        },
                                      ),
                                    ],
                                  );
                                });
                          },
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Container(
                          color:
                              (settingController.settingController.isDarkMode)
                                  ? CupertinoColors.black
                                  : CupertinoColors.white,
                          height: 50,
                          padding: EdgeInsets.only(left: 16.0, right: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CupertinoButton(
                                onPressed: null,
                                child: Icon(
                                  CupertinoIcons.home,
                                  color: (settingController
                                          .settingController.isDarkMode)
                                      ? CupertinoColors.white
                                      : CupertinoColors.black,
                                ),
                              ),
                              CupertinoButton(
                                onPressed: null,
                                child: Icon(
                                  CupertinoIcons.person,
                                  color: (settingController
                                          .settingController.isDarkMode)
                                      ? CupertinoColors.white
                                      : CupertinoColors.black,
                                ),
                              ),
                              CupertinoButton(
                                onPressed: null,
                                child: Icon(
                                  CupertinoIcons.gamecontroller_alt_fill,
                                  color: (settingController
                                          .settingController.isDarkMode)
                                      ? CupertinoColors.white
                                      : CupertinoColors.black,
                                ),
                              ),
                              CupertinoButton(
                                onPressed: null,
                                child: Icon(
                                  CupertinoIcons.settings,
                                  color: (settingController
                                          .settingController.isDarkMode)
                                      ? CupertinoColors.white
                                      : CupertinoColors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: EdgeInsets.all(16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "My Albums",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: (settingController
                                          .settingController.isDarkMode)
                                      ? CupertinoColors.white
                                      : CupertinoColors.black,
                                ),
                              ),
                              CupertinoButton(
                                  child: Text("See All"),
                                  onPressed: () {
                                    Get.snackbar("ok", "SussessFull");
                                  })
                            ],
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CupertinoScrollbar(
                            thumbVisibility: true,
                            controller: _firstController,
                            thicknessWhileDragging: 20,
                            thickness: 25,
                            radius: Radius.circular(10),
                            scrollbarOrientation: ScrollbarOrientation.right,
                            child: GridView.builder(
                              scrollDirection: Axis.vertical,
                              controller: _firstController,
                              shrinkWrap: true,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 5,
                                crossAxisSpacing: 5,
                              ),
                              itemCount: data.length,
                              itemBuilder: (context, i) {
                                return GestureDetector(
                                  onTap: () {
                                    fetchId.fetchId(id: i + 1);

                                    Get.toNamed(
                                      "/details_page",
                                      arguments: data[i],
                                    );
                                  },
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 157,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          border: Border.all(
                                            color: (settingController
                                                    .settingController
                                                    .isDarkMode)
                                                ? CupertinoColors.white
                                                    .withOpacity(0.5)
                                                : Colors.transparent,
                                          ),
                                          image: DecorationImage(
                                            image: AssetImage(
                                                AllImage.allImages[i % 7]),
                                            fit: BoxFit.cover,
                                            opacity: 0.8,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "${data[i].name}",
                                        style: TextStyle(
                                          color: (settingController
                                                  .settingController.isDarkMode)
                                              ? CupertinoColors.white
                                              : CupertinoColors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: (Provider.of<NewFolderList_Getx>(context)
                                .newFolder
                                .newFolderList
                                .isNotEmpty)
                            ? Container()
                            : Container(
                                padding: EdgeInsets.symmetric(horizontal: 22),
                                height: 219,
                                child: Column(
                                  children: [
                                    Divider(
                                      color: (settingController
                                              .settingController.isDarkMode)
                                          ? CupertinoColors.white
                                          : CupertinoColors.black,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Created Folder",
                                          style: TextStyle(
                                            color: (settingController
                                                    .settingController
                                                    .isDarkMode)
                                                ? CupertinoColors.white
                                                : CupertinoColors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    FutureBuilder(
                                      future: getTableName,
                                      builder: (context, snapshot) {
                                        if (snapshot.hasError) {
                                          return Center(
                                            child: Text(
                                                "Error : ${snapshot.error}"),
                                          );
                                        } else if (snapshot.hasData) {
                                          List<NewFolderList_DataBase>? sss =
                                              snapshot.data;

                                          if (sss!.isEmpty) {
                                            return Center(
                                              child: Text("Empty"),
                                            );
                                          } else {
                                            return SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    ...sss.map((e) {
                                                      int i = sss.indexOf(e);
                                                      return Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          border: Border.all(
                                                            color: (settingController
                                                                    .settingController
                                                                    .isDarkMode)
                                                                ? CupertinoColors
                                                                    .white
                                                                    .withOpacity(
                                                                        0.5)
                                                                : Colors
                                                                    .transparent,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                        ),
                                                        margin:
                                                            EdgeInsets.all(5),
                                                        child: Column(
                                                          children: [
                                                            GestureDetector(
                                                              onTap: () async {
                                                                List<NewFolderData>?
                                                                    data =
                                                                    await DBHelper
                                                                        .dbHelper
                                                                        .fetchIntoNewFolder(
                                                                            tableName:
                                                                                e.tableName);
                                                                Get.toNamed(
                                                                  '/folder_details_page',
                                                                  arguments:
                                                                      data,
                                                                );
                                                              },
                                                              child: Container(
                                                                width: 150,
                                                                height: 150,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color:
                                                                      CupertinoColors
                                                                          .black,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12),
                                                                  image:
                                                                      DecorationImage(
                                                                    image: AssetImage(
                                                                        AllImage.allImages[i %
                                                                            7]),
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Text(
                                                              "${e.tableName}",
                                                              style: TextStyle(
                                                                color: (settingController
                                                                        .settingController
                                                                        .isDarkMode)
                                                                    ? CupertinoColors
                                                                        .white
                                                                    : CupertinoColors
                                                                        .black,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    }).toList(),
                                                  ]),
                                            );
                                            // return GridView.builder(
                                            //   scrollDirection: Axis.horizontal,
                                            //     controller: _firstController,
                                            //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                            //       crossAxisCount: 2,
                                            //       mainAxisSpacing: 5,
                                            //       crossAxisSpacing: 2,),
                                            //     shrinkWrap: true,
                                            //     itemCount: sss.length,
                                            //     itemBuilder: (context,i){
                                            //       return Container(
                                            //         color: CupertinoColors.systemBlue,
                                            //         child: Text("${sss[i].tableName}"),
                                            //       );
                                            //     });
                                          }
                                        }
                                        return Center(
                                          child: CupertinoActivityIndicator(),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                      ),
                    ],
                  );
          }
          return Center(
            child: CupertinoActivityIndicator(),
          );
        },
      ),
    );
    // return Scaffold(
    //   body: Container(
    //     alignment: Alignment.center,
    //     child: FutureBuilder(
    //       future: getQutoes,
    //       builder: (context, ss) {
    //         if (ss.hasError) {
    //           return Center(
    //             child: Text("Error : ${ss.error}"),
    //           );
    //         } else if (ss.hasData) {
    //           List<Qutoes_Model>? data = ss.data;
    //
    //           return Center(
    //             child: ListView.builder(
    //                 itemCount: data?.length,
    //                 itemBuilder: (context, i) {
    //                   return ListTile(
    //                     title: Text("${data![i].name}"),
    //                   );
    //                 }),
    //           );
    //         }
    //         return Center(child: CircularProgressIndicator());
    //       },
    //     ),
    //   ),
    // );
  }
}

// {
// "id": 8,
// "name": "LEADERSHIP",
// "quotes": [
// {
// "id": 1,
// "quote": "The function of leadership is to produce more leaders, not more followers.",
// "author": "Ralph Nader",
// "image" : ""
// },
// {
// "id": 2,
// "quote": "Leadership is not about being in charge. It is about taking care of those in your charge.",
// "author": "Simon Sinek",
// "image" : ""
// },
// {
// "id": 3,
// "quote": "The greatest leader is not necessarily the one who does the greatest things. They are the one who gets the people to do the greatest things.",
// "author": "Ronald Reagan",
// "image" : ""
// },
// {
// "id": 4,
// "quote": "Leadership is not about being in control. It is about creating conditions for others to succeed.",
// "author": "Unknown",
// "image" : ""
// },
// {
// "id": 5,
// "quote": "A good leader takes a little more than their share of the blame, a little less than their share of the credit.",
// "author": "Arnold H. Glasow",
// "image" : ""
// },
// {
// "id": 6,
// "quote": "The art of leadership is saying no, not saying yes. It is very easy to say yes.",
// "author": "Tony Blair",
// "image" : ""
// },
// {
// "id": 7,
// "quote": "The best leaders are those most interested in surrounding themselves with assistants and associates smarter than they are.",
// "author": "John C. Maxwell",
// "image" : ""
// },
// {
// "id": 8,
// "quote": "The greatest leader is not necessarily the one who does the greatest things. They are the one who gets the people to do the greatest things.",
// "author": "Ronald Reagan",
// "image" : ""
// },
// {
// "id": 9,
// "quote": "A true leader has the confidence to stand alone, the courage to make tough decisions, and the compassion to listen to the needs of others.",
// "author": "Douglas MacArthur",
// "image" : ""
// },
// {
// "id": 10,
// "quote": "The function of leadership is to produce more leaders, not more followers.",
// "author": "Ralph Nader",
// "image" : ""
// },
// {
// "id": 11,
// "quote": "The art of leadership is saying no, not saying yes. It is very easy to say yes.",
// "author": "Tony Blair",
// "image" : ""
// },
// {
// "id": 12,
// "quote": "The challenge of leadership is to be strong, but not rude; be kind, but not weak; be bold, but not a bully; be humble, but not timid; be proud, but not arrogant; have humor, but without folly.",
// "author": "Jim Rohn",
// "image" : ""
// },
// {
// "id": 13,
// "quote": "A leader is one who knows the way, goes the way, and shows the way.",
// "author": "John C. Maxwell",
// "image" : ""
// },
// {
// "id": 14,
// "quote": "Leadership is not about being in control. It is about creating conditions for others to succeed.",
// "author": "Unknown",
// "image" : ""
// },
// {
// "id": 15,
// "quote": "Leadership is not about being in charge. It is about taking care of those in your charge.",
// "author": "Simon Sinek",
// "image" : ""
// },
// {
// "id": 16,
// "quote": "A good leader takes a little more than their share of the blame, a little less than their share of the credit.",
// "author": "Arnold H. Glasow",
// "image" : ""
// },
// {
// "id": 17,
// "quote": "A true leader has the confidence to stand alone, the courage to make tough decisions, and the compassion to listen to the needs of others.",
// "author": "Douglas MacArthur",
// "image" : ""
// },
// {
// "id": 18,
// "quote": "The best leaders are those most interested in surrounding themselves with assistants and associates smarter than they are.",
// "author": "John C. Maxwell",
// "image" : ""
// },
// {
// "id": 19,
// "quote": "Leadership is not about being in control. It is about creating conditions for others to succeed.",
// "author": "Unknown",
// "image" : ""
// },
// {
// "id": 20,
// "quote": "The function of leadership is to produce more leaders, not more followers.",
// "author": "Ralph Nader",
// "image" : ""
// },
// {
// "id": 21,
// "quote": "The art of leadership is saying no, not saying yes. It is very easy to say yes.",
// "author": "Tony Blair",
// "image" : ""
// },
// {
// "id": 22,
// "quote": "The greatest leader is not necessarily the one who does the greatest things. They are the one who gets the people to do the greatest things.",
// "author": "Ronald Reagan",
// "image" : ""
// },
// {
// "id": 23,
// "quote": "A true leader has the confidence to stand alone, the courage to make tough decisions, and the compassion to listen to the needs of others.",
// "author": "Douglas MacArthur",
// "image" : ""
// },
// {
// "id": 24,
// "quote": "The best leaders are those most interested in surrounding themselves with assistants and associates smarter than they are.",
// "author": "John C. Maxwell",
// "image" : ""
// },
// {
// "id": 25,
// "quote": "A good leader takes a little more than their share of the blame, a little less than their share of the credit.",
// "author": "Arnold H. Glasow",
// "image" : ""
// }
// ]
// },
