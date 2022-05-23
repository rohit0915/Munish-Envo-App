// ignore_for_file: file_names, must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Textfields extends StatelessWidget {
  Textfields(
      {Key? key,
      required this.controller,
      required this.validator,
      required this.label,
      this.keyboardType = TextInputType.text,
      this.obscure = false})
      : super(key: key);
  final String? Function(String?) validator;
  bool obscure;
  String label;
  TextEditingController controller;
  TextInputType keyboardType;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PhysicalModel(
          color: Colors.white,
          elevation: 4,
          borderRadius: BorderRadius.all(Radius.circular(50)),
          child: SizedBox(
            width: 100.w,
            height: 6.h,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.w),
          child: TextFormField(
            obscureText: obscure,
            validator: validator,
            controller: controller,
            keyboardType: keyboardType,
            decoration: InputDecoration(
                prefixText: "   ",
                constraints: BoxConstraints(maxWidth: 100.w),
                border: InputBorder.none,
                hintText: label),
          ),
        )
      ],
    );
  }
}
