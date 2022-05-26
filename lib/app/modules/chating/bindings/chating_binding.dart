import 'package:get/get.dart';

import '../controllers/chating_controller.dart';

class ChatingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatingController>(
      () => ChatingController(),
    );
  }
}
