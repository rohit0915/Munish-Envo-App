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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 415,
                height: 85,
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: bgColor,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(
                        1.0,
                        1.0,
                      ),
                      color: greytxt,
                      blurRadius: 10.0,
                      spreadRadius: 2.0,
                    ),
                  ],
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25)),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                        color: borderblack,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black,
                          size: 20,
                        )),
                    SizedBox(
                      width: 2.w,
                    ),
                    Text('Help & Support', style: titleTxtStyle),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
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
                      leading: const Icon(Icons.mail,
                          color: Colors.yellow, size: 36),
                      title: Text('Mail', style: titleTxtStyle),
                      subtitle: Text(
                        'abc@gmail.com',
                        style: txtStyleN,
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
