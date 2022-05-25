import 'package:envo_safe/app/modules/carpool/views/carpool_view.dart';
import 'package:envo_safe/app/modules/requests/widgets/hikes_widget/hikes_widget.dart';
import 'package:envo_safe/app/modules/requests/widgets/rides_widget/rides_widget.dart';
import 'package:envo_safe/app/routes/app_pages.dart';
import 'package:envo_safe/app/widget/constants.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controllers/requests_controller.dart';

class RequestsView extends GetView<RequestsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Requests".toUpperCase()),
      body: RefreshIndicator(
        onRefresh: () async {
          await controller.callGetApis();
        },
        child: controller.obx(
          (_) => SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (controller.rides.isNotEmpty)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 1.h),
                          child: Text(
                            "Pools Offered",
                            style: TextStyle(fontSize: 15.sp),
                          ),
                        ),
                        ListView.builder(
                          itemCount: controller.rides.length,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) => InkWell(
                              onTap: () {
                                if (controller.rides[index].status == created) {
                                  Get.toNamed(Routes.REQUESTS_ON_RIDE,
                                      arguments: controller.rides[index].id);
                                }
                              },
                              child: RidesWidget(
                                  ridesModel: controller.rides[index])),
                        ),
                      ],
                    ),
                  if (controller.hikes.isNotEmpty)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 1.h),
                          child: Text(
                            "Pools Requested",
                            style: TextStyle(fontSize: 15.sp),
                          ),
                        ),
                        ListView.builder(
                          itemCount: controller.hikes.length,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) =>
                              HikesWidget(hikesModel: controller.hikes[index]),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
