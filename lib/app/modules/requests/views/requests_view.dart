import 'package:envo_safe/app/modules/carpool/views/carpool_view.dart';
import 'package:envo_safe/app/modules/requests/widgets/rides_widget/rides_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controllers/requests_controller.dart';

class RequestsView extends GetView<RequestsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: "Requests".toUpperCase()), 
        body: controller.obx(
          (_) =>  SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,            
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 1.h),
                  child: Text("Pools Offered",style: TextStyle(fontSize: 15.sp),),
                ),
                ListView.builder(
                  itemCount: controller.rides.length,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => RidesWidget(ridesModel: controller.rides[index]))
              ],
            ),  
          ),
        ),
        );
  }
}
