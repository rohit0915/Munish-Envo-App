import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class RoundedGradientButton extends StatelessWidget {
  const RoundedGradientButton(
      {Key? key,
      required this.title,
      required this.gradient,
      required this.onTap})
      : super(key: key);
  final Gradient gradient;
  final String title;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 5.h,
          //width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50), gradient: gradient),
          child: Center(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              title,
              style: TextStyle(color: Colors.white),
            ),
          )),
        ),
      ),
    );
  }
}
