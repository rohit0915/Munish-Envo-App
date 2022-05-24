import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:get/get.dart' as g;
import '../../../routes/app_pages.dart';
import '../../../widget/common_loader/common_loader.dart';
import '../../models/api_models/ride_suggestion_model.dart';
import '../api_client.dart';

class HikerRepo {
  addHikeApi(
      {required LatLng originLatLng,
      required LatLng destinationLatLng,
      required DateTime departureDateTime,
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
        "seats": seats
      };
      Response r = await ApiClient().dio.post("/hike", data: data);
      CommonLoader.hideLoading();
      g.Get.toNamed(Routes.MATCHING_RIDER, arguments: r.data["hikeId"]);
    } on Exception catch (e) {
      CommonLoader.showErrorDialog(description: e.toString());
    }
  }

  Future<List<RideSuggestionModel>> getRideSuggestionsForHike(
      {required String hikeId}) async {
    try {
      Response r = await ApiClient().dio.get("/hike/$hikeId/ride-suggestions");
      return rideSuggestionModelFromJson(jsonEncode(r.data["data"]["rides"]));
    } on Exception catch (e) {
      return Future.error(e.toString());
    }
  }

  Future<void> addHikeRequest({required String rideId, required String hikeId}) async {
    CommonLoader.showLoading();
    try {
      var data = {"rideId": rideId, "hikeId": hikeId};
      Response r = await ApiClient().dio.post("/hike-requests", data: data);
      CommonLoader.showSuccessDialog(description: "Request Sent");
    } on Exception catch (e) {
      CommonLoader.showErrorDialog(description: e.toString());
    }
  }

  getUserHikes() async {}
}
