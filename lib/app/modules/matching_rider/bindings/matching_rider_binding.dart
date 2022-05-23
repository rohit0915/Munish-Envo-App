import 'package:get/get.dart';

import '../controllers/matching_rider_controller.dart';

class MatchingRiderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MatchingRiderController>(
      () => MatchingRiderController(),
    );
  }
}
