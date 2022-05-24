// To parse this JSON data, do
//
//     final rideSuggestionModel = rideSuggestionModelFromJson(jsonString);

import 'dart:convert';

import 'package:envo_safe/app/data/models/api_models/user_details_model.dart';

List<RideSuggestionModel> rideSuggestionModelFromJson(String str) =>
    List<RideSuggestionModel>.from(
        json.decode(str).map((x) => RideSuggestionModel.fromJson(x)));

String rideSuggestionModelToJson(List<RideSuggestionModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RideSuggestionModel {
  RideSuggestionModel({
    required this.rideId,
    required this.seatsRemaining,
    required this.hikerOrigin,
    required this.hikerDestination,
    required this.pickupPoint,
    required this.dropPoint,
    required this.riderOrigin,
    required this.riderDestination,
    required this.pickupTimestamp,
    required this.hikerOriginToPickupDistance,
    required this.hikerDestToDropDistance,
    required this.fare,
    required this.vehicleNumber,
    required this.vehicleType,
    required this.riderId,
  });

  String rideId;
  int seatsRemaining;
  DropPoint hikerOrigin;
  DropPoint hikerDestination;
  DropPoint pickupPoint;
  DropPoint dropPoint;
  DropPoint riderOrigin;
  DropPoint riderDestination;
  DateTime pickupTimestamp;
  double hikerOriginToPickupDistance;
  double hikerDestToDropDistance;
  double fare;
  String vehicleNumber;
  String vehicleType;
  String riderId;

  factory RideSuggestionModel.fromJson(Map<String, dynamic> json) =>
      RideSuggestionModel(
        rideId: json["rideId"],
        seatsRemaining: json["seatsRemaining"],
        hikerOrigin: DropPoint.fromJson(json["hikerOrigin"]),
        hikerDestination: DropPoint.fromJson(json["hikerDestination"]),
        pickupPoint: DropPoint.fromJson(json["pickupPoint"]),
        dropPoint: DropPoint.fromJson(json["dropPoint"]),
        riderOrigin: DropPoint.fromJson(json["riderOrigin"]),
        riderDestination: DropPoint.fromJson(json["riderDestination"]),
        pickupTimestamp: DateTime.fromMillisecondsSinceEpoch(
            json["pickupTimestamp"] * 1000), //!converting timestamp to dateTime
        hikerOriginToPickupDistance:
            json["hikerOriginToPickupDistance"].toDouble(),
        hikerDestToDropDistance: json["hikerDestToDropDistance"].toDouble(),
        fare: json["fare"].toDouble(),
        vehicleNumber: json["vehicleNumber"],
        vehicleType: json["vehicleType"],
        riderId: json["riderId"],
      );

  Map<String, dynamic> toJson() => {
        "rideId": rideId,
        "seatsRemaining": seatsRemaining,
        "hikerOrigin": hikerOrigin.toJson(),
        "hikerDestination": hikerDestination.toJson(),
        "pickupPoint": pickupPoint.toJson(),
        "dropPoint": dropPoint.toJson(),
        "riderOrigin": riderOrigin.toJson(),
        "riderDestination": riderDestination.toJson(),
        "pickupTimestamp": pickupTimestamp,
        "hikerOriginToPickupDistance": hikerOriginToPickupDistance,
        "hikerDestToDropDistance": hikerDestToDropDistance,
        "fare": fare,
        "vehicleNumber": vehicleNumber,
        "vehicleType": vehicleType,
        "riderId": riderId,
      };
}

class DropPoint {
  DropPoint({
    required this.lng,
    required this.lat,
  });

  double lng;
  double lat;

  factory DropPoint.fromJson(Map<String, dynamic> json) => DropPoint(
        lng: json["lng"].toDouble(),
        lat: json["lat"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "lng": lng,
        "lat": lat,
      };
}
