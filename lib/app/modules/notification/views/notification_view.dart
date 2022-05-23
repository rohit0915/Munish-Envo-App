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
          style: titleTxtStyle,
        ),
        backgroundColor: bgColor,
        leading: IconButton(
            color: borderblack,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 20,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: <Widget>[
            SizedBox(
              height: 3.h,
            ),
            const ListTile(
              title: Text(
                  "You have booked lorem studio for 23/10/2021 and the time being scheduled is 11:00 AM.",
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
              trailing: Icon(Icons.more_vert),
            ),
            const Divider(
              thickness: 2,
              endIndent: 1,
              indent: 1,
            ),
            SizedBox(
              height: 3.h,
            ),
            const ListTile(
              title: Text(
                  "You have booked lorem studio for 23/10/2021 and the time being scheduled is 11:00 AM.",
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
              trailing: Icon(Icons.more_vert),
            ),
            const Divider(
              thickness: 3,
              endIndent: 1,
              indent: 1,
            ),
            const ListTile(
              title: Text(
                  "You have booked lorem studio for 23/10/2021 and the time being scheduled is 11:00 AM.",
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
              trailing: Icon(Icons.more_vert),
            ),
            const Divider(
              thickness: 2,
              endIndent: 1,
              indent: 1,
            ),
            SizedBox(
              height: 3.h,
            ),
            const ListTile(
              title: Text(
                  "You have booked lorem studio for 23/10/2021 and the time being scheduled is 11:00 AM.",
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
              trailing: Icon(Icons.more_vert),
            ),
            const Divider(
              thickness: 2,
              endIndent: 1,
              indent: 1,
            ),
          ],
        ),
      ),
    );
  
  }
}
