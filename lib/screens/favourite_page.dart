import 'package:db_miner/controllers/dp_helper.dart';
import 'package:db_miner/models/globals.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({Key? key}) : super(key: key);

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  Future? getAllData;

  @override
  void initState() {
    super.initState();
    getAllData = DBHelper.dbHelper.fetchAllDataFavourite(data: "true");
  }

  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            largeTitle: Text("Favourite"),
          ),
          SliverFillRemaining(
            child: Container(
              child: FutureBuilder(
                future: getAllData,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text("Error : ${snapshot.error}"),
                    );
                  } else if (snapshot.hasData) {
                    List<DataBaseFavourite>? ss = snapshot.data;

                    return (ss!.isNotEmpty)
                        ? Center(
                            child: Text("No Data Available..."),
                          )
                        : GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 1, childAspectRatio: 4 / 3),
                            itemCount: ss.length,
                            itemBuilder: (context, i) {
                              return Container(
                                color: Colors.primaries[i % 18],
                                child: Column(
                                  children: [
                                    Text("${ss[i].quote}"),
                                  ],
                                ),
                              );
                            });
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
}
