// To parse this JSON data, do
//
//     final chatListModel = chatListModelFromJson(jsonString);

import 'dart:convert';

ChatListModel chatListModelFromJson(String str) =>
    ChatListModel.fromJson(json.decode(str));

String chatListModelToJson(ChatListModel data) => json.encode(data.toJson());

class ChatListModel {
  ChatListModel({
    required this.chats,
    required this.userId,
  });

  List<Chat> chats;
  String userId;

  factory ChatListModel.fromJson(Map<String, dynamic> json) => ChatListModel(
        chats: List<Chat>.from(json["chats"].map((x) => Chat.fromJson(x))),
        userId: json["userId"],
      );

  Map<String, dynamic> toJson() => {
        "chats": List<dynamic>.from(chats.map((x) => x.toJson())),
        "userId": userId,
      };
}

class Chat {
  Chat({
    required this.id,
    required this.firstUser,
    required this.secondUser,
    required this.messages,
    required this.createdAt,
    required this.updatedAt,
  });

  String id;
  User firstUser;
  User secondUser;
  List<Message> messages;
  DateTime createdAt;
  DateTime updatedAt;

  factory Chat.fromJson(Map<String, dynamic> json) => Chat(
        id: json["_id"],
        firstUser: User.fromJson(json["first_user"]),
        secondUser: User.fromJson(json["second_user"]),
        messages: List<Message>.from(
            json["messages"].map((x) => Message.fromJson(x))),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "first_user": firstUser.toJson(),
        "second_user": secondUser.toJson(),
        "messages": List<dynamic>.from(messages.map((x) => x.toJson())),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}

class User {
  User({
    required this.id,
    required this.name,
    required this.profileImage,
  });

  String id;
  String name;
  String profileImage;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        name: json["name"],
        profileImage: json["profile_image"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "profile_image": profileImage,
      };
}

class Message {
  Message({
    required this.message,
    required this.sender,
    required this.receiver,
    required this.timestamp,
  });

  String message;
  String sender;
  String receiver;
  int timestamp;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        message: json["message"],
        sender: json["sender"],
        receiver: json["receiver"],
        timestamp: json["timestamp"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "sender": sender,
        "receiver": receiver,
        "timestamp": timestamp,
      };
}
