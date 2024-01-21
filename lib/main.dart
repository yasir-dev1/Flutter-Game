import 'package:flutter/material.dart';
import 'package:fluttergame/BoardPage.dart';
import 'package:fluttergame/Controller.dart';
import 'package:fluttergame/LoginPage.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';



Future<void> main() async {
    await Firebase.initializeApp(

    options: DefaultFirebaseOptions.currentPlatform,

  );
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
