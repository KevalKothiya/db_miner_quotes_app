import 'package:db_miner/models/globals.dart';
import 'package:get/get.dart';

class TabBarIndex_GetController extends GetxController {
  TabBarIndex_Model tabBarIndex_Model =TabBarIndex_Model(id: 0);

  Initialization({required int id}){
    tabBarIndex_Model.id = id;
    update();
  }
}

class Image_GetController extends GetxController{
  List images = [
    "assets/images/friendship/1.jpg",
    "assets/images/motivational/1.jpg",
    "assets/images/inspirational/1.jpeg",
    "assets/images/knowledge/1.jpg",
    "assets/images/self/1.jpeg",
    "assets/images/success/1.jpg",
    "assets/images/motivational/5.jpg",
  ];
}

class OneTime_GetxController extends GetxController {
  int count = 0;

  increment(){
    count = 1;
    update();
  }

}
