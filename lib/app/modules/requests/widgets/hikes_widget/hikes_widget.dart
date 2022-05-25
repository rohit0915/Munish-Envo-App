import 'package:envo_safe/app/data/models/api_models/hike_model.dart';
import 'package:envo_safe/app/modules/requests/widgets/hikes_widget/controller/hikes_widget_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import '../../../../widget/app color/app_colors.dart';
import '../../../../widget/constants.dart';

class HikesWidget extends StatelessWidget {
  final HikesModel hikesModel;
  final HikesWidgetController controller;
  HikesWidget({required this.hikesModel})
      : controller = Get.put(HikesWidgetController(hikesModel: hikesModel),
            tag: hikesModel.id);

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
                        hikesModel.rider.profileImage,
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
                        hikesModel.rider.name,
                        style: titleTxtStyle,
                      ),
                      Text("Status: " + hikesModel.status),
                      Text(
                        hikesModel.rider.email,
                        style: txtStyleG,
                      ),
                      Text(
                        hikesModel.rider.phoneNumber,
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
                                DateFormat.yMMMd()
                                        .format(hikesModel.pickupTimestamp) +
                                    " " +
                                    DateFormat.jm().format(
                                      hikesModel.pickupTimestamp,
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
                                  hikesModel.fare.toString(),
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
            if (hikesModel.status == accepted)
              ElevatedButton(
                  onPressed: () {
                    controller.callHikeCheckInApi();
                  },
                  child: Text("Check In")),
            if (hikesModel.status == ongoing)
              ElevatedButton(
                  onPressed: () {
                    controller.callHikeCheckOut();
                  },
                  child: Text("Check Out"))
          ],
        ),
      ),
    );
  }
}
