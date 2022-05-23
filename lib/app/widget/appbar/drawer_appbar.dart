import '../app%20color/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';

class DrawerAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DrawerAppBar({Key? key, required this.title}) : super(key: key);
  Size get preferredSize => const Size.fromHeight(50);
  final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: InkWell(
        onTap: () {
          Get.back();
        },
        child: Icon(
          Icons.chevron_left,
          color: Colors.white,
          size: 25.sp,
        ),
      ),
      backgroundColor: appBarColor,
      title: Text(
        title,
        style: TextStyle(color: Colors.white, fontSize: 13.sp),
      ),
      centerTitle: true,
    );
  }
}
