import 'package:db_miner/controllers/controller_getController.dart';
import 'package:db_miner/screens/set_image_page.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
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

  String? selectedValue;

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
                Get.toNamed('/favourite_page');
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
                                onPressed: () {
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
                                child: Icon(
                                  CupertinoIcons.forward,
                                  color: CupertinoColors.systemGrey,
                                ),
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
                            "Font Size",
                            style: TextStyle(
                              color: (settingController
                                      .settingController.isDarkMode)
                                  ? CupertinoColors.white
                                  : CupertinoColors.black,
                            ),
                          ),
                          trailing: CupertinoButton(
                            child: Icon(
                              CupertinoIcons.forward,
                              color: CupertinoColors.systemGrey,
                            ),
                            onPressed: () {
                              Get.toNamed("/font_size_page");
                              // showCupertinoDialog(
                              //   context: context,
                              //   builder: (context) {
                              //     return CupertinoAlertDialog(
                              //       title: Text("Text Edit Menu"),
                              //       content: Container(
                              //         child: Column(
                              //           mainAxisAlignment:
                              //               MainAxisAlignment.start,
                              //           children: [
                              //             Row(
                              //               children: [
                              //                 Text("Font"),
                              //                 CupertinoButton(
                              //                     child: Icon(
                              //                       CupertinoIcons.chevron_down,
                              //                     ),
                              //                     onPressed: () {
                              //                       showCupertinoModalPopup(context: context,builder: (context){
                              //                         return CupertinoPicker(
                              //                           magnification: 1.22,
                              //                           squeeze: 1.2,
                              //                           useMagnifier: true,
                              //                           itemExtent: 32,
                              //                           // This sets the initial item.
                              //                           scrollController: FixedExtentScrollController(
                              //                             initialItem: 0,
                              //                           ),
                              //                           // This is called when selected item is changed.
                              //                           onSelectedItemChanged:
                              //                               (val) {},
                              //                           children: [
                              //                             Text("Italic"),
                              //                             Text("Normal"),
                              //                           ],
                              //                         );
                              //                       });
                              //                     })
                              //               ],
                              //             ),
                              //           ],
                              //         ),
                              //       ),
                              //       actions: [
                              //         cupertinoDialogAction(
                              //           context: "Cansel",
                              //           isDestructiveAction: true,
                              //           onPressed: () {
                              //             Get.back();
                              //           },
                              //         ),
                              //         cupertinoDialogAction(
                              //           context: "Save",
                              //           onPressed: () {},
                              //         ),
                              //       ],
                              //     );
                              //   },
                              // );
                            },
                          ),
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

  Widget cupertinoDialogAction({
    isDestructiveAction = false,
    required String context,
    required onPressed,
  }) {
    return CupertinoDialogAction(
      child: Text(context),
      isDestructiveAction: isDestructiveAction,
      onPressed: onPressed,
    );
  }
}
