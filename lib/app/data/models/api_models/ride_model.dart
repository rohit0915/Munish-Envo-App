// To parse this JSON data, do
//
//     final ridesModel = ridesModelFromJson(jsonString);

import 'dart:convert';

List<RidesModel> ridesModelFromJson(String str) =>
    List<RidesModel>.from(json.decode(str).map((x) => RidesModel.fromJson(x)));

String ridesModelToJson(List<RidesModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RidesModel {
  RidesModel({
    required this.hikeRequests,
    required this.id,
    required this.user,
    required this.vehicle,
    required this.departureDateTime,
    required this.departureTimestamp,
    required this.originLocation,
    required this.destinationLocation,
    required this.routePolyline,
    required this.seatsRemaining,
    required this.hikes,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  List<String> hikeRequests;
  String id;
  String user;
  String vehicle;
  DateTime departureDateTime;
  DateTime departureTimestamp;
  NLocation originLocation;
  NLocation destinationLocation;
  String routePolyline;
  int seatsRemaining;
  List<String> hikes;
  String status;
  DateTime createdAt;
  DateTime updatedAt;

  factory RidesModel.fromJson(Map<String, dynamic> json) => RidesModel(
        hikeRequests: List<String>.from(json["hikeRequests"].map((x) => x)),
        id: json["id"],
        user: json["user"],
        vehicle: json["vehicle"],
        departureDateTime: DateTime.parse(json["departureDateTime"]),
        departureTimestamp: DateTime.fromMillisecondsSinceEpoch(
            json["departureTimestamp"] * 1000),
        originLocation: NLocation.fromJson(json["originLocation"]),
        destinationLocation: NLocation.fromJson(json["destinationLocation"]),
        routePolyline: json["routePolyline"],
        seatsRemaining: json["seatsRemaining"],
        hikes: List<String>.from(json["hikes"].map((x) => x)),
        status: json["status"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "hikeRequests": List<dynamic>.from(hikeRequests.map((x) => x)),
        "id": id,
        "user": user,
        "vehicle": vehicle,
        "departureDateTime": departureDateTime.toIso8601String(),
        "departureTimestamp": departureTimestamp,
        "originLocation": originLocation.toJson(),
        "destinationLocation": destinationLocation.toJson(),
        "routePolyline": routePolyline,
        "seatsRemaining": seatsRemaining,
        "hikes": List<dynamic>.from(hikes.map((x) => x)),
        "status": status,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}

class NLocation {
  NLocation({
    required this.type,
    required this.coordinates,
  });

  String type;
  List<double> coordinates;

  factory NLocation.fromJson(Map<String, dynamic> json) => NLocation(
        type: json["type"],
        coordinates:
            List<double>.from(json["coordinates"].map((x) => x.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "coordinates": List<dynamic>.from(coordinates.map((x) => x)),
      };
}
