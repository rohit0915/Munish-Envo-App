import '../app%20color/app_colors.dart';
import 'package:flutter/material.dart';



class BorderButton extends StatelessWidget {
  const BorderButton(
      {Key? key,
      required this.title,
      required this.onTap,
      this.color = appBarColor})
      : super(key: key);
  final void Function() onTap;
  final color;
  final String title;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: color),
            borderRadius: BorderRadius.circular(50)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 8),
          child: Text(
            title,
            style: TextStyle(color: color),
          ),
        ),
      ),
    );
  }
}
