import 'package:get/get.dart';

import '../controllers/manage_profile_controller.dart';

class ManageProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ManageProfileController>(
      () => ManageProfileController(),
    );
  }
}
