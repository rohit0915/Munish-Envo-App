import 'package:envo_safe/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../widget/app color/app_colors.dart';
import '../../../widget/constants.dart';
import '../../carpool/views/carpool_view.dart';
import '../controllers/history_controller.dart';

class HistoryView extends GetView<HistoryController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'HISTORY'),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 3.h,
              ),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'All',
                          style: txtStyleN,
                        ),
                        const Icon(Icons.filter_list_outlined),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        //Get.to(() => const RequestCancel());
                        Get.toNamed(Routes.CANCEL_REQUEST);
                      },
                      child: SizedBox(
                        height: 100,
                        child: Card(
                          elevation: 5,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 2.w,
                              ),
                              CircleAvatar(
                                radius: 25,
                                child: Image.asset(
                                  'assets/images/driver.png',
                                  fit: BoxFit.fill,
                                ),
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'New Delhi ----- Noida',
                                    style: titleTxtStyle,
                                  ),
                                  Text(
                                    'Tue,20/12/2021,04:00 PM',
                                    style: txtStyleG,
                                  ),
                                  Text(
                                    'Load Total Amount: ₹ xxx.xx',
                                    style: txtStyleG,
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 1.w,
                              ),
                              Container(
                                  height: 35,
                                  width: 80,
                                  alignment: Alignment.center,
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0)),
                                      color: Colors.redAccent),
                                  child: const Text(
                                    'Cancelled',
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    SizedBox(
                      height: 100,
                      child: Card(
                        elevation: 5,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 2.w,
                            ),
                            CircleAvatar(
                              radius: 25,
                              child: Image.asset(
                                'assets/images/driver.png',
                                fit: BoxFit.fill,
                              ),
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'New Delhi ----- Noida',
                                  style: titleTxtStyle,
                                ),
                                Text(
                                  'Tue,20/12/2021,04:00 PM',
                                  style: txtStyleG,
                                ),
                                Text(
                                  'Load Total Amount: ₹ xxx.xx',
                                  style: txtStyleG,
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 15.w,
                            ),
                            const Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: borderblack,
                              size: 25,
                            )
                          ],
                        ),
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
