import 'package:envo_safe/app/modules/bottom_navbar/controllers/bottom_navbar_controller.dart';
import 'package:envo_safe/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sizer/sizer.dart';
import '../../../widget/app color/app_colors.dart';
import '../../../widget/constants.dart';
import '../controllers/drawer_controller.dart';

class DrawerView extends GetView<SideDrawerController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        leading: IconButton(
            color: borderblack,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.close_rounded,
              color: appBarColor,
              size: 35,
            )),
        title: Center(
          child: Image.asset(
            "assets/images/logo.png",
            width: 75,
            height: 45,
          ),
        ),
      ),
      backgroundColor: bgColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(children: [
            SizedBox(
              height: 2.h,
            ),
            Container(
              padding: const EdgeInsets.all(20),
              height: 140,
              width: 435,
              decoration: const BoxDecoration(
                color: bgColor,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(
                      1.0,
                      1.0,
                    ),
                    color: Colors.grey,
                    blurRadius: 10.0,
                    spreadRadius: 2.0,
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/images/user.png',
                    width: 75,
                    height: 75,
                  ),
                  SizedBox(
                    width: 1.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Username', style: titleTxtStyle),
                      Text('abc@gmail.com', style: txtStyleN),
                      SizedBox(
                        height: 1.h,
                      ),
                      Text('Manage Profile', style: txtStyleR),
                    ],
                  ),
                  IconButton(
                      color: borderblack,
                      onPressed: () {
                        BottomNavbarController bottomNavbarController =
                            Get.find();
                        bottomNavbarController.index(3);
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: appBarColor,
                        size: 20,
                      )),
                ],
              ),
            ),

            SizedBox(
              height: 4.h,
            ),

            //Post Ride
            GestureDetector(
              onTap: () {
                //Get.to(() => CarpoolScreen());
                BottomNavbarController bottomNavbarController = Get.find();
                bottomNavbarController.index(0);
                Get.back();
              },
              child: Row(
                children: [
                  SizedBox(
                    width: 2.w,
                  ),
                  SizedBox(
                    height: 35,
                    width: 35,
                    child: Image.asset(
                      'assets/images/postride.png',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text('Post Ride', style: titleTxtStyle)
                ],
              ),
            ),

            SizedBox(
              height: 3.h,
            ),

            //My Rides
            GestureDetector(
              onTap: () {
                //todo set it up Get.to(() => const MyRides());
              },
              child: Row(
                children: [
                  SizedBox(
                    width: 2.w,
                  ),
                  SizedBox(
                    height: 35,
                    width: 35,
                    child: Image.asset(
                      'assets/images/rides.png',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text('My Rides', style: titleTxtStyle)
                ],
              ),
            ),

            SizedBox(
              height: 3.h,
            ),

            //payment
            GestureDetector(
              onTap: () {
                Get.toNamed(Routes.PAYMENT);
              },
              child: Row(
                children: [
                  SizedBox(
                    width: 2.w,
                  ),
                  SizedBox(
                    height: 35,
                    width: 35,
                    child: Image.asset(
                      'assets/images/payment.png',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text('Payment', style: titleTxtStyle)
                ],
              ),
            ),

            SizedBox(
              height: 3.h,
            ),

            //my vehicle
            GestureDetector(
              onTap: () {
                //Get.to(() => const MyVehicle());
                Get.toNamed(Routes.MY_VEHICLE);
              },
              child: Row(
                children: [
                  SizedBox(
                    width: 2.w,
                  ),
                  SizedBox(
                    height: 35,
                    width: 35,
                    child: Image.asset(
                      'assets/images/vehicle.png',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text('My Vehicle', style: titleTxtStyle)
                ],
              ),
            ),

            SizedBox(
              height: 3.h,
            ),

            //rides history
            GestureDetector(
              onTap: () {
                BottomNavbarController bottomNavbarController = Get.find();
                bottomNavbarController.index(1);
                Get.back();
                //Get.to(() => const HistoryScreen());
              },
              child: Row(
                children: [
                  SizedBox(
                    width: 2.w,
                  ),
                  SizedBox(
                    height: 35,
                    width: 35,
                    child: Image.asset(
                      'assets/images/rideshistory.png',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text('Rides History', style: titleTxtStyle)
                ],
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            //help & support
            GestureDetector(
              onTap: () {
                //Get.to(() => const HelpnSupport());
                Get.toNamed(Routes.HELP_SUPPORT);
              },
              child: Row(
                children: [
                  SizedBox(
                    width: 2.w,
                  ),
                  SizedBox(
                    height: 35,
                    width: 35,
                    child: Image.asset(
                      'assets/images/support.png',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text('Help & Support', style: titleTxtStyle)
                ],
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            //Chat
            GestureDetector(
              onTap: () {
                BottomNavbarController bottomNavbarController = Get.find();
                bottomNavbarController.index(2);
                Get.back();
                //Get.to(() => const ChatScreen());
              },
              child: Row(
                children: [
                  SizedBox(
                    width: 2.w,
                  ),
                  SizedBox(
                    height: 35,
                    width: 35,
                    child: Image.asset(
                      'assets/images/chat.png',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text('Chat', style: titleTxtStyle)
                ],
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            //Settings
            GestureDetector(
              onTap: () {},
              child: Row(
                children: [
                  SizedBox(
                    width: 2.w,
                  ),
                  SizedBox(
                    height: 35,
                    width: 35,
                    child: Image.asset(
                      'assets/images/setting.png',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text('Settings', style: titleTxtStyle)
                ],
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            //Refer & Rewards
            GestureDetector(
              onTap: () {
                Get.toNamed(Routes.REFER_EARN);
              },
              child: Row(
                children: [
                  SizedBox(
                    width: 2.w,
                  ),
                  SizedBox(
                    height: 35,
                    width: 35,
                    child: Image.asset(
                      'assets/images/refer.png',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text('Refer & Rewards', style: titleTxtStyle)
                ],
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            //Logout
            GestureDetector(
              onTap: () {
                GetStorage box = GetStorage();
                box.erase();
                Get.offAllNamed(Routes.LOGIN);
              },
              child: Row(
                children: [
                  SizedBox(
                    width: 2.w,
                  ),
                  SizedBox(
                    height: 35,
                    width: 35,
                    child: Image.asset(
                      'assets/images/logout.png',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text('Logout', style: titleTxtStyle)
                ],
              ),
            ),

            SizedBox(
              height: 3.h,
            ),
          ]),
        ),
      ),
    );
  }
}
