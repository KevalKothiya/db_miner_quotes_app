import 'package:db_miner/controllers/controller_getController.dart';
import 'package:db_miner/controllers/dp_helper.dart';
import 'package:db_miner/models/globals.dart';
import 'package:db_miner/models/utils.dart';
import 'package:db_miner/screens/profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TabBarIndex_GetController tabBarIndex_getController =
      Get.put(TabBarIndex_GetController());

  SettingController_Getx settingController = Get.put(SettingController_Getx());

  NewFolderList_Getx newFolder_Getx = Get.put(NewFolderList_Getx());

  Image_GetController image_model = Get.put(Image_GetController());

  Future<List<DataBase_Model>>? getQutoes;

  Future<List<NewFolderList_DataBase>?>? getAllTables;

  FetchId fetchId = Get.put(FetchId());

  ScrollController scrollController = ScrollController();

  TextEditingController textEditingController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    getQutoes = DBHelper.dbHelper.fetchAllRecords();

    getAllTables = DBHelper.dbHelper.fetchIntoNewFolderNameSave();
  }

  @override
  Widget build(BuildContext context) {
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
                            CupertinoIcons.person,
                          ),
                        ),
                        trailing: CupertinoButton(
                          child: Form(
                              key: _formKey, child: Icon(CupertinoIcons.add)),
                          onPressed: () {
                            showCupertinoDialog(
                              context: context,
                              builder: (context) {
                                return CupertinoAlertDialog(
                                  title: Text("New Folder"),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text("Enter a name for this folder."),
                                      CupertinoTextFormFieldRow(
                                        controller: textEditingController,
                                        validator: (val) {
                                          if (val!.isEmpty) {
                                            return "Enter Folder Name...";
                                          } else {
                                            return null;
                                          }
                                        },
                                        placeholder: "Title",
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                            color: CupertinoColors.black,
                                          ),
                                        ),
                                      ),
                                    ],
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
                                          if (_formKey.currentState!
                                              .validate()) {
                                            _formKey.currentState!.save();

                                            showCupertinoDialog(
                                              context: context,
                                              builder: (context) {
                                                return CupertinoAlertDialog(
                                                  title: Text("Alert!"),
                                                  content: Text(
                                                      "Are you sure to save?"),
                                                  actions: [
                                                    CupertinoDialogAction(
                                                      child: Text("No"),
                                                      isDestructiveAction: true,
                                                      onPressed: () {
                                                        Get.back();
                                                        Get.back();
                                                      },
                                                    ),
                                                    CupertinoDialogAction(
                                                      child: Text("Yes"),
                                                      onPressed: () async {
                                                        Get.back();
                                                        Get.back();
                                                        await DBHelper.dbHelper
                                                            .addNewFolder(
                                                                name:
                                                                    textEditingController
                                                                        .text);

                                                        newFolder_Getx.init(
                                                            tableName:
                                                                textEditingController
                                                                    .text);

                                                        await DBHelper.dbHelper
                                                            .insertIntoNewFolderNameSave(
                                                                name:
                                                                    textEditingController
                                                                        .text);

                                                        getAllTables =  DBHelper.dbHelper.fetchIntoNewFolderNameSave();
                                                        setState(() {

                                                        });

                                                        Get.snackbar(
                                                          "Success",
                                                          "Successfully Created New Folder..",
                                                          backgroundColor:
                                                              CupertinoColors
                                                                  .systemGreen,
                                                          snackPosition:
                                                              SnackPosition
                                                                  .BOTTOM,
                                                        );
                                                        textEditingController
                                                            .clear();
                                                      },
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          }
                                        }),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Container(
                          height: 50,
                          padding: EdgeInsets.all(16),
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
                          padding: const EdgeInsets.all(16.0),
                          child: GridView.builder(
                            controller: scrollController,
                            scrollDirection: Axis.vertical,
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
                                  fetchId.fetchId(id: i + 101);
                                  Get.toNamed(
                                    "/details_page",
                                  );
                                },
                                child: Column(
                                  children: [
                                    Container(
                                      height: 157,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        image: DecorationImage(
                                          image:
                                              AssetImage(AllImage.allImages[i]),
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
                      SliverToBoxAdapter(
                        child: (newFolder_Getx.newFolder.newFolderList.isEmpty)
                            ? Container(
                                child: Text(
                                  "",
                                  style: TextStyle(
                                    color: (settingController
                                            .settingController.isDarkMode)
                                        ? CupertinoColors.white
                                        : CupertinoColors.black,
                                  ),
                                ),
                              )
                            : Container(
                                padding: EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Divider(
                                      color: (settingController
                                              .settingController.isDarkMode)
                                          ? CupertinoColors.white
                                          : CupertinoColors.black,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Create Folder",
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
                                    SizedBox(
                                      height: 5,
                                    ),
                                    FutureBuilder(
                                      future: getAllTables,
                                      builder: (context, snapshot) {
                                        if (snapshot.hasError) {
                                          return Center(
                                            child: Text(
                                                "Error : ${snapshot.error}"),
                                          );
                                        } else if (snapshot.hasData) {
                                          List<NewFolderList_DataBase>? ss =
                                              snapshot.data;

                                          return (ss!.isEmpty)
                                              ? Container()
                                              : SingleChildScrollView(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  child: Row(
                                                    children: ss.map((e) {
                                                      int i = ss.indexOf(e);
                                                      return Container(
                                                        height: 150,
                                                        width: 150,
                                                        decoration:
                                                            BoxDecoration(
                                                          image:
                                                              DecorationImage(
                                                                  image:
                                                                      AssetImage(
                                                                    allImages[
                                                                        i % 10],
                                                                  ),
                                                                  fit: BoxFit
                                                                      .cover),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                          border: Border.all(
                                                            color:
                                                                CupertinoColors
                                                                    .white,
                                                          ),
                                                        ),
                                                        margin:
                                                            EdgeInsets.all(5),
                                                        alignment: Alignment
                                                            .bottomCenter,
                                                        child: Text(
                                                          "${e.tableName}",
                                                          style: TextStyle(
                                                              color:
                                                                  CupertinoColors
                                                                      .white),
                                                        ),
                                                      );
                                                    }).toList(),
                                                  ),
                                                );
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
  }
}
