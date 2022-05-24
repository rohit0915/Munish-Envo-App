import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widget/app color/app_colors.dart';
import '../controllers/bottom_navbar_controller.dart';

class BottomNavbarView extends GetView<BottomNavbarController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: IndexedStack(
            children: controller.screens,
            index: controller.index.value,
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: appBarColor,
            unselectedItemColor: Colors.black87,
            backgroundColor: Colors.white,
            onTap: (int num) {
              controller.index.value = num;
            },
            showSelectedLabels: true,
            currentIndex: controller.index.value,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.directions_car_outlined,
                    size: 30,
                  ),
                  label: 'Carpool',
                  backgroundColor: Colors.black12),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.timelapse_sharp,
                    size: 30,
                  ),
                  label: 'Requests',
                  backgroundColor: Colors.black12),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.chat,
                    size: 30,
                  ),
                  label: 'Chat',
                  backgroundColor: Colors.black12),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.account_circle,
                    size: 30,
                  ),
                  label: 'Account',
                  backgroundColor: Colors.black12),
            ],
          ),
        ));
  }
}
