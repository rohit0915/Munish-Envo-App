import 'dart:async';
import 'dart:convert';
import 'package:envo_safe/app/modules/requests/controllers/requests_controller.dart';
import 'package:envo_safe/app/routes/app_pages.dart';
import 'package:get/get.dart' as g;
import 'package:dio/dio.dart';
import 'package:envo_safe/app/data/api_provider/api_client.dart';
import 'package:envo_safe/app/data/models/api_models/ride_model.dart';
import 'package:envo_safe/app/modules/requests_on_ride/model/request_on_ride_model.dart';
import 'package:envo_safe/app/widget/common_loader/common_loader.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RiderRepo {
  Future<void> addRideApi(
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

  Future<List<RequestOnRideModel>> getRequestsOnRideModel(
      {required String rideId}) async {
    try {
      Response r = await ApiClient().dio.get("/ride/$rideId/hike-requests");
      return requestOnRideModelFromJson(
          jsonEncode(r.data["data"]["hikeRequests"]));
    } on Exception catch (e) {
      return Future.error(e.toString());
    }
  }

  Future<void> acceptHikeRequest({required String hikeRequestId}) async {
    CommonLoader.showLoading();
    try {
      Response r =
          await ApiClient().dio.post("/hike-requests/$hikeRequestId/accept");
      CommonLoader.showSuccessDialog(description: "Accepted");
      g.Get.find<RequestsController>().callGetApis();
      g.Get.offNamedUntil(Routes.REQUESTS, (route) => false);
    } on Exception catch (e) {
      CommonLoader.showErrorDialog(description: e.toString());
    }
  }

  Future<void> rideCheckIn({required String rideId}) async {
    try {
      CommonLoader.showLoading();
      Response r = await ApiClient().dio.put("/ride/$rideId/check-in");
      CommonLoader.showSuccessDialog(description: "Checked In");
      await Future.delayed(Duration(seconds: 2));
      g.Get.find<RequestsController>().callGetApis();
    } on Exception catch (e) {
      CommonLoader.showErrorDialog(description: e.toString());
    }
  }

  Future<void> rideCheckOut({required String rideId}) async {
    try {
      CommonLoader.showLoading();
      Response r = await ApiClient().dio.put("/ride/$rideId/check-out");
      CommonLoader.showSuccessDialog(description: "Checked Out");
      await Future.delayed(Duration(seconds: 2));
      g.Get.find<RequestsController>().callGetApis();
    } on Exception catch (e) {
      CommonLoader.showErrorDialog(description: e.toString());
    }
  }
}
