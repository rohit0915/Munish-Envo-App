import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../widget/TextFields/textFields.dart';
import '../../../widget/app color/app_colors.dart';
import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      //resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(blurRadius: 5, color: Colors.blueGrey)
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30))),
                  child: Form(
                    key: controller.registerKey,
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
                          child: PhysicalModel(
                            color: Colors.blueGrey,
                            elevation: 3,
                            borderRadius: BorderRadius.all(
                              Radius.circular(50),
                            ),
                            child: Container(
                              height: 4.h,
                              width: 25.w,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(50),
                                  ),
                                  border: Border.all(
                                      color: appBarColor, width: 0.3.w)),
                              child: Center(
                                child: Text(
                                  "SIGN UP",
                                  style: TextStyle(
                                      color: appBarColor, fontSize: 12.sp),
                                ),
                              ),
                            ),
                          ),
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
                                  child: Obx(
                                    () => controller.Image.value.path != ""
                                        ? ClipOval(
                                            child: Image.file(
                                            controller.Image.value,
                                            height: 12.h,
                                          ))
                                        : Padding(
                                            padding: EdgeInsets.all(15.sp),
                                            child: Icon(
                                              Icons.image_search_sharp,
                                              color: appBarColor,
                                              size: 45.sp,
                                            ),
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
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 1.h),
                          child: Textfields(
                            controller: controller.mobile,
                            validator: (value) {
                              if (!GetUtils.isPhoneNumber(value!)) {
                                return 'Please enter your Mobile number';
                              }
                            },
                            label: "Enter mobile number",
                            keyboardType: TextInputType.phone,
                          ),
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
                        Textfields(
                            controller: controller.referalCode,
                            validator: (val) {
                              /* if (val == "") {
                                return "Enter Referal Code";
                              } */
                            },
                            label: "Enter Referal Code"),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 1.h),
                          child: InkWell(
                            onTap: () {
                              controller.checkRegister();
                            },
                            child: Container(
                              height: 6.h,
                              width: 100.w,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50)),
                                  gradient: themeButtonColor),
                              child: Center(
                                child: Text(
                                  "Register",
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
                        Center(
                          child: Text.rich(TextSpan(children: [
                            TextSpan(
                                text: "Already registered with us?",
                                style: TextStyle(fontSize: 12.sp)),
                            TextSpan(
                                text: " LOGIN",
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Get.back();
                                  },
                                style: TextStyle(
                                    fontSize: 12.sp, color: appBarColor)),
                          ])),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              Text(
                "OR",
                style: TextStyle(fontSize: 13.sp, color: Colors.grey[700]),
              ),
              SizedBox(
                height: 1.h,
              ),
              Text(
                "Sign Up",
                style: TextStyle(fontSize: 13.sp, color: Colors.grey[800]),
              ),
              SizedBox(
                height: 3.h,
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
