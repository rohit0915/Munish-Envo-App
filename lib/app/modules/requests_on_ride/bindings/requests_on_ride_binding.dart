import 'package:get/get.dart';

import '../controllers/requests_on_ride_controller.dart';

class RequestsOnRideBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RequestsOnRideController>(
      () => RequestsOnRideController(),
    );
  }
}
