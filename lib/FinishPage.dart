import 'package:flutter/material.dart';
import 'package:fluttergame/BoardPage.dart';
import 'package:fluttergame/Controller.dart';
import 'package:fluttergame/HomePage.dart';
import 'package:fluttergame/LoginPage.dart';
import 'package:get/get.dart';

class FinishPage extends StatelessWidget {
    GameController controller = Get.find();
    String Name="";
    int time = 0;

        FinishPage({super.key, required this.Name , required this.time});
    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Center(
        child: Container(
          width: 300,
          height: 300,
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.blue,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Tebrikler!"),
              const SizedBox(height: 16,),
              Text("Oyunu $time Saniyede Bitirdiniz"),
              const SizedBox(height: 16,),
              ElevatedButton(
                onPressed: () {
                  controller.showList.fillRange(0, controller.showList.length,false);
                    Get.to(LoginPage());
                    
                  },
                child: const Text('Tekrar Oyna'),
      
              ),
              SizedBox(height: 16,),
              ElevatedButton(
                onPressed: () {
                    Get.to(BoardPage());
                  },
                child: const Text('Lider Tablosu '), 
              ),
            ],
          ),
        ),
      ),
    );
  }
  
}
