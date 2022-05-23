// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

import '../../../widget/app color/app_colors.dart';

class SecondSplashScreen extends StatelessWidget {
   SecondSplashScreen({Key? key}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:  [
              Center(
                child: Image.asset("assets/images/logo.png",
                height: 20.h,
                ),
              ),
              Center(
                child: Lottie.asset("assets/images/car.json"),
              )
          ],
        ),
      ),
    );
  }
}
