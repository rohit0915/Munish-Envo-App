// To parse this JSON data, do
//
//     final userDetailsModel = userDetailsModelFromJson(jsonString);

import 'dart:convert';

UserDetailsModel userDetailsModelFromJson(String str) =>
    UserDetailsModel.fromJson(json.decode(str));

String userDetailsModelToJson(UserDetailsModel data) =>
    json.encode(data.toJson());

class UserDetailsModel {
  UserDetailsModel({
    required this.id,
    required this.phoneNumber,
    required this.email,
    required this.name,
    required this.profileImage,
  });

  String id;
  String phoneNumber;
  String email;
  String name;
  String profileImage;

  factory UserDetailsModel.fromJson(Map<String, dynamic> json) =>
      UserDetailsModel(
        id: json["id"],
        phoneNumber: json["phoneNumber"],
        email: json["email"],
        name: json["name"],
        profileImage: json["profileImage"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "phoneNumber": phoneNumber,
        "email": email,
        "name": name,
        "profileImage": profileImage,
      };
}
