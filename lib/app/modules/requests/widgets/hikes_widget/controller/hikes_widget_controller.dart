import 'dart:async';
import 'package:envo_safe/app/data/api_provider/repos/hiker_repo.dart';
import 'package:envo_safe/app/data/models/api_models/hike_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sizer/sizer.dart';
import '../../../../../data/api_provider/repos/auth_repo.dart';
import '../../../../../data/map_provider/repos/directions_repo.dart';
import '../../../../../data/models/api_models/user_details_model.dart';

class HikesWidgetController extends GetxController {
  HikesWidgetController({required this.hikesModel});
  HikesModel hikesModel;
  RxList<Marker> allMarkers = <Marker>[].obs;
  RxList<Polyline> polylines = <Polyline>[].obs;
  final CameraPosition kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  Completer<GoogleMapController> mapController = Completer();

  onMapCreated(GoogleMapController con) {
    mapController.complete(con);
    _loadGoogleMap();
  }

  _loadGoogleMap() async {
    var originLatLng = LatLng(hikesModel.hike.originLocation.coordinates[1],
        hikesModel.hike.originLocation.coordinates[0]);
    var pickupLatLng = LatLng(hikesModel.pickupLocation.coordinates[1],
        hikesModel.pickupLocation.coordinates[0]);
    var dropLatLng = LatLng(hikesModel.dropLocation.coordinates[1],
        hikesModel.dropLocation.coordinates[0]);
    var destLatLng = LatLng(hikesModel.hike.destinationLocation.coordinates[1],
        hikesModel.hike.destinationLocation.coordinates[0]);
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

  callHikeCheckInApi() {
    HikerRepo hikerRepo = HikerRepo();
    hikerRepo.hikeCheckIn(hikeRequestId: hikesModel.id);
  }

  callHikeCheckOut() {
    HikerRepo hikerRepo = HikerRepo();
    hikerRepo.hikeCheckOut(hikeRequestId: hikesModel.id);
  }
}
