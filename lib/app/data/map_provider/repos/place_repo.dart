import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:envo_safe/app/data/map_provider/map_client.dart';
import 'package:envo_safe/app/data/models/map_models/places_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../constants/env.dart';

class PlaceRepo {
  Future<List<PlacesModel>> getPlaceByText(String searchText) async {
    try {
      Response r =
          await MapClient().dio.get("/place/textsearch/json?query=$searchText");
      if (r.statusCode == 200) {
        return placesModelFromJson(jsonEncode(r.data["results"]));
      } else {
        return Future.error(r.data["status"]);
      }
    } on DioError catch (e) {
      print(e.response!.data);
      return Future.error(e.message);
    }
  }

  Future<List<PlacesModel>> getPlaceByLatLng(LatLng latLng) async {
    try {
      Response r = await MapClient()
          .dio
          .get("/geocode/json?latlng=${latLng.latitude},${latLng.longitude}");
      if (r.statusCode == 200) {
        return placesModelFromJson(jsonEncode(r.data["results"]));
      } else {
        return Future.error(r.data["status"]);
      }
    } on DioError catch (e) {
      print(e.response!.data);
      return Future.error(e.message);
    }
  }
}
