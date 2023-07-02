import 'package:db_miner/controllers/dp_helper.dart';
import 'package:db_miner/models/globals.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FolderDetailsPage extends StatefulWidget {
  const FolderDetailsPage({Key? key}) : super(key: key);

  @override
  State<FolderDetailsPage> createState() => _FolderDetailsPageState();
}

class _FolderDetailsPageState extends State<FolderDetailsPage> {
  List<NewFolderData>? getFolderQuotes;
  // String? tableName = "Demo";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<NewFolderData> data = ModalRoute.of(context)!.settings.arguments as List<NewFolderData>;

    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            largeTitle: Text("Folder Details Page data "),
          ),
          SliverFillRemaining(
            child: ListView.builder(itemCount: data.length,itemBuilder: (context, i) {
              return CupertinoListTile(
                title: Text("${data[i].name}"),
              );
            }),
          ),
        ],
      ),
    );
  }
}
