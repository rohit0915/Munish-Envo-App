// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class OtpInput extends StatelessWidget {
  const OtpInput(
      {Key? key,
      required this.controller,
      required this.autoFocus,
      required this.validator})
      : super(key: key);
  final bool autoFocus;
  final TextEditingController controller;
  final String? Function(String?) validator;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.w),
      child: Container(
        height: 7.h,
        width: 8.w,
        decoration: const BoxDecoration(),
        child: TextFormField(
          validator: validator,
          decoration: InputDecoration(
            counterText: '',
            focusColor: Colors.black,
          ),
          autofocus: autoFocus,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          controller: controller,
          maxLength: 1,
          onChanged: (value) {
            if (value.length == 1) {
              FocusScope.of(context).nextFocus();
            }
          },
        ),
      ),
    );
  }
}
