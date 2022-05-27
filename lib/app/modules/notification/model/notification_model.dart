// To parse this JSON data, do
//
//     final notificationModel = notificationModelFromJson(jsonString);

import 'dart:convert';

NotificationModel notificationModelFromJson(String str) =>
    NotificationModel.fromJson(json.decode(str));

String notificationModelToJson(NotificationModel data) =>
    json.encode(data.toJson());

class NotificationModel {
  NotificationModel({
    required this.id,
    required this.user,
    required this.v,
    required this.createdAt,
    required this.notifications,
    required this.updatedAt,
  });

  String id;
  String user;
  int v;
  DateTime createdAt;
  List<Notification> notifications;
  DateTime updatedAt;

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
        id: json["_id"],
        user: json["user"],
        v: json["__v"],
        createdAt: DateTime.parse(json["createdAt"]),
        notifications: List<Notification>.from(
            json["notifications"].map((x) => Notification.fromJson(x))),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "user": user,
        "__v": v,
        "createdAt": createdAt.toIso8601String(),
        "notifications":
            List<dynamic>.from(notifications.map((x) => x.toJson())),
        "updatedAt": updatedAt.toIso8601String(),
      };
}

class Notification {
  Notification({
    required this.notification,
    required this.timestamp,
  });

  String notification;
  int timestamp;

  factory Notification.fromJson(Map<String, dynamic> json) => Notification(
        notification: json["notification"],
        timestamp: json["timestamp"],
      );

  Map<String, dynamic> toJson() => {
        "notification": notification,
        "timestamp": timestamp,
      };
}
