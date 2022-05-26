import 'package:envo_safe/app/modules/profile_verification/controllers/profile_verification_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class NotVerifiedWidget extends GetView<ProfileVerificationController> {
  const NotVerifiedWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.red,
            shape: BoxShape.circle,
          ),
          child: Padding(
            padding: EdgeInsets.all(15.sp),
            child: Text(
              "!",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.sp,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 1.h),
          child: Text(
            "Profile Not Verfied".toUpperCase(),
            style: TextStyle(fontSize: 15.sp),
          ),
        ),
        ListTile(
          onTap: () {
            controller.pickImage(controller.aadharImage);
          },
          leading: Icon(Icons.image),
          title: Text("Upload Aadhaar"),
          trailing: Obx(
            () => controller.aadharImage.value.path == ""
                ? Icon(Icons.chevron_right)
                : Icon(
                    Icons.check,
                    color: Colors.green,
                  ),
          ),
        ),
        ListTile(
          onTap: () {
            controller.pickImage(controller.voterImage);
          },
          leading: Icon(Icons.image),
          title: Text("Upload Voter Id"),
          trailing: Obx(
            () => controller.voterImage.value.path == ""
                ? Icon(Icons.chevron_right)
                : Icon(
                    Icons.check,
                    color: Colors.green,
                  ),
          ),
        ),
        ListTile(
          onTap: () {
            controller.pickImage(controller.panImage);
          },
          leading: Icon(Icons.image),
          title: Text("Upload Pan Card"),
          trailing: Obx(
            () => controller.panImage.value.path == ""
                ? Icon(Icons.chevron_right)
                : Icon(
                    Icons.check,
                    color: Colors.green,
                  ),
          ),
        ),
        ListTile(
          onTap: () {
            controller.pickImage(controller.dlImage);
          },
          leading: Icon(Icons.image),
          title: Text("Upload Driving License"),
          trailing: Obx(
            () => controller.dlImage.value.path == ""
                ? Icon(Icons.chevron_right)
                : Icon(
                    Icons.check,
                    color: Colors.green,
                  ),
          ),
        ),
        ElevatedButton(
            onPressed: () {
              if (controller.aadharImage.value.path == "") {
                return;
              }
              if (controller.voterImage.value.path == "") {
                return;
              }
              if (controller.panImage.value.path == "") {
                return;
              }
              if (controller.dlImage.value.path == "") {
                return;
              }
              controller.callUploadDocument();
            },
            child: Text("Submit"))
      ],
    );
  }
}
