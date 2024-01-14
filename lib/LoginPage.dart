import 'package:flutter/material.dart';
import 'package:fluttergame/HomePage.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();

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
              SizedBox(height: 20),
              TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  labelText: 'Kullanıcı Adı',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  String username = usernameController.text;
                  if (username.isNotEmpty) {
                    Get.to(HomePage(Name: username,));
                  } else {
                    Get.snackbar(
                      'Uyarı',
                      'Lütfen kullanıcı adınızı girin.',
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  }
                },
                child: Text('Oyuna Başla'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
