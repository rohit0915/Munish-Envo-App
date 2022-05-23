import 'package:envo_safe/app/data/models/api_models/vehicle_model.dart';
import 'package:envo_safe/app/routes/app_pages.dart';
import 'package:envo_safe/app/widget/constants.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../widget/app color/app_colors.dart';
import '../controllers/my_vehicle_controller.dart';

class MyVehicleView extends GetView<MyVehicleController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                    const Text('MY VEHICLE',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        )),
                  ],
                ),
              ),
              const Divider(
                thickness: 1,
                color: bgColor,
              ),
              controller.obx(
                  (state) => ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: state!.length,
                        itemBuilder: ((context, index) => MyVehicleTile(
                              vehicleModel: state[index],
                              onRemoved: () {
                                controller.callRemoveVehicleApi(
                                    vehicleId: state[index].id);
                              },
                              onEdited: () {
                                Get.toNamed(Routes.ADD_VEHICLE,
                                    arguments:
                                        state[index].id); //to edit vehicle
                              },
                            )),
                      ),
                  onEmpty: Column(
                    children: [
                      Text(
                        'No Vehicle Added yet',
                        style: txtStyleN,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Image.asset(
                        'assets/images/car.png',
                        height: 80,
                        fit: BoxFit.fitHeight,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                    ],
                  )),
              GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.ADD_VEHICLE);
                },
                child: Container(
                  height: 45,
                  width: 170,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(100.0)),
                      color: appBarColor),
                  child: const Text(
                    'Add Vehicle',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: bgColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyVehicleTile extends StatelessWidget {
  const MyVehicleTile(
      {Key? key,
      required this.vehicleModel,
      required this.onRemoved,
      required this.onEdited})
      : super(key: key);
  final void Function() onRemoved;
  final void Function() onEdited;
  final VehicleModel vehicleModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 5.w),
      child: PhysicalModel(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.sp),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(vehicleModel.vehicleNumber,
                        style: TextStyle(fontSize: 15.sp)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Fuel Points:"),
                        Text(vehicleModel.fuelPoints.toString())
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Seats Offered:"),
                        Text(vehicleModel.seatsOffering.toString())
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Features:"),
                        Text(vehicleModel.features)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Vehicle Type:"),
                        Text(vehicleModel.vehicleType.name)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Is Default:"),
                        Checkbox(
                          value: vehicleModel.isDefault,
                          onChanged: (_) {},
                        )
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: onEdited, icon: Icon(Icons.edit)),
                    IconButton(onPressed: onRemoved, icon: Icon(Icons.delete))
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
