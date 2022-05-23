import 'package:envo_safe/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../widget/TextFields/textFields.dart';
import '../../../widget/app color/app_colors.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      resizeToAvoidBottomInset: false,
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
                    key: controller.loginKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10.h,
                        ),
                        Center(
                            child: Image.asset(
                          "assets/images/logo.png",
                          height: 13.h,
                        )),
                        SizedBox(
                          height: 3.h,
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
                                  "LOGIN",
                                  style: TextStyle(
                                      color: appBarColor, fontSize: 12.sp),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        Text(
                          "Login using mobile number",
                          style: TextStyle(
                              fontSize: 12.sp, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 1.6.h,
                        ),
                        Textfields(
                            controller: controller.mobile,
                            validator: controller.mobileValidator,
                            keyboardType: TextInputType.phone,
                            label: "Enter mobile number"),
                        SizedBox(
                          height: 1.6.h,
                        ),
                        InkWell(
                          onTap: () {
                            controller.checkLogin();
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
                                "Login",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        InkWell(
                          onTap: () {
                            Get.toNamed(Routes.SIGNUP);
                          },
                          child: Center(
                            child: Text.rich(TextSpan(children: [
                              TextSpan(
                                  text: "Not registered with us?",
                                  style: TextStyle(fontSize: 12.sp)),
                              TextSpan(
                                  text: " SIGNUP",
                                  style: TextStyle(
                                      fontSize: 12.sp, color: appBarColor)),
                            ])),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 6.h,
              ),
              Text(
                "OR",
                style: TextStyle(fontSize: 13.sp, color: Colors.grey[700]),
              ),
              SizedBox(
                height: 1.3.h,
              ),
              Text(
                "Login with",
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
