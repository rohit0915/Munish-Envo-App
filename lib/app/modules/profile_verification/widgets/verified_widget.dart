import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class VerifiedWidget extends StatelessWidget {
  const VerifiedWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.green,
            shape: BoxShape.circle,
          ),
          child: Padding(
            padding: EdgeInsets.all(15.sp),
            child: Icon(
              Icons.check,
              color: Colors.white,
              size: 50.sp,
            ),
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
        Text(
          "Profile Verfied".toUpperCase(),
          style: TextStyle(fontSize: 25.sp),
        )
      ],
    );
  }
}
