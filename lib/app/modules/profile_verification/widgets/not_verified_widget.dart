import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class NotVerifiedWidget extends StatelessWidget {
  const NotVerifiedWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.red,
            shape: BoxShape.circle,
          ),
          child: Padding(
            padding: EdgeInsets.all(30.sp),
            child: Text(
              "!",
              style: TextStyle(
                color: Colors.white,
                fontSize: 50.sp,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
        Text(
          "Profile Not Verfied".toUpperCase(),
          style: TextStyle(fontSize: 25.sp),
        )
      ],
    );
  }
}
