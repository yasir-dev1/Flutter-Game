import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttergame/Controller.dart';
import 'package:fluttergame/FinishPage.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  GameController controller = Get.find();
  final Name;
  HomePage({super.key, required this.Name});
  RxInt level = 0.obs;
  RxString elapsedTime = "".obs; // Add this line for elapsed time
  Map<String, String> Images = {
    '4.7.jpg': 'Defibrilatör cihazı',
    '4.8.jpg': 'Otomatik ekstranel defibrilatör cihazı',
    '4.9.jpg': 'Manuel defibrilatör cihazı',
    '4.10.jpg': 'Aspiratör cihazı',
    '4.14.jpg': 'Enjektörlü infüzyon pompası',
    '4.15.jpg': 'Lapiroskopi',
    '4.17.jpg': 'Lapiroskopi cihazı',
    '4.18.jpg': 'Oral airway',
    '4.19.jpg': 'Nazal airway',
    '4.20.jpg': 'Nebülizatör',
    '4.24.jpg': 'Balon Maske Sistemi',
    '4.25.jpg': 'Pluse oksimetre',
    '4.26.jpg': 'Koroner anjiofrfi',
    '4.28.jpg': 'Trakeostomi',
    '4.30.jpg': 'Pansuman ve Pansuman seti',
    '4.31.jpg': 'Biyopsi ve Biyopsi seti',
    '4.32.jpg': 'Torasentez',
    '4.52.jpg': 'Trakestomi kanülü',
    '4.55.jpg': 'Stoma ve ostomi torbaları',
    '4.56.jpg': 'Ürostomi ve kolostomi torbaları',
  };

  List<int> selectedNumbers = [];

  int randomnum(int start) {
    while (selectedNumbers.length < 4) {
      int randomNumber = Random().nextInt(4) + start;
      if (!selectedNumbers.contains(randomNumber)) {
        selectedNumbers.add(randomNumber);
        return randomNumber;
      }
    }

    return 0;
  }

  @override
  Widget build(BuildContext context) {
    Stopwatch stopwatch = Stopwatch()..start();

    Timer.periodic(const Duration(seconds: 1), (timer) {
      elapsedTime.value = stopwatch.elapsed.inSeconds.toString(); // Update elapsed time
    });

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(Name),
            Obx(() => Text(
                  '${elapsedTime.value} ', // Use elapsed time
                )),
          ],
        ),
        leading: const Text(""),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 500 * 2,
              height: 300 * 2,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Obx(() => Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(children: [
                            SizedBox(
                              width: 90 * 2,
                              height: 90 * 2,
                              child: Image.network("https://fotograf-eslestirme-oyunu.web.app/assets/assets/${Images.keys.toList()[index + level.value]}"
                                  ),
                            ),
                            Container(width: 40)
                          ]),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(children: [
                            controller.build(
                                Images.values.toList()[index + level.value]),
                            Container(width: 40)
                          ]),
                          const SizedBox(
                            height: 24,
                          ),
                          Row(children: [
                            controller.buildDrag(
                                Images.values.toList()[randomnum(level.value)],
                                index),
                            Container(width: 40)
                          ])
                        ],
                      ));
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (level < 16 &&
                    controller.showList.every((element) => element == true)) {
                  selectedNumbers.clear();
                  level.value = level.value + 4;
                  controller.showList.fillRange(
                      0, controller.showList.length, false);
                } else if (controller.showList.every(
                    (element) => element == true)) {
                      int time = stopwatch.elapsed.inSeconds;
                      stopwatch.stop();
                      Get.to(FinishPage(Name: Name,time: time,));
                      controller.Finished(Name, time);
                      
                }
              },
              child: const Text("Bir Sonraki Seviye"),
            )
          ],
        ),
      ),
    );
  }
}
