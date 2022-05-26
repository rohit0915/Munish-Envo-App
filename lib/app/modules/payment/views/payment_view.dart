import 'package:envo_safe/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../widget/app color/app_colors.dart';
import '../../../widget/constants.dart';
import '../controllers/payment_controller.dart';

class PaymentView extends GetView<PaymentController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bckground,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back_sharp)),
        foregroundColor: Colors.white,
        title: Text('Payment'),
        centerTitle: true,
      ),
      body: controller.obx(
        (state) => Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Wallet Balance",
                style: TextStyle(color: Colors.black, fontSize: 25.sp),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 2.h),
                child: Text(
                  "Rs. ${state!}",
                  style: TextStyle(color: appBarColor, fontSize: 30.sp),
                ),
              ),
              Center(
                child: ElevatedButton(
                    onPressed: () {
                      Get.defaultDialog(
                        title: "Add Money",
                        content: TextField(
                          textAlign: TextAlign.center,
                          controller: controller.money,
                          keyboardType: TextInputType.number,
                          style: TextStyle(fontSize: 20.sp),
                          decoration: InputDecoration(),
                        ),
                        confirmTextColor: Colors.white,
                        textCancel: "Cancel",
                        textConfirm: "Submit",
                        onConfirm: () {
                          if (controller.money.text.isNum) {
                            controller.callAddBalanceApi();
                          }
                        },
                      );
                    },
                    child: Text("Add Money")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
