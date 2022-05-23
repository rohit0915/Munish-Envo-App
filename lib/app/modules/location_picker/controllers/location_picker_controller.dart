import 'dart:async';
import 'package:envo_safe/app/data/models/map_models/places_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import '../widgets/custom_search_delegate.dart';

class LocationPickerController extends GetxController {
  final CameraPosition kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  Completer<GoogleMapController> mapController = Completer();
  LatLng? searchedLatLng;
  Location _location = Location();
  RxList<Marker> allMarkers = <Marker>[].obs;

  openSearch(BuildContext context) async {
    PlacesModel? searchedPlace;
    searchedPlace = await showSearch<PlacesModel?>(
        context: context, delegate: CustomSearchDelegate());
    if (searchedPlace != null) {
      saveLatLng(
          latLng: LatLng(
        searchedPlace.geometry.location.lat,
        searchedPlace.geometry.location.lng,
      ));
    }
  }

  saveLatLng({required LatLng latLng}) async {
    var mapC = await mapController.future;
    searchedLatLng = latLng;
    var mk = Marker(
      markerId: MarkerId("Location"),
      infoWindow: InfoWindow(title: "Location"),
      position: searchedLatLng!,
    );
    allMarkers.add(mk);
    allMarkers.refresh();
    mapC.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: searchedLatLng!, zoom: 15)));
  }

  onMapCreated(GoogleMapController con) {
    mapController.complete(con);
    /* _location.onLocationChanged.listen((event) async {
      var mapC = await mapController.future;
      mapC.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
          target: LatLng(
            event.latitude!,
            event.longitude!,
          ),
          zoom: 15)));
    }); */
  }
}
