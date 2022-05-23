// To parse this JSON data, do
//
//     final vehicleTypeModel = vehicleTypeModelFromJson(jsonString);

import 'dart:convert';

List<VehicleTypeModel> vehicleTypeModelFromJson(String str) => List<VehicleTypeModel>.from(json.decode(str).map((x) => VehicleTypeModel.fromJson(x)));

String vehicleTypeModelToJson(List<VehicleTypeModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class VehicleTypeModel {
    VehicleTypeModel({
        required this.id,
        required this.name,
        required this.seats,
        required this.fuelPointsPerKm,
        required this.image,
        required this.lowercaseName,
        required this.createdAt,
        required this.updatedAt,
    });

    String id;
    String name;
    int seats;
    FuelPointsPerKm fuelPointsPerKm;
    String image;
    String lowercaseName;
    DateTime createdAt;
    DateTime updatedAt;

    factory VehicleTypeModel.fromJson(Map<String, dynamic> json) => VehicleTypeModel(
        id: json["id"],
        name: json["name"],
        seats: json["seats"],
        fuelPointsPerKm: FuelPointsPerKm.fromJson(json["fuelPointsPerKm"]),
        image: json["image"],
        lowercaseName: json["lowercaseName"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "seats": seats,
        "fuelPointsPerKm": fuelPointsPerKm.toJson(),
        "image": image,
        "lowercaseName": lowercaseName,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
    };
}

class FuelPointsPerKm {
    FuelPointsPerKm({
        required this.min,
        required this.max,
    });

    int min;
    int max;

    factory FuelPointsPerKm.fromJson(Map<String, dynamic> json) => FuelPointsPerKm(
        min: json["min"],
        max: json["max"],
    );

    Map<String, dynamic> toJson() => {
        "min": min,
        "max": max,
    };
}
