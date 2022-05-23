import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class RectangularGradientButton extends StatelessWidget {
  const RectangularGradientButton({
    Key? key,
    required this.title,
    required this.onTap,
    required this.gradient,
  }) : super(key: key);
  final String title;
  final Gradient gradient;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 5.h,
          //width: 50.w,
          decoration: BoxDecoration(
              gradient: gradient, borderRadius: BorderRadius.circular(6)),
          child: Center(
              child: Text(
            title,
            style: TextStyle(color: Colors.white),
          )),
        ),
      ),
    );
  }
}
