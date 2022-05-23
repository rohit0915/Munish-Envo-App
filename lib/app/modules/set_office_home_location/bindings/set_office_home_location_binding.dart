import 'package:get/get.dart';

import '../controllers/set_office_home_location_controller.dart';

class SetOfficeHomeLocationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SetOfficeHomeLocationController>(
      () => SetOfficeHomeLocationController(),
    );
  }
}
