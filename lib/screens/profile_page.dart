import 'package:db_miner/controllers/controller_getController.dart';
import 'package:db_miner/screens/set_image_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sizer/sizer.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  SettingController_Getx settingController = Get.put(SettingController_Getx());

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            backgroundColor: (settingController.settingController.isDarkMode)
                ? CupertinoColors.black
                : CupertinoColors.white,
            leading: Icon(CupertinoIcons.person_2),
            largeTitle: Text(
              'Developer',
              style: TextStyle(
                color: (settingController.settingController.isDarkMode)
                    ? CupertinoColors.white
                    : CupertinoColors.black,
              ),
            ),
            trailing: CupertinoButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                        context, '/', (route) => false)
                    .then((value) => setState(() {}));
                // Navigator.pop(
                //   context,
                //   PageTransition(
                //       type: PageTransitionType.leftToRight,
                //       child: ProfilePage(),
                //       inheritTheme: true,
                //       curve: Curves.easeInOut,
                //       duration: Duration(milliseconds: 10000),
                //       ctx: context),
                // );
              },
              child: Icon(
                CupertinoIcons.heart_circle_fill,
              ),
            ),
          ),
          SliverFillRemaining(
            child: Container(
              color: (settingController.settingController.isDarkMode)
                  ? CupertinoColors.black
                  : CupertinoColors.white,
              padding: EdgeInsets.all(2.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        "APPEARANCE",
                        style: (settingController.settingController.isDarkMode)
                            ? TextStyle(color: CupertinoColors.white)
                            : TextStyle(color: CupertinoColors.black),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Card(
                    color: (settingController.settingController.isDarkMode)
                        ? CupertinoColors.darkBackgroundGray
                        : CupertinoColors.white,
                    child: CupertinoListTile(
                      title: Text(
                        "Dark Apperarance",
                        style: TextStyle(
                          color:
                              (settingController.settingController.isDarkMode)
                                  ? CupertinoColors.white
                                  : CupertinoColors.black,
                        ),
                      ),
                      trailing: CupertinoSwitch(
                        activeColor: CupertinoColors.systemBlue,
                        value: settingController.settingController.isDarkMode,
                        onChanged: (val) {
                          setState(() {
                            settingController.darkThemeUDF(val: val);
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Card(
                    child: CupertinoListSection(
                      backgroundColor:
                          (settingController.settingController.isDarkMode)
                              ? CupertinoColors.black
                              : CupertinoColors.white,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: (settingController.settingController.isDarkMode)
                            ? Colors.grey.shade900
                            : Colors.white.withOpacity(0.5),
                      ),
                      header: const Text("DISPLAY VIEW"),
                      footer: Text(
                        "Choose a view for iphone. Zoomed shadows larger controls. Standart shows more content.",
                        style: (settingController.settingController.isDarkMode)
                            ? TextStyle(
                                color: CupertinoColors.systemGrey2,
                                fontSize: 1.5.h)
                            : TextStyle(
                                color: CupertinoColors.systemGrey2,
                                fontSize: 1.5.h,
                              ),
                      ),
                      children: [
                        CupertinoListTile(
                          title: Text(
                            "View",
                            style: TextStyle(
                              color: (settingController
                                      .settingController.isDarkMode)
                                  ? CupertinoColors.white
                                  : CupertinoColors.black,
                            ),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Image",
                                style: TextStyle(
                                  color: (settingController
                                          .settingController.isDarkMode)
                                      ? CupertinoColors.white
                                      : CupertinoColors.black,
                                ),
                              ),
                               CupertinoButton(
                                onPressed: (){
                                  Navigator.push(
                                    context,
                                    PageTransition(
                                        type: PageTransitionType.leftToRightPop,
                                        child: ImagePage(),
                                        inheritTheme: true,
                                        curve: Curves.easeInOut,
                                        childCurrent: Container(),
                                        duration: Duration(milliseconds: 2000),
                                        ctx: context),
                                  );
                                },
                                child: Icon(CupertinoIcons.forward,
                                    color: CupertinoColors.systemGrey),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        CupertinoListTile(
                          title: Text(
                            "Grid View",
                            style: TextStyle(
                              color: (settingController
                                      .settingController.isDarkMode)
                                  ? CupertinoColors.white
                                  : CupertinoColors.black,
                            ),
                          ),
                          // trailing: CupertinoSwitch(
                          //   value: Provider.of<GridViewMode_Provider>(context)
                          //       .gridViewMode_Model
                          //       .isGrid,
                          //   onChanged: (val) {
                          //     // style: (Provider.of<DarkMode_Provider>(context)
                          //     Provider.of<GridViewMode_Provider>(context,
                          //         listen: false)
                          //         .AlternateValue();
                          //   },
                          // ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Card(
                    child: CupertinoListSection(
                      backgroundColor:
                          (settingController.settingController.isDarkMode)
                              ? CupertinoColors.black
                              : CupertinoColors.white,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: settingController.settingController.isDarkMode
                            ? Colors.grey.shade900
                            : Colors.white.withOpacity(0.5),
                      ),
                      header: const Text("UI AUTOMATION"),
                      children: [
                        CupertinoListTile(
                          title: Text(
                            "Enabled Explict Animation",
                            style: TextStyle(
                              color: (settingController
                                      .settingController.isDarkMode)
                                  ? CupertinoColors.white
                                  : CupertinoColors.black,
                            ),
                          ),
                          // trailing: CupertinoSwitch(
                          //   value: Provider.of<ExplictMode_Provider>(context)
                          //       .explict
                          //       .isExplict,
                          //   onChanged: (val) {
                          //     Provider.of<ExplictMode_Provider>(context,
                          //         listen: false)
                          //         .AlternateValue();
                          //   },
                          // ),
                        ),
                        CupertinoListTile(
                          title: Text(
                            "Multipath NetWorking",
                            style: TextStyle(
                              color: (settingController
                                      .settingController.isDarkMode)
                                  ? CupertinoColors.white
                                  : CupertinoColors.black,
                            ),
                          ),
                          trailing: IconButton(
                            onPressed: null,
                            icon: Icon(
                              CupertinoIcons.forward,
                              color: CupertinoColors.systemGrey2,
                            ),
                          ),
                        ),
                        CupertinoListTile(
                          title: Text(
                            "HTTP/3",
                            style: TextStyle(
                              color: (settingController
                                      .settingController.isDarkMode)
                                  ? CupertinoColors.white
                                  : CupertinoColors.black,
                            ),
                          ),
                          trailing: CupertinoSwitch(
                            value: false,
                            onChanged: null,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
