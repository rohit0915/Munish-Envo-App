import 'package:envo_safe/app/data/models/api_models/ride_model.dart';
import 'package:envo_safe/app/modules/requests/widgets/rides_widget/controller/rides_widget_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../../../../widget/app color/app_colors.dart';
import '../../../../widget/constants.dart';

class RidesWidget extends StatelessWidget {
  final RidesModel ridesModel;
  final RidesWidgetController ridesWidgetController;
  RidesWidget({required this.ridesModel})
      : ridesWidgetController = Get.put(
            RidesWidgetController(ridesModel: ridesModel),
            tag: ridesModel.id);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.h),
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
        child: Padding(
          padding: EdgeInsets.all(6.sp),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          DateFormat.yMMMd()
                                  .format(ridesModel.departureTimestamp) +
                              " " +
                              DateFormat.jm()
                                  .format(ridesModel.departureTimestamp),
                          style: titleTxtStyle,
                        ),
                        Text(
                          "Status: " + ridesModel.status,
                          style: txtStyleG,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15.h,
                child: Obx(
                  () => GoogleMap(
                    zoomControlsEnabled: true,
                    initialCameraPosition: ridesWidgetController.kGooglePlex,
                    onMapCreated: ridesWidgetController.onMapCompleted,
                    polylines:
                        Set<Polyline>.of(ridesWidgetController.polylines),
                    markers: Set<Marker>.of(ridesWidgetController.allMarkers),
                    scrollGesturesEnabled: false,
                  ),
                ),
              ),
              if (ridesModel.status != ongoing &&
                  ridesModel.status != completed)
                ElevatedButton(
                  onPressed: () {
                    ridesWidgetController.callCheckInApi();
                  },
                  child: Text("Check In"),
                ),
              if (ridesModel.status == ongoing)
                ElevatedButton(
                  onPressed: () {
                    ridesWidgetController.callCheckOutApi();
                  },
                  child: Text("Check Out"),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
