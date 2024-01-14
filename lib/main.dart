import 'package:flutter/material.dart';
import 'package:fluttergame/Controller.dart';
import 'package:fluttergame/LoginPage.dart';
import 'package:get/get.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  GameController controller = Get.put(GameController());

  MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
