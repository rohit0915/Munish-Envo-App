import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:envo_safe/app/data/api_provider/api_client.dart';
import 'package:envo_safe/app/modules/notification/model/notification_model.dart';

class NotificationRepo {
  Future<NotificationModel> getNotification() async {
    try {
      Response r = await ApiClient().dio.get("/notifications");
      return notificationModelFromJson(
          jsonEncode(r.data["data"]["notifications"]));
    } on Exception catch (e) {
      return Future.error(e.toString());
    }
  }
}
