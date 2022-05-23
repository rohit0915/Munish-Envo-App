import 'package:get/get.dart';

import '../controllers/refer_earn_controller.dart';

class ReferEarnBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReferEarnController>(
      () => ReferEarnController(),
    );
  }
}
