// To parse this JSON data, do
//
//     final requestOnRideModel = requestOnRideModelFromJson(jsonString);

import 'dart:convert';

List<RequestOnRideModel> requestOnRideModelFromJson(String str) =>
    List<RequestOnRideModel>.from(
        json.decode(str).map((x) => RequestOnRideModel.fromJson(x)));

String requestOnRideModelToJson(List<RequestOnRideModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RequestOnRideModel {
  RequestOnRideModel({
    required this.id,
    required this.hike,
    required this.ride,
    required this.createdAt,
    required this.dropLocation,
    required this.fare,
    required this.hickerDestinationToDropDistance,
    required this.hiker,
    required this.hikerOriginToPickupDistance,
    required this.pickupLocation,
    required this.pickupTimestamp,
    required this.rider,
    required this.status,
    required this.updatedAt,
  });

  String id;
  Hike hike;
  Hike ride;
  DateTime createdAt;
  Location dropLocation;
  double fare;
  double hickerDestinationToDropDistance;
  Hiker hiker;
  double hikerOriginToPickupDistance;
  Location pickupLocation;
  DateTime pickupTimestamp;
  String rider;
  String status;
  DateTime updatedAt;

  factory RequestOnRideModel.fromJson(Map<String, dynamic> json) =>
      RequestOnRideModel(
        id: json["id"],
        hike: Hike.fromJson(json["hike"]),
        ride: Hike.fromJson(json["ride"]),
        createdAt: DateTime.parse(json["createdAt"]),
        dropLocation: Location.fromJson(json["dropLocation"]),
        fare: json["fare"].toDouble(),
        hickerDestinationToDropDistance:
            json["hickerDestinationToDropDistance"].toDouble(),
        hiker: Hiker.fromJson(json["hiker"]),
        hikerOriginToPickupDistance:
            json["hikerOriginToPickupDistance"].toDouble(),
        pickupLocation: Location.fromJson(json["pickupLocation"]),
        pickupTimestamp:
            DateTime.fromMillisecondsSinceEpoch(json["pickupTimestamp"] * 1000),
        rider: json["rider"],
        status: json["status"],
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "hike": hike.toJson(),
        "ride": ride.toJson(),
        "createdAt": createdAt.toIso8601String(),
        "dropLocation": dropLocation.toJson(),
        "fare": fare,
        "hickerDestinationToDropDistance": hickerDestinationToDropDistance,
        "hiker": hiker.toJson(),
        "hikerOriginToPickupDistance": hikerOriginToPickupDistance,
        "pickupLocation": pickupLocation.toJson(),
        "pickupTimestamp": pickupTimestamp,
        "rider": rider,
        "status": status,
        "updatedAt": updatedAt.toIso8601String(),
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
    required this.seats,
    this.seatsRemaining,
  });

  String id;
  Location originLocation;
  Location destinationLocation;
  int? seats;
  int? seatsRemaining;

  factory Hike.fromJson(Map<String, dynamic> json) => Hike(
        id: json["_id"],
        originLocation: Location.fromJson(json["origin_location"]),
        destinationLocation: Location.fromJson(json["destination_location"]),
        seats: json["seats"] == null ? null : json["seats"],
        seatsRemaining:
            json["seats_remaining"] == null ? null : json["seats_remaining"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "origin_location": originLocation.toJson(),
        "destination_location": destinationLocation.toJson(),
        "seats": seats == null ? null : seats,
        "seats_remaining": seatsRemaining == null ? null : seatsRemaining,
      };
}

class Hiker {
  Hiker({
    required this.id,
    required this.phoneNumber,
    required this.name,
    required this.profileImage,
  });

  String id;
  String phoneNumber;
  String name;
  String profileImage;

  factory Hiker.fromJson(Map<String, dynamic> json) => Hiker(
        id: json["_id"],
        phoneNumber: json["phone_number"],
        name: json["name"],
        profileImage: json["profile_image"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "phone_number": phoneNumber,
        "name": name,
        "profile_image": profileImage,
      };
}
