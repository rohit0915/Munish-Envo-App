import 'dart:async';

import 'package:envo_safe/app/data/api_provider/repos/auth_repo.dart';
import 'package:envo_safe/app/data/api_provider/repos/hiker_repo.dart';
import 'package:envo_safe/app/data/models/api_models/ride_suggestion_model.dart';
import 'package:envo_safe/app/data/models/api_models/user_details_model.dart';
import 'package:envo_safe/app/modules/matching_rider/controllers/matching_rider_controller.dart';
import 'package:envo_safe/app/modules/requests/controllers/requests_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sizer/sizer.dart';

import '../../../../../data/map_provider/repos/directions_repo.dart';

class RideSuggestionTileController extends GetxController
    with StateMixin<UserDetailsModel> {
  RideSuggestionTileController({required this.rideSuggestionModel});
  RideSuggestionModel rideSuggestionModel;
  RxList<Marker> allMarkers = <Marker>[].obs;
  RxList<Polyline> polylines = <Polyline>[].obs;
  final CameraPosition kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  Completer<GoogleMapController> mapController = Completer();

  @override
  void onInit() {
    callGetUserDetailsById();
  }

  callGetUserDetailsById() {
    AuthRepo authRepo = AuthRepo();
    authRepo.getUserDetailsById(id: rideSuggestionModel.riderId).then((value) {
      change(value, status: RxStatus.success());
      _loadGoogleMap();
    }, onError: (err) {
      change(value, status: RxStatus.error(err.toString()));
    });
  }

  callSendHikeRequestApi() async {
    HikerRepo hikerRepo = HikerRepo();
    MatchingRiderController matchingRiderController = Get.find();
    hikerRepo
        .addHikeRequest(
            rideId: rideSuggestionModel.rideId,
            hikeId: matchingRiderController.hikeId)
        .then((_) {
      RequestsController requestsController = Get.find();
      requestsController.callGetApis();
    });
  }

  _loadGoogleMap() async {
    var originLatLng = LatLng(rideSuggestionModel.hikerOrigin.lat,
        rideSuggestionModel.hikerOrigin.lng);
    var pickupLatLng = LatLng(rideSuggestionModel.pickupPoint.lat,
        rideSuggestionModel.pickupPoint.lng);
    var dropLatLng = LatLng(
        rideSuggestionModel.dropPoint.lat, rideSuggestionModel.dropPoint.lng);
    var destLatLng = LatLng(rideSuggestionModel.hikerDestination.lat,
        rideSuggestionModel.hikerDestination.lng);
    _addMarker(latLng: originLatLng, title: "Origin");
    _addMarker(latLng: pickupLatLng, title: "Pickup");
    _addPolyLine(
        origin: originLatLng, dest: pickupLatLng, title: "Origin To PickUp");
    _addMarker(latLng: dropLatLng, title: "Drop");
    _addPolyLine(
        origin: pickupLatLng, dest: dropLatLng, title: "PickUp To Drop");
    _addMarker(latLng: destLatLng, title: "Destination");
    _addPolyLine(
        origin: dropLatLng, dest: destLatLng, title: "Drop To Destination");
    var gc = await mapController.future;
    gc.animateCamera(CameraUpdate.newLatLngBounds(
        LatLngBounds(southwest: originLatLng, northeast: destLatLng), 20.sp));
  }

  _addMarker({required LatLng latLng, required String title}) {
    allMarkers.add(
      Marker(
          markerId: MarkerId(title),
          infoWindow: InfoWindow(title: title),
          position: latLng),
    );
    allMarkers.refresh();
  }

  _addPolyLine(
      {required LatLng origin, required LatLng dest, required String title}) {
    DirectionsRepo directionsRepo = DirectionsRepo();
    directionsRepo
        .getDirections(origin: origin, destination: dest)
        .then((value) async {
      if (value.routes.isNotEmpty) {
        polylines.add(Polyline(
            geodesic: true,
            polylineId: PolylineId(title),
            color: Colors.blue,
            width: 5,
            points: PolylinePoints()
                .decodePolyline(value.routes.first.overviewPolyline.points)
                .map((e) => LatLng(e.latitude, e.longitude))
                .toList()));
      }
      polylines.refresh();
    });
  }
}
