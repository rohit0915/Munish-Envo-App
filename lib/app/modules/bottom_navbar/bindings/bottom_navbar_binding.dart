import 'package:envo_safe/app/modules/account/controllers/account_controller.dart';
import 'package:envo_safe/app/modules/chat/controllers/chat_controller.dart';
import 'package:envo_safe/app/modules/history/controllers/history_controller.dart';
import 'package:envo_safe/app/modules/requests/controllers/requests_controller.dart';
import 'package:get/get.dart';

import '../../carpool/controllers/carpool_controller.dart';
import '../controllers/bottom_navbar_controller.dart';

class BottomNavbarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNavbarController>(
      () => BottomNavbarController(),
    );
    Get.lazyPut<CarpoolController>(
      () => CarpoolController(),
    );
     Get.lazyPut<AccountController>(
      () => AccountController(),
    );
    Get.lazyPut<RequestsController>(
      () => RequestsController(),
    );
    Get.lazyPut<ChatController>(
      () => ChatController(),
    );
  }
}
