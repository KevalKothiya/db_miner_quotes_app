import 'package:db_miner/controllers/controller_getController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum Sky { centerStart, center, centerEnd}

enum Format { none, Aa, aA, aa }

class FontSizePage extends StatefulWidget {
  const FontSizePage({Key? key}) : super(key: key);

  @override
  State<FontSizePage> createState() => _FontSizePageState();
}

class _FontSizePageState extends State<FontSizePage> {
  late double letterSpacing;
  late double wordSpacing;

  SettingController_Getx settingController = Get.put(SettingController_Getx());

  final TextEditMenu_Getx _editMenu_Getx = Get.put(TextEditMenu_Getx());

  int _selectedFruit = 0;
  final double _kItemExtent = 32.0;
  final List<String> _fruitNames = <String>[
    'Normal',
    'Italic',
  ];
  List<FontWeight> weight = [
    FontWeight.w100,
    FontWeight.w200,
    FontWeight.w300,
    FontWeight.w400,
    FontWeight.w500,
    FontWeight.w600,
    FontWeight.w700,
    FontWeight.w800,
    FontWeight.w900,
  ];

  Sky _selectedSegment = Sky.centerStart;
  Format _selectedSegmentFormat = Format.aa;

  Map<Sky, Color> skyColors = {
    Sky.centerStart: const Color(0xff007ba7),
    Sky.center: const Color(0xff40826d),
    Sky.centerEnd: const Color(0xff007ba7),
  };
  Map<Format, Color> formatColor = {
    Format.none: const Color(0xff007ba7),
    Format.Aa: const Color(0xff40826d),
    Format.aA: const Color(0xff007ba7),
    Format.aa: const Color(0xff40826d),
  };

