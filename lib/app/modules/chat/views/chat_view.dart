import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../widget/app color/app_colors.dart';
import '../../../widget/constants.dart';
import '../../carpool/views/carpool_view.dart';
import '../controllers/chat_controller.dart';

class ChatView extends GetView<ChatController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'CHAT'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundColor: bgColor,
                    child: CircleAvatar(
                      radius: 30,
                      child: Image.asset('assets/images/profile.png'),
                    ),
                  ),
                  SizedBox(
                    width: 2.w,
                  ),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Jack Jordon', style: titleTxtStyle),
                      SizedBox(
                        height: 1.h,
                      ),
                      Text('Lorem Ipsum', style: txtStyleG)
                    ],
                  ),

                  // Obx(() => Text(
                  //   "12:00 P.M"
                  //   // DateFormat.jm().format( )
                  //   ,
                  //   style: TextStyle(
                  //       fontSize: 13.sp,
                  //        ),
                  // )),
                ],
              ),
            ),
            const Divider(
              color: appBarColor,
            )
          ],
        ),
      ),
    );
  }
}
