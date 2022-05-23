import 'package:envo_safe/app/widget/constants.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../widget/app color/app_colors.dart';
import '../controllers/cancel_request_controller.dart';

class CancelRequestView extends GetView<CancelRequestController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 415,
              height: 85,
              padding: const EdgeInsets.all(18),
              decoration: const BoxDecoration(
                color: appBarColor,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(
                      1.0,
                      1.0,
                    ),
                    color: greytxt,
                    blurRadius: 10.0,
                    spreadRadius: 2.0,
                  ),
                ],
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25)),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                      color: borderblack,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: bgColor,
                        size: 25,
                      )),
                  SizedBox(
                    width: 20.w,
                  ),
                  Column(
                    children: const [
                      Text('HISTORY',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          )),
                      Text("20 Dec'2021, 01:30 pm",
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          )),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'History',
                      style: titleTxtStyle,
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 2.w,
                      ),
                      SizedBox(
                        height: 70,
                        width: 70,
                        child: Image.asset(
                          'assets/images/car.png',
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Tata Ace- 4 Wheeler',
                            style: txtStyleN,
                          ),
                          Text(
                            'Vehicle Number',
                            style: txtStyleS,
                          ),
                          Text(
                            'HR-29-XY-0001',
                            style: txtStyleS,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 1.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            ' ₹ xxx.xx',
                            style: TextStyle(color: greenbutton),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Text(
                            ' Total Amount',
                            style: txtStyleG,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  const Divider(
                    color: borderblack,
                    thickness: 1,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Ride Taken',
                      style: txtStyleN,
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Name',
                      style: txtStyleN,
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '8965423645',
                      style: txtStyleN,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Pickup and drop Location',
                      style: txtStyleN,
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Container(
                    width: 350,
                    height: 120,
                    decoration: BoxDecoration(
                      color: bgColor,
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(width: 0.3, color: borderblack),
                      boxShadow: const <BoxShadow>[
                        BoxShadow(
                          blurRadius: 0.5,
                          spreadRadius: 0.5,
                          color: borderblack,
                        ),
                      ],
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Field can\'t be empty';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(12.0),
                        hintText: 'Present Address',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Container(
                    width: 350,
                    height: 120,
                    decoration: BoxDecoration(
                      color: bgColor,
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(width: 0.3, color: borderblack),
                      boxShadow: const <BoxShadow>[
                        BoxShadow(
                          blurRadius: 0.5,
                          spreadRadius: 0.5,
                          color: borderblack,
                        ),
                      ],
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Field can\'t be empty';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(12.0),
                        hintText: "Reciever's Address",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 6.h,
                      width: 100.w,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          gradient: cancelButton),
                      child: Center(
                        child: Text(
                          "REQUEST CANCELLED",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );  
  }
}
