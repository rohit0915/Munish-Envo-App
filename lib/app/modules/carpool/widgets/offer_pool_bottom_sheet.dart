import 'package:envo_safe/app/data/models/api_models/vehicle_model.dart';
import 'package:envo_safe/app/modules/carpool/controllers/carpool_controller.dart';
import 'package:envo_safe/app/routes/app_pages.dart';
import 'package:envo_safe/app/widget/start_stop_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../../../widget/app color/app_colors.dart';

class OfferPoolBottomSheet extends StatelessWidget {
  CarpoolController carpoolController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
        ),
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(12.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Offer Pool",
                      style: TextStyle(
                        fontSize: 13.sp,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: 3.w),
                                  child: Icon(Icons.alarm),
                                ),
                                Text(
                                  DateFormat.yMMMMd().format(carpoolController
                                      .departureDateTime.value!),
                                  style: TextStyle(fontSize: 13.sp),
                                ),
                                Spacer(),
                                InkWell(
                                  onTap: () {
                                    Get.toNamed(Routes.ADD_VEHICLE);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.blue),
                                        borderRadius:
                                            BorderRadius.circular(8.sp)),
                                    child: Padding(
                                      padding: EdgeInsets.all(3.sp),
                                      child: Text(
                                        "Add Vehicle",
                                        style: TextStyle(
                                            color: Colors.blue,
                                            fontSize: 10.sp),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Obx(
                              () => DropdownButton<VehicleModel>(
                                  isExpanded: true,
                                  hint: Text("Select Vehicle"),
                                  value: carpoolController
                                      .selectedUserVehicle.value,
                                  items: carpoolController.userVehicle
                                      .map(
                                          (e) => DropdownMenuItem<VehicleModel>(
                                                child: Text(e.vehicleNumber),
                                                value: e,
                                              ))
                                      .toList(),
                                  onChanged: (val) {
                                    carpoolController.selectedUserVehicle(val);
                                  }),
                            ),
                            InkWell(
                              onTap: () {
                                if (carpoolController
                                        .selectedUserVehicle.value !=
                                    null) {
                                  carpoolController.callAddRideApi();
                                }
                              },
                              child: Container(
                                decoration:
                                    BoxDecoration(gradient: themeButtonColor),
                                height: 5.h,
                                width: double.infinity,
                                child: Center(
                                  child: Text(
                                    "OFFER POOL",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                          ]),
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
