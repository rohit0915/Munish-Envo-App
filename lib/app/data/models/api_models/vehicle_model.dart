// To parse this JSON data, do
//
//     final vehicleModel = vehicleModelFromJson(jsonString);

import 'dart:convert';

List<VehicleModel> vehicleModelFromJson(String str) => List<VehicleModel>.from(json.decode(str).map((x) => VehicleModel.fromJson(x)));

String vehicleModelToJson(List<VehicleModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class VehicleModel {
    VehicleModel({
        required this.id,
        required this.vehicleNumber,
        required this.vehicleType,
        required this.user,
        required this.seatsOffering,
        required this.features,
        required this.makeAndCategory,
        required this.fuelPoints,
        required this.isDefault,
    });

    String id;
    String vehicleNumber;
    VehicleType vehicleType;
    String user;
    int seatsOffering;
    String features;
    String makeAndCategory;
    double fuelPoints;
    bool isDefault;

    factory VehicleModel.fromJson(Map<String, dynamic> json) => VehicleModel(
        id: json["id"],
        vehicleNumber: json["vehicleNumber"],
        vehicleType: VehicleType.fromJson(json["vehicleType"]),
        user: json["user"],
        seatsOffering: json["seatsOffering"],
        features: json["features"],
        makeAndCategory: json["makeAndCategory"],
        fuelPoints: json["fuelPoints"].toDouble(),
        isDefault: json["isDefault"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "vehicleNumber": vehicleNumber,
        "vehicleType": vehicleType.toJson(),
        "user": user,
        "seatsOffering": seatsOffering,
        "features": features,
        "makeAndCategory": makeAndCategory,
        "fuelPoints": fuelPoints,
        "isDefault": isDefault,
    };
}

class VehicleType {
    VehicleType({
        required this.id,
        required this.name,
    });

    String id;
    String name;

    factory VehicleType.fromJson(Map<String, dynamic> json) => VehicleType(
        id: json["_id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
    };
}
