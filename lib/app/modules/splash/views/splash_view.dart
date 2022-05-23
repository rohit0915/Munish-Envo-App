import 'package:envo_safe/app/modules/splash/widgets/second_splas_screen.dart';
import 'package:envo_safe/app/modules/splash/widgets/splash_screen.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
            controller: controller.pageController,
            onPageChanged: (int val) {
              controller.index == val;
            },
            physics: NeverScrollableScrollPhysics(),            
            children: [
          SplashScreen(),
          SecondSplashScreen(),
        ]));
  }
}
