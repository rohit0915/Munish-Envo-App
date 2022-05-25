import 'dart:async';
import 'package:envo_safe/app/data/api_provider/repos/hiker_repo.dart';
import 'package:envo_safe/app/data/api_provider/repos/rider_repo.dart';
import 'package:envo_safe/app/data/api_provider/repos/vehicle_repo.dart';
import 'package:envo_safe/app/data/map_provider/repos/directions_repo.dart';
import 'package:envo_safe/app/data/map_provider/repos/place_repo.dart';
import 'package:envo_safe/app/data/models/api_models/vehicle_model.dart';
import 'package:envo_safe/app/modules/requests/controllers/requests_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sizer/sizer.dart';

import '../../../data/api_provider/repos/auth_repo.dart';
import '../../../data/models/api_models/vehicle_type.dart';
import '../../../routes/app_pages.dart';

class CarpoolController extends GetxController with StateMixin {
  LatLng? pickUpLocation;
  LatLng? dropLocation;
  TextEditingController seatsRequired = TextEditingController();
  TextEditingController pickUpText = TextEditingController();
  TextEditingController droptext = TextEditingController();
  Rx<DateTime?> departureDateTime = (null as DateTime?).obs;
  List<VehicleModel> userVehicle = [];
  Rx<VehicleModel?> selectedUserVehicle = (null as VehicleModel?).obs;

  @override
  void onInit() {
    callGetApis();
    super.onInit();
  }

  callGetApis() {
    Future.wait([VehicleRepo().getUserVehicle()]).then((value) {
      userVehicle = value.first;
      change(null, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }

  selectDepartureDateTime(BuildContext context) async {
    var tempDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day + 2));
    var tempTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (tempDate != null && tempTime != null) {
      departureDateTime.value = DateTime(tempDate.year, tempDate.month,
          tempDate.day, tempTime.hour, tempTime.minute);
    }
  }

  RxList<Marker> allMarkers = <Marker>[].obs;
  RxList<Polyline> polylines = <Polyline>[].obs;
  final CameraPosition kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  Completer<GoogleMapController> mapController = Completer();

  pickPickupLocation() async {
    var tempPick = await Get.toNamed(Routes.LOCATION_PICKER);
    if (tempPick != null) {
      pickUpLocation = tempPick;
      var mk = Marker(
        markerId: MarkerId("pickUp"),
        infoWindow: InfoWindow(title: "Pick Up"),
        position: pickUpLocation!,
      );
      allMarkers.add(mk);
      allMarkers.refresh();
      var mapC = await mapController.future;
      mapC.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(target: pickUpLocation!, zoom: 15)));
      pickUpText.text = await getPlaceNameByLatLng(pickUpLocation!);
      setPolylines();
    }
  }

  pickDropLocation() async {
    var tempPick = await Get.toNamed(Routes.LOCATION_PICKER);
    if (tempPick != null) {
      dropLocation = tempPick;
      var mk = Marker(
          markerId: MarkerId("drop"),
          infoWindow: InfoWindow(title: "Drop"),
          position: dropLocation!,
          icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueYellow));
      allMarkers.add(mk);
      allMarkers.refresh();
      var mapC = await mapController.future;
      mapC.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(target: dropLocation!, zoom: 15)));
      droptext.text = await getPlaceNameByLatLng(dropLocation!);
      setPolylines();
    }
  }

  setPolylines() async {
    if (pickUpLocation != null && dropLocation != null) {
      DirectionsRepo directionsRepo = DirectionsRepo();
      directionsRepo
          .getDirections(origin: pickUpLocation!, destination: dropLocation!)
          .then((value) async {
        if (value.routes.isNotEmpty) {
          polylines.add(Polyline(
              geodesic: true,
              polylineId: const PolylineId("polyline0"),
              color: Colors.blue,
              width: 5,
              points: PolylinePoints()
                  .decodePolyline(value.routes.first.overviewPolyline.points)
                  .map((e) => LatLng(e.latitude, e.longitude))
                  .toList()));
          var gc = await mapController.future;
          gc.animateCamera(CameraUpdate.newLatLngBounds(
              LatLngBounds(
                  southwest: LatLng(value.routes.first.bounds.southwest.lat,
                      value.routes.first.bounds.southwest.lng),
                  northeast: LatLng(value.routes.first.bounds.northeast.lat,
                      value.routes.first.bounds.northeast.lng)),
              20.sp));
        }
        polylines.refresh();
      });
    }
  }

  callUpdateHomeLocation() async {
    var pickedLatLng = await Get.toNamed(Routes.LOCATION_PICKER);
    if (pickedLatLng != null) {
      AuthRepo authRepo = AuthRepo();
      authRepo.updateHomeLocation(homeLatLng: pickedLatLng);
    }
  }

  callUpdateOfficeLocation() async {
    var pickedLatLng = await Get.toNamed(Routes.LOCATION_PICKER);
    if (pickedLatLng != null) {
      AuthRepo authRepo = AuthRepo();
      authRepo.updateOfficeLocation(officeLatLng: pickedLatLng);
    }
  }

  Future<String> getPlaceNameByLatLng(LatLng latLng) async {
    try {
      var value = await PlaceRepo().getPlaceByLatLng(latLng);
      if (value.isEmpty) {
        return "";
      } else {
        return value.first.name;
      }
    } on Exception catch (e) {
      return "";
    }
  }

  callAddRideApi() {
    RiderRepo riderRepo = RiderRepo();
    riderRepo
        .addRideApi(
            originLatLng: pickUpLocation!,
            destinationLatLng: dropLocation!,
            departureDateTime: departureDateTime.value!,
            userVehicleId: selectedUserVehicle.value!.id,
            seats: int.parse(seatsRequired.text))
        .then((value) {
      Get.find<RequestsController>().callGetApis();
    });
  }

  callAddHikeApi() {
    HikerRepo hickerRepo = HikerRepo();
    hickerRepo
        .addHikeApi(
            originLatLng: pickUpLocation!,
            destinationLatLng: dropLocation!,
            departureDateTime: departureDateTime.value!,
            seats: int.parse(seatsRequired.text))
        .then((value) {
      Get.find<RequestsController>().callGetApis();
    });
  }
}
