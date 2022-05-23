import 'package:get/get.dart';

import '../controllers/cancel_request_controller.dart';

class CancelRequestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CancelRequestController>(
      () => CancelRequestController(),
    );
  }
}
