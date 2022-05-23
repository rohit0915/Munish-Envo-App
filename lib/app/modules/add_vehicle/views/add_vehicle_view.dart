import 'package:envo_safe/app/data/models/api_models/vehicle_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../widget/app color/app_colors.dart';
import '../controllers/add_vehicle_controller.dart';

class AddVehicleView extends GetView<AddVehicleController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: controller.obx(
          (state) => SingleChildScrollView(
            child: Form(
              key: controller.formKey,
              child: Column(
                children: [
                  Container(
                    width: 415,
                    height: 85,
                    padding: const EdgeInsets.all(20),
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
                        const Text('ADD VEHICLE',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 35),
                          child: Obx(
                            () => DropdownButtonFormField<VehicleTypeModel>(
                                value: controller.selectedVehicleType.value,
                                validator: (val) {
                                  if (val == null) {
                                    return "Select Vehicle Type";
                                  }
                                },
                                hint: Text("Select Vehicle Type"),
                                items: state!
                                    .map((e) =>
                                        DropdownMenuItem<VehicleTypeModel>(
                                            value: e, child: Text(e.name)))
                                    .toList(),
                                onChanged: (val) {
                                  controller.selectedVehicleType(val);
                                }),
                          ),
                        ),
                        //registration
                        TextFormField(
                          validator: (value) {
                            if (value!.length != 10) {
                              return "Enter Valid Number";
                            }
                          },
                          controller: controller.vehicleNumber,
                          textCapitalization: TextCapitalization.characters,
                          maxLength: 10,
                          maxLengthEnforcement: MaxLengthEnforcement.enforced,
                          decoration: const InputDecoration(
                            counterText: "",
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.only(
                                left: 35, bottom: 2, top: 11, right: 35),
                            hintText: "Registration No (DL9CAB1234)",
                            hintStyle: TextStyle(
                              fontSize: 16.0,
                              color: greytxt,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        const Divider(
                          thickness: 1,
                          color: Colors.grey,
                          indent: 30,
                          endIndent: 40,
                        ),

                        //Fuel points
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Value";
                            }
                          },
                          keyboardType: TextInputType.number,
                          controller: controller.fuelPoints,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.only(
                                left: 35, bottom: 2, top: 11, right: 35),
                            hintText: "Fuel Points/Km",
                            hintStyle: TextStyle(
                              fontSize: 16.0,
                              color: greytxt,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        const Divider(
                          thickness: 1,
                          color: Colors.grey,
                          indent: 30,
                          endIndent: 160,
                        ),
                        SizedBox(
                          height: 2.h,
                        ),

                        //Box
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Value";
                            }
                          },
                          keyboardType: TextInputType.number,
                          controller: controller.seats,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.only(
                                left: 35, bottom: 2, top: 11, right: 35),
                            hintText: "Offering Seats",
                            hintStyle: TextStyle(
                              fontSize: 16.0,
                              color: greytxt,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        const Divider(
                          thickness: 1,
                          color: Colors.grey,
                          indent: 30,
                          endIndent: 160,
                        ),

                        //Make & Category (Ex. Red Swift)
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Value";
                            }
                          },
                          controller: controller.makeAndCategory,
                          textCapitalization: TextCapitalization.words,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.only(
                                left: 35, bottom: 2, top: 11, right: 35),
                            hintText: "Make & Category (Ex. Red Swift)",
                            hintStyle: TextStyle(
                              fontSize: 16.0,
                              color: greytxt,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        const Divider(
                          thickness: 1,
                          color: Colors.grey,
                          indent: 30,
                          endIndent: 40,
                        ),

                        //Features (Ex AC,Music,WIFI)
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Value";
                            }
                          },
                          controller: controller.features,
                          textCapitalization: TextCapitalization.words,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.only(
                                left: 35, bottom: 2, top: 11, right: 35),
                            hintText: "Features (Ex AC,Music,WIFI)",
                            hintStyle: TextStyle(
                              fontSize: 16.0,
                              color: greytxt,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        const Divider(
                          thickness: 1,
                          color: Colors.grey,
                          indent: 30,
                          endIndent: 40,
                        ),

                        //checkbox
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 5.w,
                            ),
                            Obx(
                              () => Checkbox(
                                checkColor: Colors.black,
                                activeColor: Colors.white60,
                                value: controller.isDefault.value,
                                onChanged: (value) {
                                  controller.isDefault.value = value!;
                                },
                              ),
                            ),
                            const Text(
                              "Mark As Default Vehicle",
                              style: TextStyle(
                                fontSize: 16.0,
                                color: borderblack,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),

                        SizedBox(
                          height: 2.h,
                        ),

                        InkWell(
                          onTap: () {
                            if (controller.formKey.currentState!.validate()) {
                              if (controller.vehicleId == null) {
                                controller
                                    .callAddVehicleApi(); //Vehicle id is sent from previous screen as argument if its null we add vehicle
                              } else {
                                controller.callUpdateVehicleApi();
                              }
                            }
                          },
                          child: Container(
                            height: 6.h,
                            width: 100.w,
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                                gradient: themeButtonColor),
                            child: Center(
                              child: Text(
                                "Save",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ]))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
