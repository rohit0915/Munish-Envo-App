import 'package:envo_safe/app/data/api_provider/repos/notification_repo.dart';
import 'package:envo_safe/app/modules/notification/model/notification_model.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController
    with StateMixin<NotificationModel> {
  @override
  void onInit() {
    callGetNotificationApi();
    super.onInit();
  }

  callGetNotificationApi() {
    change(null, status: RxStatus.loading());
    NotificationRepo notificationRepo = NotificationRepo();
    notificationRepo.getNotification().then((value) {
      if (value.notifications.isNotEmpty) {
        change(value, status: RxStatus.success());
      } else {
        change(value, status: RxStatus.empty());
      }
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }
}
