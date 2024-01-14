import 'package:flutter/material.dart';
import 'package:get/get.dart';


class GameController extends GetxController {
  RxList showList = [false,false,false,false].obs;
  Widget build (text){
    RxString txt = "".obs;
    Rx<MaterialColor> color = Colors.red.obs;
    return Container(
      child: 

        DragTarget<List>(
          onAccept: (data) {
            if (data[1]==text){
            showList[data[0]]=true;
            txt.value = data[1] ;
            color.value = data[2];}
          },
            builder: (context,_,__) => Container(color: color.value,width: 90*2,height: 40*2,child: Center(child: Text(txt.value,style: const TextStyle(fontSize: 16),),),))
            );
  }
  Widget buildDrag(text,number){
    Container container = 
    Container(
              color: Colors.green,
              width: 90*2,
              height: 40*2,
              child:  Center(child: Text(text,style: const TextStyle(
                fontSize: 16,
              ),)),
            );

  return Obx(() => 
   IgnorePointer(
    ignoring: showList[number],
    child: Opacity(
      opacity: !showList[number] ? 1:0 ,
      child: Draggable<List>(
        data: [number,text,Colors.green],
        childWhenDragging: const SizedBox(width: 120,height: 80,),
        feedback: container,
        child: container ,
      ),
    ),
   ));
}
}