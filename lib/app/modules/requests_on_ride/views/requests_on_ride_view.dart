import 'package:envo_safe/app/modules/requests_on_ride/widget/requests_on_ride_tile.dart/requests_on_ride_tile.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controllers/requests_on_ride_controller.dart';

class RequestsOnRideView extends GetView<RequestsOnRideController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          title: Text('Requests'),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: controller.obx(
              (state) => ListView.builder(
                  itemCount: state!.length,
                  itemBuilder: (context, index) =>
                      RequestsOnRideTile(requestOnRideModel: state[index])),
              onEmpty: Center(child: Text("No Requests"))),
        ));
  }
}
