// To parse this JSON data, do
//
//     final hikesModel = hikesModelFromJson(jsonString);

import 'dart:convert';

List<HikesModel> hikesModelFromJson(String str) =>
    List<HikesModel>.from(json.decode(str).map((x) => HikesModel.fromJson(x)));

String hikesModelToJson(List<HikesModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HikesModel {
  HikesModel({
    required this.id,
    required this.hike,
    required this.ride,
    required this.createdAt,
    required this.dropLocation,
    required this.hickerDestinationToDropDistance,
    required this.hiker,
    required this.hikerOriginToPickupDistance,
    required this.pickupLocation,
    required this.pickupTimestamp,
    required this.rider,
    required this.status,
    required this.updatedAt,
    required this.fare,
  });

  String id;
  Hike hike;
  Hike ride;
  DateTime createdAt;
  Location dropLocation;
  double hickerDestinationToDropDistance;
  Hiker hiker;
  double hikerOriginToPickupDistance;
  Location pickupLocation;
  DateTime pickupTimestamp;
  Hiker rider;
  String status;
  DateTime updatedAt;
  num fare;

  factory HikesModel.fromJson(Map<String, dynamic> json) => HikesModel(
        id: json["id"],
        hike: Hike.fromJson(json["hike"]),
        ride: Hike.fromJson(json["ride"]),
        createdAt: DateTime.parse(json["createdAt"]),
        dropLocation: Location.fromJson(json["dropLocation"]),
        hickerDestinationToDropDistance:
            json["hickerDestinationToDropDistance"].toDouble(),
        hiker: Hiker.fromJson(json["hiker"]),
        hikerOriginToPickupDistance:
            json["hikerOriginToPickupDistance"].toDouble(),
        pickupLocation: Location.fromJson(json["pickupLocation"]),
        pickupTimestamp:
            DateTime.fromMillisecondsSinceEpoch(json["pickupTimestamp"] * 1000),
        rider: Hiker.fromJson(json["rider"]),
        status: json["status"],
        updatedAt: DateTime.parse(json["updatedAt"]),
        fare: json["fare"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "hike": hike.toJson(),
        "ride": ride.toJson(),
        "createdAt": createdAt.toIso8601String(),
        "dropLocation": dropLocation.toJson(),
        "hickerDestinationToDropDistance": hickerDestinationToDropDistance,
        "hiker": hiker.toJson(),
        "hikerOriginToPickupDistance": hikerOriginToPickupDistance,
        "pickupLocation": pickupLocation.toJson(),
        "pickupTimestamp": pickupTimestamp,
        "rider": rider.toJson(),
        "status": status,
        "updatedAt": updatedAt.toIso8601String(),
        "fare": fare,
      };
}

class Location {
  Location({
    required this.type,
    required this.coordinates,
  });

  String type;
  List<double> coordinates;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        type: json["type"],
        coordinates:
            List<double>.from(json["coordinates"].map((x) => x.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "coordinates": List<dynamic>.from(coordinates.map((x) => x)),
      };
}

class Hike {
  Hike({
    required this.id,
    required this.originLocation,
    required this.destinationLocation,
    required this.departureTimestamp,
  });

  String id;
  Location originLocation;
  Location destinationLocation;
  int departureTimestamp;

  factory Hike.fromJson(Map<String, dynamic> json) => Hike(
        id: json["_id"],
        originLocation: Location.fromJson(json["origin_location"]),
        destinationLocation: Location.fromJson(json["destination_location"]),
        departureTimestamp: json["departure_timestamp"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "origin_location": originLocation.toJson(),
        "destination_location": destinationLocation.toJson(),
        "departure_timestamp": departureTimestamp,
      };
}

class Hiker {
  Hiker({
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

  factory Hiker.fromJson(Map<String, dynamic> json) => Hiker(
        id: json["_id"],
        phoneNumber: json["phone_number"],
        email: json["email"],
        name: json["name"],
        profileImage: json["profile_image"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "phone_number": phoneNumber,
        "email": email,
        "name": name,
        "profile_image": profileImage,
      };
}
