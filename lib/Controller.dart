import 'package:cloud_firestore/cloud_firestore.dart';
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
  Future<void> Finished (name,time) async {
    try {
    // Reference to the Firestore collection and document
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection('Users');

    String documentId = DateTime.now().millisecondsSinceEpoch.toString();
    print(documentId);
    // Update the document with a new fiel

    await collectionReference.doc(documentId).set({
      "name": name,
      "time":time,
    });
    print(time);

    print('Field added successfully!');
  } catch (e) {
    print('Error adding field: $e');
  }
  }

}

