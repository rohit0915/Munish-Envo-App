import 'package:envo_safe/app/modules/matching_rider/widgets/ride_suggestion_tile/controller/ride_suggection_tile_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../../../../data/models/api_models/ride_suggestion_model.dart';
import '../../../../widget/app color/app_colors.dart';
import '../../../../widget/constants.dart';

class RideSuggestionTile extends StatelessWidget {
  final RideSuggestionModel rideSuggestionModel;
  final RideSuggestionTileController controller;
  RideSuggestionTile({Key? key, required this.rideSuggestionModel})
      : controller =
      Get.put(RideSuggestionTileController(
    rideSuggestionModel: rideSuggestionModel,
  ),tag: rideSuggestionModel.rideId);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 5.w),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            color: bgColor,
            border: Border.all(color: greytxt, width: 1),
            boxShadow: const [
              BoxShadow(
                offset: Offset(5, 5),
                blurRadius: 15,
                color: bckground,
              )
            ]),
        child: controller.obx(
          (state) => Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 3.w),
                    child: SizedBox(
                      height: 7.h,
                      width: 7.h,
                      child: ClipOval(
                        child: Image.network(
                          state!.profileImage,
                          errorBuilder: (context, error, stackTrace) =>
                              Image.asset(
                            'assets/images/driver.png',
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          state.name,
                          style: titleTxtStyle,
                        ),
                        Text(
                          state.email,
                          style: txtStyleG,
                        ),
                        Text(
                          state.phoneNumber,
                          style: txtStyleG,
                        ),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Time",
                                  style: txtStyleS,
                                ),
                                Text(
                                  DateFormat.yMMMd().format(
                                          rideSuggestionModel.pickupTimestamp) +
                                      " " +
                                    
                                  DateFormat.jm().format(
                                    rideSuggestionModel.pickupTimestamp,
                                  ),
                                  style: txtStyleS,
                                )
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 1.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Total Price",
                                    style: txtStyleS,
                                  ),
                                  Text(
                                    rideSuggestionModel.fare.toString(),
                                    style: txtStyleS,
                                  )
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Vehicle",
                                  style: txtStyleS,
                                ),
                                Text(
                                  rideSuggestionModel.vehicleType,
                                  style: txtStyleS,
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(12.sp),
                child: SizedBox(
                  height: 20.h,
                  child: Obx(
                    () => GoogleMap(
                      zoomControlsEnabled: false,
                      initialCameraPosition: controller.kGooglePlex,
                      onMapCreated: controller.onMapCreaated,
                      polylines: Set<Polyline>.of(controller.polylines),
                      markers: Set<Marker>.of(controller.allMarkers),
                      gestureRecognizers:
                          <Factory<OneSequenceGestureRecognizer>>[
                        Factory<OneSequenceGestureRecognizer>(
                          () => EagerGestureRecognizer(),
                        ),
                      ].toSet(),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    controller.callSendHikeRequestApi();
                  },
                  child: Text("Send Request"))
            ],
          ),
        ),
      ),
    );
  }
}
