import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../widget/app color/app_colors.dart';
import '../../../widget/constants.dart';
import '../controllers/help_support_controller.dart';

class HelpSupportView extends GetView<HelpSupportController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text('Help And Support'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            height: 400,
            width: 330,
            decoration: BoxDecoration(
              border: Border.all(color: borderblack, width: 1),
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: <Widget>[
                SizedBox(
                  height: 10.h,
                ),
                ListTile(
                  leading: const Icon(
                    Icons.location_on_outlined,
                    color: Colors.blue,
                    size: 40,
                  ),
                  title: Text(
                    'Address',
                    style: titleTxtStyle,
                  ),
                  subtitle: Expanded(
                    child: Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                        style: txtStyleN),
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                ListTile(
                  leading: const Icon(Icons.dialer_sip_outlined,
                      color: Colors.greenAccent, size: 36),
                  title: Text('Contact', style: titleTxtStyle),
                  subtitle: Text(
                    '+91 982771919',
                    style: txtStyleN,
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                ListTile(
                  leading:
                      const Icon(Icons.mail, color: Colors.yellow, size: 36),
                  title: Text('Mail', style: titleTxtStyle),
                  subtitle: Text(
                    'abc@gmail.com',
                    style: txtStyleN,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