  @override
  void initState() {
    super.initState();

    letterSpacing = (_editMenu_Getx.textEditMenu_Model.letterSpacing) ?? 0;
    wordSpacing = (_editMenu_Getx.textEditMenu_Model.wordSpacing) ?? 0;
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
              "data",
              style: TextStyle(
                color: (settingController.settingController.isDarkMode)
                    ? CupertinoColors.white
                    : CupertinoColors.black,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(22),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Font",
                        style: TextStyle(
                          color:
                              (settingController.settingController.isDarkMode)
                                  ? CupertinoColors.white
                                  : CupertinoColors.black,
                        ),
                      ),
                      const Spacer(),
                      Container(
                        height: 50,
                        width: 250,
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color:
                                (settingController.settingController.isDarkMode)
                                    ? CupertinoColors.white
                                    : CupertinoColors.black,
                          ),
                        ),
                        alignment: AlignmentDirectional.center,
                        child: Row(
                          children: [
                            Text(
                              _editMenu_Getx.textEditMenu_Model.fontStyle.toString(),
                              style: TextStyle(
                                color: (settingController
                                        .settingController.isDarkMode)
                                    ? CupertinoColors.white
                                    : CupertinoColors.black,
                              ),
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {
                                showCupertinoModalPopup<void>(
                                  context: context,
                                  builder: (BuildContext context) => Container(
                                    height: 216,
                                    padding: const EdgeInsets.only(top: 6.0),
                                    margin: EdgeInsets.only(
                                      bottom: MediaQuery.of(context)
                                          .viewInsets
                                          .bottom,
                                    ),
                                    color: CupertinoColors.systemBackground
                                        .resolveFrom(context),
                                    child: SafeArea(
                                      top: false,
                                      child: CupertinoPicker(
                                        magnification: 1.22,
                                        squeeze: 1.2,
                                        useMagnifier: true,
                                        itemExtent: 32,
                                        scrollController:
                                            FixedExtentScrollController(
                                          initialItem: _selectedFruit,
                                        ),
                                        onSelectedItemChanged: (val) {
                                          setState(() {
                                            _selectedFruit = val;

                                            (val == 1)
                                                ? _editMenu_Getx
                                                    .initializationInFontStyle(
                                                        fontStyle:
                                                            FontStyle.italic)
                                                : _editMenu_Getx
                                                    .initializationInFontStyle(
                                                        fontStyle:
                                                            FontStyle.normal);
                                          });
                                        },
                                        children: List.generate(
                                            _fruitNames.length, (i) {
                                          return Center(
                                            child: Text(
                                              _fruitNames[i],
                                            ),
                                          );
                                        }),
                                      ),
                                    ),
                                  ),
                                );
                                // showCupertinoDialog(
                                //     context: context,
                                //     builder: (context) {
                                //       return Container(
                                //         height: 216,
                                //         padding: const EdgeInsets.only(top: 6.0),
                                //         // The Bottom margin is provided to align the popup above the system navigation bar.
                                //         margin: EdgeInsets.only(
                                //           bottom: MediaQuery.of(context)
                                //               .viewInsets
                                //               .bottom,
                                //         ),
                                //         // Provide a background color for the popup.
                                //         color: CupertinoColors.systemBackground
                                //             .resolveFrom(context),
                                //         // Use a SafeArea widget to avoid system overlaps.
                                //         child: SafeArea(
                                //           top: false,
                                //           child: CupertinoPicker(
                                //             magnification: 1.22,
                                //             squeeze: 1.2,
                                //             useMagnifier: true,
                                //             itemExtent: 32,
                                //             // This sets the initial item.
                                //             scrollController:
                                //                 FixedExtentScrollController(
                                //               initialItem: 0,
                                //             ),
                                //             // This is called when selected item is changed.
                                //             onSelectedItemChanged:
                                //                 (int selectedItem) {
                                //               setState(() {});
                                //             },
                                //             children: [],
                                //           ),
                                //         ),
                                //       );
                                //     });
                              },
                              child: Container(
                                child: const Icon(
                                  CupertinoIcons.chevron_down,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        "Style",
                        style: TextStyle(
                          color:
                              (settingController.settingController.isDarkMode)
                                  ? CupertinoColors.white
                                  : CupertinoColors.black,
                        ),
                      ),
                      const Spacer(),
                      Container(
                        height: 50,
                        width: 250,
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color:
                                (settingController.settingController.isDarkMode)
                                    ? CupertinoColors.white
                                    : CupertinoColors.black,
                          ),
                        ),
                        alignment: AlignmentDirectional.center,
                        child: Row(
                          children: [
                            Text(
                              _editMenu_Getx.textEditMenu_Model.fontWeight.toString(),
                              style: TextStyle(
                                color: (settingController
                                        .settingController.isDarkMode)
                                    ? CupertinoColors.white
                                    : CupertinoColors.black,
                              ),
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {
                                showCupertinoModalPopup<void>(
                                  context: context,
                                  builder: (BuildContext context) => Container(
                                    height: 216,
                                    padding: const EdgeInsets.only(top: 6.0),
                                    margin: EdgeInsets.only(
                                      bottom: MediaQuery.of(context)
                                          .viewInsets
                                          .bottom,
                                    ),
                                    color: CupertinoColors.systemBackground
                                        .resolveFrom(context),
                                    child: SafeArea(
                                      top: false,
                                      child: CupertinoPicker(
                                        magnification: 1.22,
                                        squeeze: 1.2,
                                        useMagnifier: true,
                                        itemExtent: 32,
                                        // This sets the initial item.
                                        scrollController:
                                            FixedExtentScrollController(
                                          initialItem: _selectedFruit,
                                        ),
                                        onSelectedItemChanged: (val) {
                                          setState(() {
                                            _selectedFruit = val;

                                            _editMenu_Getx
                                                .initializationInFontWeight(
                                                    fontWeight: weight[val]);
                                          });
                                        },
                                        children: List.generate(
                                          weight.length,
                                          (i) {
                                            return Center(
                                              child: Text(
                                                weight[i]
                                                    .toString()
                                                    .split(".")[1],
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                              child: const Icon(
                                CupertinoIcons.chevron_down,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        "Size",
                        style: TextStyle(
                          color:
                              (settingController.settingController.isDarkMode)
                                  ? CupertinoColors.white
                                  : CupertinoColors.black,
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                        height: 51,
                        width: 250,
                        child: Row(
                          children: [
                            Container(
                              height: 50,
                              width: 100,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: (settingController
                                          .settingController.isDarkMode)
                                      ? CupertinoColors.white
                                      : CupertinoColors.black,
                                ),
                              ),
                              alignment: Alignment.center,
                              child: Row(
                                children: [
                                  Text(
                                    _editMenu_Getx.textEditMenu_Model.fontSize!.toInt().toString(),
                                    style: TextStyle(
                                      color: (settingController
                                              .settingController.isDarkMode)
                                          ? CupertinoColors.white
                                          : CupertinoColors.black,
                                    ),
                                  ),
                                  const Spacer(),
                                  Column(
                                    children: [
                                      GestureDetector(
                                        onTap: () {},
                                        child: const SizedBox(
                                          height: 10,
                                          child: Icon(
                                            Icons.arrow_drop_up,
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {},
                                        child: const SizedBox(
                                          height: 10,
                                          child: Icon(
                                            Icons.arrow_drop_down,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 148,
                              child: CupertinoSlider(
                                value: double.parse(_editMenu_Getx
                                    .textEditMenu_Model.fontSize
                                    .toString()),
                                min: 1,
                                max: 50,
                                divisions: 50,
                                activeColor: CupertinoColors.activeGreen,
                                onChanged: (val) {
                                  setState(() {
                                    _editMenu_Getx.initializationInFontSize(
                                        fontSize: val);
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Spacer(),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        "Align",
                        style: TextStyle(
                          color:
                              (settingController.settingController.isDarkMode)
                                  ? CupertinoColors.white
                                  : CupertinoColors.black,
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                        width: 250,
                        child: CupertinoSlidingSegmentedControl(
                          children: {
                            Sky.centerStart: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5),
                              child: Container(
                                alignment: Alignment.center,
                                child: const Text(
                                  'Center Start',
                                  style:
                                      TextStyle(color: CupertinoColors.white),
                                ),
                              ),
                            ),
                            Sky.center: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child: Text(
                                'Center',
                                style: TextStyle(color: CupertinoColors.white),
                              ),
                            ),
                            Sky.centerEnd: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child: Text(
                                'Center End',
                                style: TextStyle(color: CupertinoColors.white),
                              ),
                            ),
                          },
                          backgroundColor: CupertinoColors.systemGrey2,
                          thumbColor: skyColors[_selectedSegment]!,
                          groupValue: _selectedSegment,
                          onValueChanged: (Sky? value) {
                            if (value != null) {
                              setState(() {
                                _selectedSegment = value;
                              });
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Text(
                        "More",
                        style: TextStyle(
                          color:
                              (settingController.settingController.isDarkMode)
                                  ? CupertinoColors.white
                                  : CupertinoColors.black,
                        ),
                      ),
                      const Spacer(),
                      const Icon(Icons.arrow_drop_up)
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Letter",
                            style: TextStyle(
                              color: (settingController
                                      .settingController.isDarkMode)
                                  ? CupertinoColors.white
                                  : CupertinoColors.black,
                            ),
                          ),
                          const Spacer(),
                          SizedBox(
                            width: 250,
                            height: 50,
                            child: Row(
                              children: [
                                Container(
                                  width: 115,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    "${_editMenu_Getx.textEditMenu_Model.letterSpacing}",
                                    style: TextStyle(
                                      color: (settingController
                                              .settingController.isDarkMode)
                                          ? CupertinoColors.white
                                          : CupertinoColors.black,
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                Container(
                                  width: 115,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  padding: const EdgeInsets.all(4),
                                  alignment: Alignment.center,
                                  child: Row(
                                    children: [
                                      const Spacer(),
                                      GestureDetector(
                                        onTap: () {
                                          setState(
                                            () {
                                              if (letterSpacing > 0) {
                                                letterSpacing -= 0.5;
                                              }
                                            },
                                          );

                                          _editMenu_Getx
                                              .initializationInLetterSpacing(
                                                  letterSpacing: letterSpacing);
                                        },
                                        child: const Icon(
                                          Icons.remove,
                                        ),
                                      ),
                                      const Spacer(),
                                      Text(
                                        "|",
                                        style: TextStyle(
                                          color: (settingController
                                                  .settingController.isDarkMode)
                                              ? CupertinoColors.white
                                              : CupertinoColors.black,
                                        ),
                                      ),
                                      const Spacer(),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            letterSpacing += 0.5;
                                          });

                                          _editMenu_Getx
                                              .initializationInLetterSpacing(
                                                  letterSpacing: letterSpacing);
                                        },
                                        child: const Icon(
                                          Icons.add,
                                        ),
                                      ),
                                      const Spacer(),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text(
                            "Word",
                            style: TextStyle(
                              color: (settingController
                                      .settingController.isDarkMode)
                                  ? CupertinoColors.white
                                  : CupertinoColors.black,
                            ),
                          ),
                          const Spacer(),
                          SizedBox(
                            width: 250,
                            height: 50,
                            child: Row(
                              children: [
                                Container(
                                  width: 115,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    "${_editMenu_Getx.textEditMenu_Model.wordSpacing}",
                                    style: TextStyle(
                                      color: (settingController
                                              .settingController.isDarkMode)
                                          ? CupertinoColors.white
                                          : CupertinoColors.black,
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                Container(
                                  width: 115,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  padding: const EdgeInsets.all(4),
                                  alignment: Alignment.center,
                                  child: Row(
                                    children: [
                                      const Spacer(),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            if (wordSpacing > 0) {
                                              wordSpacing -= 0.5;
                                            }
                                          });

                                          _editMenu_Getx
                                              .initializationInWordSpacing(
                                                  wordSpacing: wordSpacing);
                                        },
                                        child: const Icon(
                                          Icons.remove,
                                        ),
                                      ),
                                      const Spacer(),
                                      Text(
                                        "|",
                                        style: TextStyle(
                                          color: (settingController
                                                  .settingController.isDarkMode)
                                              ? CupertinoColors.white
                                              : CupertinoColors.black,
                                        ),
                                      ),
                                      const Spacer(),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            wordSpacing += 0.5;
                                          });

                                          _editMenu_Getx
                                              .initializationInWordSpacing(
                                                  wordSpacing: wordSpacing);
                                        },
                                        child: const Icon(
                                          Icons.add,
                                        ),
                                      ),
                                      const Spacer(),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        children: [
                          Text(
                            "Format",
                            style: TextStyle(
                              color: (settingController
                                      .settingController.isDarkMode)
                                  ? CupertinoColors.white
                                  : CupertinoColors.black,
                            ),
                          ),
                          const Spacer(),
                          SizedBox(
                            width: 250,
                            child: CupertinoSlidingSegmentedControl(
                              children: const {
                                Format.none: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  child: Text(
                                    'None',
                                    style:
                                        TextStyle(color: CupertinoColors.white),
                                  ),
                                ),
                                Format.Aa: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  child: Text(
                                    'Aa',
                                    style:
                                        TextStyle(color: CupertinoColors.white),
                                  ),
                                ),
                                Format.aA: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  child: Text(
                                    'aA',
                                    style:
                                        TextStyle(color: CupertinoColors.white),
                                  ),
                                ),
                                Format.aa: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  child: Text(
                                    'aa',
                                    style:
                                        TextStyle(color: CupertinoColors.white),
                                  ),
                                ),
                              },
                              backgroundColor: CupertinoColors.systemGrey2,
                              thumbColor: formatColor[_selectedSegmentFormat]!,
                              groupValue: _selectedSegmentFormat,
                              onValueChanged: (Format? value) {
                                if (value != null) {
                                  setState(() {
                                    _selectedSegmentFormat = value;
                                  });
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        children: [
                          Text(
                            "List",
                            style: TextStyle(
                              color: (settingController
                                      .settingController.isDarkMode)
                                  ? CupertinoColors.white
                                  : CupertinoColors.black,
                            ),
                          ),
                          const Spacer(),
                          Container(
                            height: 50,
                            width: 250,
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: (settingController
                                        .settingController.isDarkMode)
                                    ? CupertinoColors.white
                                    : CupertinoColors.black,
                              ),
                            ),
                            alignment: AlignmentDirectional.center,
                            child: Row(
                              children: [
                                Text(
                                  "None",
                                  style: TextStyle(
                                    color: (settingController
                                            .settingController.isDarkMode)
                                        ? CupertinoColors.white
                                        : CupertinoColors.black,
                                  ),
                                ),
                                const Spacer(),
                                GestureDetector(
                                  onTap: () {
                                    showCupertinoModalPopup<void>(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          Container(
                                        height: 216,
                                        padding:
                                            const EdgeInsets.only(top: 6.0),
                                        margin: EdgeInsets.only(
                                          bottom: MediaQuery.of(context)
                                              .viewInsets
                                              .bottom,
                                        ),
                                        color: CupertinoColors.systemBackground
                                            .resolveFrom(context),
                                        child: SafeArea(
                                          top: false,
                                          child: CupertinoPicker(
                                            magnification: 1.22,
                                            squeeze: 1.2,
                                            useMagnifier: true,
                                            itemExtent: 32,
                                            // This sets the initial item.
                                            scrollController:
                                                FixedExtentScrollController(
                                              initialItem: _selectedFruit,
                                            ),
                                            onSelectedItemChanged: (val) {
                                              setState(() {
                                                _selectedFruit = val;
                                              });
                                            },
                                            children: const [],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  child: const Icon(
                                    CupertinoIcons.chevron_down,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
