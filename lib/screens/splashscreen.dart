import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  Widget build(BuildContext context) {
  Future.delayed(Duration(seconds: 3)).then((value) => Get.offAndToNamed('/'));
    return CupertinoPageScaffold(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/splash.jpg"),
               fit: BoxFit.cover),
        ),
      ),
    );
  }
}
