import 'package:get/get.dart';

import '../controllers/profile_verification_controller.dart';

class ProfileVerificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileVerificationController>(
      () => ProfileVerificationController(),
    );
  }
}
