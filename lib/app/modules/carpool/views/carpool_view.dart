import 'package:envo_safe/app/modules/carpool/widgets/offer_pool_bottom_sheet.dart';
import 'package:envo_safe/app/routes/app_pages.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import '../../../widget/app color/app_colors.dart';
import '../../../widget/constants.dart';
import '../controllers/carpool_controller.dart';

class CarpoolView extends GetView<CarpoolController> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: CustomAppBar(title: 'CARPOOL'),
        body: controller.obx(
          (_) => SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 25.h,
                  child: Obx(
                    () => GoogleMap(
                      zoomControlsEnabled: false,
                      initialCameraPosition: controller.kGooglePlex,
                      onMapCreated: (GoogleMapController con) {
                        controller.mapController.complete(con);
                      },
                      polylines: Set<Polyline>.of(controller.polylines),
                      markers: Set<Marker>.of(controller.allMarkers),
                      gestureRecognizers:
                          <Factory<OneSequenceGestureRecognizer>>[
                        Factory<OneSequenceGestureRecognizer>(
                          () => EagerGestureRecognizer(),
                        ),
                      ].toSet(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () async {
                          controller.pickPickupLocation();
                        },
                        child: Container(
                          width: 320,
                          decoration: BoxDecoration(
                            color: bgColor,
                            borderRadius: BorderRadius.circular(60.0),
                            border: Border.all(width: 0.3, color: appBarColor),
                            boxShadow: const <BoxShadow>[
                              BoxShadow(
                                blurRadius: 0.5,
                                spreadRadius: 0.5,
                                color: borderorng,
                              ),
                            ],
                          ),
                          child: TextFormField(
                            //controller: _pickuploc,
                            controller: controller.pickUpText,
                            keyboardType: TextInputType.text,
                            enabled: false,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Field can\'t be empty';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(12.0),
                              hintText: 'Pick Up Location',
                              prefixIcon: Icon(Icons.search),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      InkWell(
                        onTap: () {
                          controller.pickDropLocation();
                        },
                        child: Container(
                          width: 320,
                          decoration: BoxDecoration(
                            color: bgColor,
                            borderRadius: BorderRadius.circular(60.0),
                            border: Border.all(width: 0.3, color: appBarColor),
                            boxShadow: const <BoxShadow>[
                              BoxShadow(
                                blurRadius: 0.5,
                                spreadRadius: 0.5,
                                color: borderorng,
                              ),
                            ],
                          ),
                          child: TextFormField(
                            controller: controller.droptext,
                            keyboardType: TextInputType.text,
                            enabled: false,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Field can\'t be empty';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(12.0),
                              hintText: 'Drop Location',
                              prefixIcon: Icon(Icons.search),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 1.h),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          controller: controller.seatsRequired,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.chair),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            hintText: "Seats",
                            hintStyle: TextStyle(
                              fontSize: 16.0,
                              color: greytxt,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      Obx(
                        () => ListTile(
                          onTap: () {
                            controller.selectDepartureDateTime(context);
                          },
                          leading: Icon(
                            Icons.calendar_month,
                            color: Colors.grey,
                          ),
                          title: Text(
                            controller.departureDateTime.value == null
                                ? "Select Departure Date And Time"
                                : DateFormat.yMMMd().format(
                                        controller.departureDateTime.value!) +
                                    " " +
                                    DateFormat.jm().format(
                                        controller.departureDateTime.value!),
                            style: TextStyle(color: Colors.grey.shade600),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              //Get.to(() => const MatchingRider());
                              if (controller.departureDateTime.value != null &&
                                  controller.seatsRequired.text.isNumericOnly &&
                                  controller.pickUpLocation != null &&
                                  controller.dropLocation != null) {
                                controller.callAddHikeApi();
                              }
                            },
                            child: Container(
                              height: 45,
                              width: 170,
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(100.0)),
                                  color: appBarColor),
                              child: const Text(
                                'FIND POOL',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: bgColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              //Get.to(() => const OfferPool());
                              if (controller.departureDateTime.value != null &&
                                  controller.seatsRequired.text.isNumericOnly &&
                                  controller.pickUpLocation != null &&
                                  controller.dropLocation != null) {
                                Get.bottomSheet(OfferPoolBottomSheet());
                              }
                            },
                            child: Container(
                                height: 45,
                                width: 170,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(100.0)),
                                  border: Border.all(
                                      width: 1.0, color: appBarColor),
                                ),
                                child: const Text(
                                  'OFFER POOL',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: appBarColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      const Divider(
                        thickness: 20,
                        color: bgColor,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '   Add Location',
                          style: titleTxtStyle,
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              controller.callUpdateHomeLocation();
                            },
                            child: Container(
                              height: 40,
                              width: 170,
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(100.0)),
                                  color: greenbutton),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  const Icon(
                                    Icons.home,
                                    color: bgColor,
                                  ),
                                  SizedBox(
                                    width: 3.w,
                                  ),
                                  const Text(
                                    'Home',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: bgColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              controller.callUpdateOfficeLocation();
                            },
                            child: Container(
                                height: 40,
                                width: 170,
                                alignment: Alignment.center,
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(100.0)),
                                  color: blueclr,
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    const Icon(
                                      Icons.work_outline,
                                      color: bgColor,
                                    ),
                                    SizedBox(
                                      width: 3.w,
                                    ),
                                    const Text(
                                      'OFFICE',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: bgColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Offer for you',
                            style: titleTxtStyle,
                          )),
                      SizedBox(
                        height: 1.h,
                      ),
                      Image.asset(
                        'assets/images/soffer.png',
                        width: 375,
                        height: 130,
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Ecometer to check your Savings and CO2 reduction',
                            style: txtStyleG,
                          )),
                      SizedBox(
                        height: 1.h,
                      ),
                      Image.asset(
                        'assets/images/soffer.png',
                        width: 350,
                        height: 130,
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Your Contribution',
                            style: titleTxtStyle,
                          )),
                      SizedBox(
                        height: 1.h,
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Refer to Earn 50 Points plus 2% commission on every ride',
                            style: txtStyleG,
                          )),
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        children: [
                          Text(
                            'Username',
                            style: titleTxtStyle,
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                                height: 35,
                                width: 80,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(70.0)),
                                  border: Border.all(
                                      width: 1.0, color: appBarColor),
                                  color: appBarColor,
                                ),
                                child: const Text(
                                  'Level 1',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: bgColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Refer 10 more people to reach Level 2',
                            style: txtStyleR,
                          )),
                      SizedBox(
                        height: 2.h,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: appBarColor,
      leading: Padding(
        padding: EdgeInsets.only(left: 10, top: 15),
        child: GestureDetector(
          onTap: () {
            //Get.to(() => const HomeMenu());
            Get.toNamed(Routes.DRAWER);
          },
          child: Image.asset(
            'assets/images/menu.png',
            height: 30,
            width: 30,
          ),
        ),
      ),
      title: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Text(
          title,
          style: headingTxtStyle,
        ),
      ),
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
              onPressed: () {
                //Get.to(() => const Notifications());
                Get.toNamed(Routes.NOTIFICATION);
              },
              icon: const Icon(
                Icons.notifications,
                color: bgColor,
                size: 45,
              )),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 70);
}
