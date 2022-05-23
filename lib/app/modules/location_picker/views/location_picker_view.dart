import 'package:envo_safe/app/data/models/map_models/places_model.dart';
import 'package:envo_safe/app/modules/carpool/views/carpool_view.dart';
import 'package:envo_safe/app/widget/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sizer/sizer.dart';
import '../../../widget/app color/app_colors.dart';
import '../controllers/location_picker_controller.dart';
import '../widgets/custom_search_delegate.dart';

class LocationPickerView extends GetView<LocationPickerController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: appBarColor,
        automaticallyImplyLeading: true,
        title: Text(
          "Pick Location",
          style: headingTxtStyle,
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () async {
                // method to show the search bar
                controller.openSearch(context);
              },
              icon: const Icon(
                Icons.search,
              ))
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Obx(
              () => GoogleMap(
                zoomControlsEnabled: false,
                initialCameraPosition: controller.kGooglePlex,
                onMapCreated: controller.onMapCreated,
                markers: Set<Marker>.of(controller.allMarkers),
                onTap: (LatLng latLng) {
                  controller.saveLatLng(latLng: latLng);
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 2.h),
                child: GestureDetector(
                  onTap: () {
                    //Send result back from here
                    if (controller.searchedLatLng != null) {
                      Get.back(result: controller.searchedLatLng);
                    }
                  },
                  child: Container(
                    height: 45,
                    width: 170,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(100.0)),
                        color: appBarColor),
                    child: const Text(
                      'Select Location',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: bgColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
