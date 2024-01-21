import 'package:flutter/material.dart';
import 'package:fluttergame/Controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class BoardPage extends StatelessWidget {
  GameController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Lider Tablosu",
          style: TextStyle(
            fontSize: 34,
          ),
        ),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("Users").snapshots(),
        builder: (context, snapshot) {
          List<ListTile> usersWidgets = [];
          if (snapshot.hasData) {
            List<DocumentSnapshot> users = snapshot.data!.docs;
            users.sort((a, b) => (a["time"] as int).compareTo(b["time"] as int));
            
            for (var user in users) {
              int num = users.indexOf(user) + 1;
              final userWidget = ListTile(
                leading: Text(num.toString(), style: TextStyle(fontSize: 16)),
                title: Center(child: Text(user["name"])),
                trailing: Text(user["time"].toString(), style: TextStyle(fontSize: 16)),
              );
              usersWidgets.add(userWidget);
            }
          }

          return ListView(
            children: usersWidgets,
          );
        },
      ),
    );
  }
}
