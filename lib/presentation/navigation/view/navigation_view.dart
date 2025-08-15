import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_ripaldiansyah/core.dart';

import '../widget/center_contained.dart';

class NavigationView extends StatelessWidget {
  const NavigationView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());

    return Obx(() {
      return Scaffold(
        body: IndexedStack(
          index: controller.currentIndex.value,
          children: [
            Center(child: HomePageView()),
            Center(child: Text("Add Page")),
            Center(child: Text("List Page")),
          ],
        ),
        floatingActionButtonLocation: CenterContainedFabLocation(),
        floatingActionButton: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              "assets/Subtract.png",
              fit: BoxFit.none,
              width: 220,
              height: 100,
            ),
            FloatingActionButton(
              onPressed: () {
                controller.currentIndex.value = 1;
              },
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(99),
                side: BorderSide(color: primaryColor, width: 1.5),
              ),
              child: Icon(Icons.add, color: primaryColor, size: 40),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            border: Border(top: BorderSide(width: 0.6, color: borderColor)),
          ),
          child: BottomAppBar(
            shape: AutomaticNotchedShape(RoundedRectangleBorder()),
            color: primaryColor,

            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Image.asset(
                      'assets/icons/map.png',
                      width: 24,
                      height: 24,
                      color: controller.currentIndex.value == 0
                          ? activeColor
                          : Colors.grey,
                    ),
                    onPressed: () {
                      controller.currentIndex.value = 0;
                    },
                  ),
                  IconButton(
                    icon: Image.asset(
                      'assets/icons/list.png',
                      width: 24,
                      height: 24,
                      color: controller.currentIndex.value == 2
                          ? activeColor
                          : Colors.grey,
                    ),
                    onPressed: () {
                      controller.currentIndex.value = 2;
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
