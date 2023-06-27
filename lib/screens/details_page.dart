import 'package:db_miner/models/globals.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    DataBase_Model data = Get.arguments as DataBase_Model;
    // DataBase_Model data =
    //     ModalRoute.of(context)!.settings.arguments as DataBase_Model;
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            largeTitle: Text("${data.id}"),
          ),
          SliverFillRemaining(),
        ],
      ),
    );
  }
}
