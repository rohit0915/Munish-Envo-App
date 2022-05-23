import 'package:envo_safe/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import '../../../widget/app color/app_colors.dart';
import '../controllers/set_office_home_location_controller.dart';

class SetOfficeHomeLocationView
    extends GetView<SetOfficeHomeLocationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
          child: PhysicalModel(
            elevation: 10,
            color: Colors.blueGrey,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 2.w,
                vertical: 1.3.h,
              ),
              width: 100.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 3.h,
                    ),
                    Text(
                      "Let's Create Your Ride",
                      style: TextStyle(fontSize: 18.sp),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text("Your Address are Kept Confidential"),
                    SizedBox(height: 2.h),
                    Row(
                      children: [
                        Text(
                          "Time",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 12.sp),
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        Icon(
                          Icons.timelapse_sharp,
                          size: 2.8.h,
                          color: Colors.grey,
                        )
                      ],
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      DateFormat.jm().format(DateTime.now()),
                      style: TextStyle(
                          fontSize: 13.sp,
                          decoration: TextDecoration.underline),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    InkWell(
                      onTap: () {
                        controller.callUpdateHomeLocation();
                      },
                      child: TextField(
                        enabled: false,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            hintText: "Set home location",
                            suffixIcon: Icon(Icons.gps_fixed)),
                      ),
                    ),
                    SizedBox(height: 2.h),
                    InkWell(
                      onTap: () {
                        controller.callUpdateOfficeLocation();
                      },
                      child: TextField(
                        enabled: false,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            hintText: "Set office location",
                            suffixIcon: Icon(Icons.gps_fixed)),
                      ),
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    InkWell(
                      onTap: () {
                        Get.toNamed(Routes.RIDERS_PLEDGE);
                      },
                      child: Container(
                        height: 6.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            gradient: themeButtonColor),
                        child: Center(
                          child: Text(
                            "Continue",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 6.h,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
