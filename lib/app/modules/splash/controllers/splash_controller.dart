import 'dart:async';

import 'package:envo_safe/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashController extends GetxController {
  PageController pageController = PageController();
  int index = 0;
  late Timer timer;
  autoLogin() async {
    GetStorage box = GetStorage();
    var token = await box.read("token");
    if (token != null) {
      Get.toNamed(Routes.BOTTOM_NAVBAR);
    }
  }

  @override
  void onInit() {
    autoLogin();
    timer = Timer.periodic(Duration(seconds: 3), (_) {
      if (pageController.offset < pageController.position.maxScrollExtent) {
        pageController.nextPage(
            duration: Duration(milliseconds: 500), curve: Curves.easeIn);
      } else {
        Get.offNamed(Routes.LOGIN);
      }
    });
    super.onInit();
  }

  @override
  void onClose() {
    timer.cancel();
    super.onClose();
  }
}
