import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../widget/TextFields/textFields.dart';
import '../../../widget/app color/app_colors.dart';
import '../../../widget/constants.dart';
import '../controllers/manage_profile_controller.dart';

class ManageProfileView extends GetView<ManageProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: appBarColor,
        automaticallyImplyLeading: true,
        title: Text(
          "Mange Profile",
          style: headingTxtStyle,
        ),
        centerTitle: true,
      ),
      body: controller.obx(
        (state) => SafeArea(
          child: Form(
            key: controller.registerKey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 2.h,
                  ),
                  Center(
                      child: Image.asset(
                    "assets/images/logo.png",
                    height: 13.h,
                  )),
                  SizedBox(
                    height: 2.h,
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 2.h),
                      child: InkWell(
                        onTap: () {
                          controller.pickImage();
                        },
                        child: PhysicalModel(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            elevation: 3,
                            child: SizedBox(
                              height: 12.h,
                              child: ClipOval(
                                child:
                                    Obx(() => controller.image.value.path != ""
                                        ? Image.file(
                                            controller.image.value,
                                          )
                                        : Image.network(
                                            state!.profileImage,
                                            errorBuilder: ((context, error,
                                                    stackTrace) =>
                                                Padding(
                                                  padding:
                                                      EdgeInsets.all(15.sp),
                                                  child: Icon(
                                                    Icons.image_search_sharp,
                                                    color: appBarColor,
                                                    size: 45.sp,
                                                  ),
                                                )),
                                          )),
                              ),
                            )),
                      ),
                    ),
                  ),
                  Textfields(
                      controller: controller.name,
                      validator: (val) {
                        if (val == "") {
                          return "Enter Valid Name";
                        }
                      },
                      label: "Enter Name"),
                  SizedBox(
                    height: 1.6.h,
                  ),
                  Textfields(
                      controller: controller.email,
                      validator: (value) {
                        if (!GetUtils.isEmail(value!)) {
                          return 'Please enter your Email';
                        }
                      },
                      label: "Enter Email"),
                  SizedBox(
                    height: 1.6.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 1.h),
                    child: InkWell(
                      onTap: () {
                        if (controller.registerKey.currentState!.validate()) {
                          controller.callUpdateUserDetailsApi();
                        }
                      },
                      child: Container(
                        height: 6.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            gradient: themeButtonColor),
                        child: Center(
                          child: Text(
                            "Submit",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
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
