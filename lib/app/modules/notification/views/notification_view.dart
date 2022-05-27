import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../widget/app color/app_colors.dart';
import '../../../widget/constants.dart';
import '../controllers/notification_controller.dart';

class NotificationView extends GetView<NotificationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notifications',
        ),
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await controller.callGetNotificationApi();
        },
        child: controller.obx(
          (state) => Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: ListView.builder(
              itemCount: state!.notifications.length,
              itemBuilder: (context, index) => Column(
                children: [
                  SizedBox(
                    height: 3.h,
                  ),
                  ListTile(
                    title: Text(state.notifications[index].notification,
                        style: TextStyle(
                          fontSize: 13.0,
                          color: borderblack,
                          fontWeight: FontWeight.w400,
                        )),
                    leading: Icon(
                      Icons.mail,
                      color: Colors.blueAccent,
                      size: 50,
                    ),
                    //subtitle: Text("Province"),
                    //trailing: Icon(Icons.more_vert),
                  ),
                  const Divider(
                    thickness: 2,
                    endIndent: 1,
                    indent: 1,
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
