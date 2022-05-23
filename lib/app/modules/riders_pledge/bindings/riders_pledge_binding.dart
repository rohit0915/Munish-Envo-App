import 'package:get/get.dart';

import '../controllers/riders_pledge_controller.dart';

class RidersPledgeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<RidersPledgeController>(
      RidersPledgeController(),
    );
  }
}
