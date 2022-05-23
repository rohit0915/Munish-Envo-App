// ignore_for_file: must_be_immutable


import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../app color/app_colors.dart';

class MyAppBarM extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  var text;

    MyAppBarM({Key? key, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: appBarColor,
          height: 70 ,
          width: 415 ,
          child: Row(
            children: [
              SizedBox(
                width: 5.w,
              ),
              GestureDetector(
                onTap: (){},
                child: Image.asset('assets/images/menu.png',height: 30,width: 30,fit: BoxFit.fill,),
              ),
              SizedBox(
                width: 25.w,
              ),
              text (text) ,
              SizedBox(
                width: 20.w,
              ),
              IconButton(
                  onPressed: (){},
                  icon: const Icon(Icons.notifications, color: bgColor,size: 25,)),
            ],
          ),


    );
  }
}


// class Utility {
//
//   // static actionBar() {
//   //   return AppBar(
//   //     backgroundColor: MyAppTheme.backgroundColor,
//   //     brightness: Brightness.dark,
//   //     centerTitle: true,
//   //     title: Container(
//   //       height: 50,
//   //       width: 50,
//   //       alignment: Alignment.center,
//   //       child: Image.asset(MyImages.ic_app_logo),
//   //     ),
//   //     leading: Builder(
//   //       builder: (context) => // Ensure Scaffold is in context
//   //       // ignore: deprecated_member_use
//   //       FlatButton(
//   //           padding: const EdgeInsets.all(0.0),
//   //           child: const Icon(
//   //             Icons.arrow_back,
//   //             size: 25,
//   //           ),
//   //           onPressed: () => {Utility.hideKeyboard(context), Get.back()}),
//   //     ),
//   //   );
//   // }
//
//
//   static actionBarM() {
//     return Container(
//           color: appBarColor,
//           height: 70 ,
//           width: 415 ,
//           child: Row(
//             children: [
//               SizedBox(
//                 width: 5.w,
//               ),
//               GestureDetector(
//                 onTap: (){},
//                 child: Image.asset('assets/images/menu.png',height: 30,width: 30,fit: BoxFit.fill,),
//               ),
//               SizedBox(
//                 width: 25.w,
//               ),
//               Text('OFFER POOL',style: headingTxtStyle,),
//               SizedBox(
//                 width: 20.w,
//               ),
//               IconButton(
//                   onPressed: (){},
//                   icon: Icon(Icons.notifications, color: bgColor,size: 25,)),
//             ],
//           ),
//
//     );
//   }
// }