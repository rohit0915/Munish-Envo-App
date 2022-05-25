import 'package:envo_safe/app/modules/requests_on_ride/model/request_on_ride_model.dart';
import 'package:envo_safe/app/modules/requests_on_ride/widget/requests_on_ride_tile.dart/controller/requests_on_ride_tile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../../../../widget/app color/app_colors.dart';
import '../../../../widget/constants.dart';

class RequestsOnRideTile extends StatelessWidget {
  final RequestOnRideModel requestOnRideModel;
  final RequestsOnRideTileController controller;
  RequestsOnRideTile({required this.requestOnRideModel})
      : controller = Get.put(RequestsOnRideTileController(requestOnRideModel));

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 1.h,
      ),
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
        child: Column(
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
                        requestOnRideModel.hiker.profileImage,
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
                        requestOnRideModel.hiker.name,
                        style: titleTxtStyle,
                      ),
                      Text(
                        requestOnRideModel.hiker.phoneNumber,
                        style: txtStyleG,
                      ),
                      Text(
                        "Seats Remaing: " +
                            requestOnRideModel.ride.seatsRemaining.toString(),
                        style: txtStyleG,
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Date & Time",
                                style: txtStyleS,
                              ),
                              Text(
                                DateFormat.yMMMd().format(
                                        requestOnRideModel.pickupTimestamp) +
                                    " " +
                                    DateFormat.jm().format(
                                      requestOnRideModel.pickupTimestamp,
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
                                  requestOnRideModel.fare.toString(),
                                  style: txtStyleS,
                                )
                              ],
                            ),
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
                height: 15.h,
                child: Obx(
                  () => GoogleMap(
                    zoomControlsEnabled: true,
                    initialCameraPosition: controller.kGooglePlex,
                    onMapCreated: controller.onMapCreated,
                    polylines: Set<Polyline>.of(controller.polylines),
                    markers: Set<Marker>.of(controller.allMarkers),
                    scrollGesturesEnabled: false,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(4.sp),
              child: Text("Status: " + requestOnRideModel.status),
            ),
            if (requestOnRideModel.status == requested)
              ElevatedButton(
                  onPressed: () {
                    controller.callAcceptRequestApi();
                  },
                  child: Text("Accept Request"))
          ],
        ),
      ),
    );
  }
}
