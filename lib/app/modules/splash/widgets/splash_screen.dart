// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../widget/app color/app_colors.dart';

class SplashScreen extends StatelessWidget {
   SplashScreen({ Key? key }) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Center(
          child: Image.asset("assets/images/logo.png",
          height: 20.h,
          ),
          )
          ),
      
    );
  }
}