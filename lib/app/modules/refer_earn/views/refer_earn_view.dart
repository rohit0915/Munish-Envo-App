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
        appBar: AppBar(
          foregroundColor: Colors.white,
          title: Text('Refer & Earn'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Column(children: [
            SizedBox(
              height: 5.h,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                padding: EdgeInsets.all(6.sp),
                decoration: BoxDecoration(
                    border: Border.all(color: borderblack),
                    borderRadius: BorderRadius.circular(6.sp)),
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
                      ],
                    )
                  ],
                ),
              ),
            )
          ]),
        ));
  }
}
