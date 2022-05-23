import 'package:get/get.dart';

import '../controllers/add_vehicle_controller.dart';

class AddVehicleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddVehicleController>(
      () => AddVehicleController(),
    );
  }
}
