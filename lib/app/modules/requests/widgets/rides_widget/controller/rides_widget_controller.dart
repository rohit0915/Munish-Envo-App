import 'dart:async';

import 'package:envo_safe/app/data/api_provider/repos/rider_repo.dart';
import 'package:envo_safe/app/data/models/api_models/ride_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sizer/sizer.dart';

import '../../../../../data/map_provider/repos/directions_repo.dart';

class RidesWidgetController extends GetxController {
  RidesWidgetController({required this.ridesModel});
  RidesModel ridesModel;
  RxList<Marker> allMarkers = <Marker>[].obs;
  RxList<Polyline> polylines = <Polyline>[].obs;
  final CameraPosition kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  Completer<GoogleMapController> mapController = Completer();

  @override
  void onInit() {
    super.onInit();
  }

  onMapCompleted(GoogleMapController con) {
    mapController.complete(con);
    _loadGoogleMap();
  }

  _loadGoogleMap() async {
    LatLng origin = LatLng(ridesModel.originLocation.coordinates[1],
        ridesModel.originLocation.coordinates[0]);
    LatLng dest = LatLng(ridesModel.destinationLocation.coordinates[1],
        ridesModel.destinationLocation.coordinates[0]);
    _addMarker(latLng: origin, title: "Origin");
    _addMarker(latLng: dest, title: "Destination");
    //_addPolyLine(polyLine: ridesModel.routePolyline);
    _addPolyLine(origin: origin, dest: dest, title: "Route");
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
      var gc = await mapController.future;
      gc.animateCamera(CameraUpdate.newLatLngBounds(
          LatLngBounds(
              southwest: LatLng(value.routes.first.bounds.southwest.lat,
                  value.routes.first.bounds.southwest.lng),
              northeast: LatLng(value.routes.first.bounds.northeast.lat,
                  value.routes.first.bounds.northeast.lng)),
          20.sp));
    });
  }

  callCheckInApi() {
    RiderRepo riderRepo = RiderRepo();
    riderRepo.rideCheckIn(rideId: ridesModel.id);
  }

  callCheckOutApi() {
    RiderRepo riderRepo = RiderRepo();
    riderRepo.rideCheckOut(rideId: ridesModel.id);
  }
}
