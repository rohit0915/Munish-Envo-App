import 'dart:async';
import 'dart:math';

import 'package:envo_safe/app/routes/app_pages.dart';
import 'package:get/get.dart';

class RidersPledgeController extends GetxController {
  late Timer timer;
  @override
  void onInit() {
    timer = Timer(Duration(seconds: 3), () {
      Get.offNamed(Routes.BOTTOM_NAVBAR);
    });
    super.onInit();
  }

  @override
  void onClose() {
    timer.cancel();
    super.onClose();
  }
}
