import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:get/get.dart'as g;
import '../../../routes/app_pages.dart';
import '../../../widget/common_loader/common_loader.dart';
import '../api_client.dart';

class HickerRepo {
  addHikeApi(
      {required LatLng originLatLng,
      required LatLng destinationLatLng,
      required DateTime departureDateTime,
      required int seats
      }) async {
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
      //g.Get.toNamed(Routes.MATCHING_RIDER);
    } on Exception catch (e) {
      CommonLoader.showErrorDialog(description: e.toString());
    }
  }
}