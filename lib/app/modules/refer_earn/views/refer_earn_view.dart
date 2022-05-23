import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../widget/app color/app_colors.dart';
import '../../../widget/constants.dart';
import '../controllers/refer_earn_controller.dart';

class ReferEarnView extends GetView<ReferEarnController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
          child: Column(children: [
        Container(
          width: 415,
          height: 85,
          padding: const EdgeInsets.all(18),
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
            borderRadius: BorderRadius.all(Radius.circular(20)),
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
                    color: borderblack,
                    size: 25,
                  )),
              SizedBox(
                width: 2.w,
              ),
              const Text('Refer & Earn',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  )),
            ],
          ),
        ),
        SizedBox(
          height: 5.h,
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            width: 350,
            height: 600,
            decoration: BoxDecoration(border: Border.all(color: borderblack)),
            child: Column(
              children: [
                Center(
                  child: Image.asset(
                    'assets/images/money.png',
                    height: 180,
                  ),
                ),
                Center(
                  child: Text(
                    'Invite & Earn',
                    style: titleTxtStyle,
                  ),
                ),
                Center(
                  child: Text(
                    'Earn Upto',
                    style: txtStyleN,
                  ),
                ),
                const Center(
                  child: Text(
                    '50 Points ',
                    style: TextStyle(color: greenbutton),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '    Share',
                    style: titleTxtStyle,
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.network(
                      "https://image.similarpng.com/very-thumbnail/2020/12/Flat-design-Google-logo-design-Vector-PNG.png",
                      height: 7.h,
                    ),
                    Image.network(
                      "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b8/2021_Facebook_icon.svg/800px-2021_Facebook_icon.svg.png",
                      height: 7.h,
                    ),
                    Image.network(
                      "https://image.similarpng.com/very-thumbnail/2020/12/Flat-design-Google-logo-design-Vector-PNG.png",
                      height: 7.h,
                    ),
                    Image.network(
                      "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b8/2021_Facebook_icon.svg/800px-2021_Facebook_icon.svg.png",
                      height: 7.h,
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ])),
    ));
  }
}
