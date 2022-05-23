import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ImageTextButton extends StatelessWidget {
  const ImageTextButton(
      {Key? key, required this.img, required this.title, required this.onTap})
      : super(key: key);
  final String img, title;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              img,
              height: 6.h,
            ),
          ),
          Text(
            title,
            style: TextStyle(fontSize: 12),
          )
        ],
      ),
    );
  }
}
