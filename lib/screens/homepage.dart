import 'package:db_miner/controllers/controller_getController.dart';
import 'package:db_miner/controllers/dp_helper.dart';
import 'package:db_miner/models/globals.dart';
import 'package:db_miner/models/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TabBarIndex_GetController tabBarIndex_getController =
      Get.put(TabBarIndex_GetController());
  Image_GetController image_model = Get.put(Image_GetController());

  Future<List<DataBase_Model>>? getQutoes;

  @override
  void initState() {
    super.initState();
    getQutoes = DBHelper.dbHelper.fetchAllRecords();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.search),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.settings),
          ),
        ],
      ),
      tabBuilder: (context, i) {
        return CupertinoTabView(
          builder: (context) {
            return CupertinoPageScaffold(
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
                                largeTitle: Text("Explore"),
                                leading: CupertinoButton(
                                  onPressed: null,
                                  child: Icon(
                                    CupertinoIcons.search,
                                  ),
                                ),
                                trailing: CupertinoButton(
                                    child: Icon(CupertinoIcons.profile_circled),
                                    onPressed: null),
                              ),
                              SliverToBoxAdapter(
                                child: Container(
                                  height: 50,
                                  padding: EdgeInsets.all(16),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      CupertinoButton(
                                        onPressed: null,
                                        child: Icon(
                                          CupertinoIcons.home,
                                        ),
                                      ),
                                      CupertinoButton(
                                        onPressed: null,
                                        child: Icon(
                                          CupertinoIcons.person,
                                        ),
                                      ),
                                      CupertinoButton(
                                        onPressed: null,
                                        child: Icon(
                                          CupertinoIcons
                                              .gamecontroller_alt_fill,
                                        ),
                                      ),
                                      CupertinoButton(
                                        onPressed: null,
                                        child: Icon(
                                          CupertinoIcons.settings,
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
                                      // List<int> byteInt = [];
                                      // byteInt.add(data[i].image);
                                      return GestureDetector(
                                        onTap: (){
                                          Get.toNamed("/details_page",arguments: data[i]);
                                        },
                                         child: Column(
                                          children: [
                                            Container(
                                              height: 157,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                // image: DecorationImage(image: AssetImage(image_model.images[i]),fit: BoxFit.cover),
                                                // image: DecorationImage(image: (byteInt.isNotEmpty)?MemoryImage(Uint8List.fromList(byteInt)):MemoryImage(Uint8List(0))),
                                                image: DecorationImage(
                                                  image: MemoryImage(
                                                    AllImage.allImages[i]
                                                  ),
                                                  fit: BoxFit.cover,
                                                  opacity: 0.8,
                                                ),
                                              ),
                                            ),
                                            Text("${data[i].name}"),
                                          ],
                                        ),
                                      );
                                    },
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
          },
        );
      },
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
