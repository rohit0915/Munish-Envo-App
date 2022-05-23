import 'package:get/get.dart';

import '../controllers/my_vehicle_controller.dart';

class MyVehicleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyVehicleController>(
      () => MyVehicleController(),
    );
  }
}
