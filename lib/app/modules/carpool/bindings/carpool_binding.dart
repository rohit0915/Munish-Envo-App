import 'package:get/get.dart';

import '../controllers/carpool_controller.dart';

class CarpoolBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CarpoolController>(
      () => CarpoolController(),
    );
  }
}
