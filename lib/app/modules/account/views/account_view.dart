//import 'package:envo_safe/app/routes/app_pages.dart';
import 'package:envo_safe/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../widget/constants.dart';
import '../../carpool/views/carpool_view.dart';
import '../controllers/account_controller.dart';

class AccountView extends GetView<AccountController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'ACCOUNT'),
      body: controller.obx(
        (state) => SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 4.h,
              ),
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Center(
                      child: ClipOval(
                        child: SizedBox(
                          width: 30.w,
                          child: Image.network(
                            state!.profileImage,
                            errorBuilder: ((context, error, stackTrace) =>
                                Image.asset('assets/images/profile.png')),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Center(
                      child: Text(
                        '${state.name} ${state.phoneNumber}',
                        style: txtStyleN,
                      ),
                    ),

                    SizedBox(
                      height: 3.h,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          state.email,
                          style: txtStyleN,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    // Profile Verfication
                    InkWell(
                      onTap: () {
                        controller.callUpdateHomeLocation();
                      },
                      child: Row(
                        children: [
                          SizedBox(
                            width: 5.w,
                          ),
                          const Icon(
                            Icons.home,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text('Edit Home Location', style: txtStyleN)
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    // Profile Verfication
                    InkWell(
                      onTap: () {
                        controller.callUpdateOfficeLocation();
                      },
                      child: Row(
                        children: [
                          SizedBox(
                            width: 5.w,
                          ),
                          const Icon(
                            Icons.work_outline,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text('Edit Office Location', style: txtStyleN)
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    // Profile Verfication
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.PROFILE_VERIFICATION);
                      },
                      child: Row(
                        children: [
                          SizedBox(
                            width: 5.w,
                          ),
                          SizedBox(
                            height: 20,
                            child: Image.asset(
                              'assets/images/pverify.png',
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text('Profile Verfication Status', style: txtStyleN)
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),

                    // Payments
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.PAYMENT);
                      },
                      child: Row(
                        children: [
                          SizedBox(
                            width: 5.w,
                          ),
                          SizedBox(
                            height: 20,
                            child: Image.asset(
                              'assets/images/pays.png',
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text('Payments', style: txtStyleN)
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 4.h,
                    ),

                    // Refer & Earn
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.REFER_EARN);
                      },
                      child: Row(
                        children: [
                          SizedBox(
                            width: 5.w,
                          ),
                          SizedBox(
                            height: 20,
                            child: Image.asset(
                              'assets/images/r_n_e.png',
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text('Refer & Earn', style: txtStyleN)
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 4.h,
                    ),

                    /*  // Offers
                    GestureDetector(
                      onTap: () {                        
                      },
                      child: Row(
                        children: [
                          SizedBox(
                            width: 5.w,
                          ),
                          SizedBox(
                            height: 20,
                            child: Image.asset(
                              'assets/images/offer.png',
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text('Offers', style: txtStyleN)
                        ],
                      ),
                    ), */
                    // Logout
                    GestureDetector(
                      onTap: () {},
                      child: Row(
                        children: [
                          SizedBox(
                            width: 5.w,
                          ),
                          SizedBox(
                            height: 20,
                            child: Image.asset(
                              'assets/images/setting.png',
                              color: Colors.black,
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text('Logout', style: txtStyleN)
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
