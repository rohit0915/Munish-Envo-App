import 'package:envo_safe/app/data/models/api_models/ride_suggestion_model.dart';
import 'package:envo_safe/app/modules/matching_rider/widgets/ride_suggestion_tile/ride_suggestion_tile.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';
import '../../../widget/app color/app_colors.dart';
import '../../../widget/constants.dart';
import '../controllers/matching_rider_controller.dart';

class MatchingRiderView extends GetView<MatchingRiderController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bckground,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: appBarColor,
                height: 70,
                width: 415,
                child: Row(
                  children: [
                    SizedBox(
                      width: 3.w,
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: bgColor,
                          size: 25,
                        )),
                    SizedBox(
                      width: 15.w,
                    ),
                    Text(
                      'MATCHING RIDERS ',
                      style: headingTxtStyle,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              controller.obx(
                  (state) => ListView.builder(
                      itemCount: state!.length,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) => RideSuggestionTile(
                            rideSuggestionModel: state[index],
                          )),
                  onEmpty: Center(
                    child: Text("Could Not Find Matching Rides"),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

