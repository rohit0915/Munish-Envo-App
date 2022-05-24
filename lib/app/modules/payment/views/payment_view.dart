import 'package:envo_safe/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../widget/app color/app_colors.dart';
import '../../../widget/constants.dart';
import '../controllers/payment_controller.dart';

class PaymentView extends GetView<PaymentController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bckground,
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text('Payment'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //link paytm
              Container(
                height: 80,
                width: 340,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                    color: bgColor,
                    border: Border.all(color: greytxt, width: 1),
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(5, 5),
                        blurRadius: 15,
                        color: bckground,
                      )
                    ]),
                child: Row(
                  children: [
                    SizedBox(
                      width: 2.w,
                    ),
                    CircleAvatar(
                      radius: 30,
                      child: Image.asset(
                        'assets/images/paytm.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'PAYTM Wallet',
                            style: titleTxtStyle,
                          ),
                          const Text(
                            'Link your Paytm wallet ',
                            style: TextStyle(fontSize: 14, color: Colors.black),
                          ),
                          const Text(
                            'and grab rewards',
                            style: TextStyle(fontSize: 14, color: Colors.black),
                          ),
                        ]),
                    SizedBox(
                      width: 10.w,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 20,
                        width: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(25.0)),
                            border:
                                Border.all(color: Colors.amber, width: 1.0)),
                        child: const Text(
                          'Link',
                          style: TextStyle(color: Colors.amber),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 5.h,
              ),

              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                  color: bgColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 3.h,
                    ),
                    Text(
                      'History',
                      style: titleTxtStyle,
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Container(
                      height: 110,
                      width: 380,
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10.0)),
                          color: bgColor,
                          border: Border.all(color: greytxt, width: 1),
                          boxShadow: const [
                            BoxShadow(
                              offset: Offset(5, 5),
                              blurRadius: 15,
                              color: bckground,
                            )
                          ]),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 2.w,
                          ),
                          CircleAvatar(
                            radius: 30,
                            child: Image.asset(
                              'assets/images/driver.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Rarthasaethi',
                                style: titleTxtStyle,
                              ),
                              Text(
                                'Delhi',
                                style: txtStyleG,
                              ),
                              Text(
                                'Haryana',
                                style: txtStyleG,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Time  Ratings  Total Price  Vehicle',
                                    style: txtStyleS,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    '5:15 PM  5.0  250/-  SUV',
                                    style: txtStyleS,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Container(
                            height: 40,
                            width: 80,
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(14.0)),
                                color: btnBColor),
                            child: Text(
                              'Requested',
                              style: btntxtStyle,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Container(
                      height: 110,
                      width: 380,
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10.0)),
                          color: bgColor,
                          border: Border.all(color: greytxt, width: 1),
                          boxShadow: const [
                            BoxShadow(
                              offset: Offset(5, 5),
                              blurRadius: 15,
                              color: bckground,
                            )
                          ]),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 2.w,
                          ),
                          CircleAvatar(
                            radius: 30,
                            child: Image.asset(
                              'assets/images/driver.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Rakesh',
                                style: titleTxtStyle,
                              ),
                              Text(
                                'Delhi',
                                style: txtStyleG,
                              ),
                              Text(
                                'Haryana',
                                style: txtStyleG,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Time  Ratings  Total Price  Vehicle',
                                    style: txtStyleS,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    '5:15 PM  5.0  250/-  SUV',
                                    style: txtStyleS,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Container(
                            height: 40,
                            width: 80,
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(14.0)),
                                color: greenbutton),
                            child: Text(
                              'Request',
                              style: btntxtStyle,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Container(
                      height: 110,
                      width: 380,
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10.0)),
                          color: bgColor,
                          border: Border.all(color: greytxt, width: 1),
                          boxShadow: const [
                            BoxShadow(
                              offset: Offset(5, 5),
                              blurRadius: 15,
                              color: bckground,
                            )
                          ]),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 2.w,
                          ),
                          CircleAvatar(
                            radius: 30,
                            child: Image.asset(
                              'assets/images/driver.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Rohit',
                                style: titleTxtStyle,
                              ),
                              Text(
                                'Delhi',
                                style: txtStyleG,
                              ),
                              Text(
                                'Haryana',
                                style: txtStyleG,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Time  Ratings  Total Price  Vehicle',
                                    style: txtStyleS,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    '5:15 PM  5.0  250/-  SUV',
                                    style: txtStyleS,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Container(
                            height: 40,
                            width: 80,
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(14.0)),
                                color: greenbutton),
                            child: Text(
                              'Request',
                              style: btntxtStyle,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Container(
                      height: 110,
                      width: 380,
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10.0)),
                          color: bgColor,
                          border: Border.all(color: greytxt, width: 1),
                          boxShadow: const [
                            BoxShadow(
                              offset: Offset(5, 5),
                              blurRadius: 15,
                              color: bckground,
                            )
                          ]),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 2.w,
                          ),
                          CircleAvatar(
                            radius: 30,
                            child: Image.asset(
                              'assets/images/driver.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Vinay',
                                style: titleTxtStyle,
                              ),
                              Text(
                                'Delhi',
                                style: txtStyleG,
                              ),
                              Text(
                                'Haryana',
                                style: txtStyleG,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Time  Ratings  Total Price  Vehicle',
                                    style: txtStyleS,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    '5:15 PM  5.0  250/-  SUV',
                                    style: txtStyleS,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Container(
                            height: 40,
                            width: 80,
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(14.0)),
                                color: greenbutton),
                            child: Text(
                              'Request',
                              style: btntxtStyle,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
