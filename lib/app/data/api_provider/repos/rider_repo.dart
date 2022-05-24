import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:envo_safe/app/data/api_provider/api_client.dart';
import 'package:envo_safe/app/data/models/api_models/ride_model.dart';
import 'package:envo_safe/app/widget/common_loader/common_loader.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RiderRepo {
  addRideApi(
      {required LatLng originLatLng,
      required LatLng destinationLatLng,
      required DateTime departureDateTime,
      required String userVehicleId,
      required int seats}) async {
    CommonLoader.showLoading();
    try {
      var data = {
        "origin": {"lat": originLatLng.latitude, "lng": originLatLng.longitude},
        "destination": {
          "lat": destinationLatLng.latitude,
          "lng": destinationLatLng.longitude
        },
        "departureDateTime": departureDateTime.toIso8601String(),
        "vehicle": userVehicleId,
        "seats": seats
      };
      Response r = await ApiClient().dio.post("/ride", data: data);
      CommonLoader.showSuccessDialog(
          description: "Request For Offering Pool Created");
    } on Exception catch (e) {
      CommonLoader.showErrorDialog(description: e.toString());
    }
  }

  Future<List<RidesModel>> getUserRidesApi() async {
    try {
      Response r = await ApiClient().dio.get("/ride");
      return ridesModelFromJson(jsonEncode(r.data["data"]["rides"]));
    } on Exception catch (e) {
      return Future.error(e.toString());
    }
  }
}
