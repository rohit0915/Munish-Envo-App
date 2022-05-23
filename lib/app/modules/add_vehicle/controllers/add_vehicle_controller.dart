import 'package:envo_safe/app/data/api_provider/repos/vehicle_repo.dart';
import 'package:envo_safe/app/data/models/api_models/vehicle_type.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddVehicleController extends GetxController
    with StateMixin<List<VehicleTypeModel>> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController vehicleNumber = TextEditingController();
  TextEditingController fuelPoints = TextEditingController();
  TextEditingController makeAndCategory = TextEditingController();
  TextEditingController features = TextEditingController();
  TextEditingController seats = TextEditingController();
  RxBool isDefault = false.obs;

  var vehicleId = Get.arguments; //for updating puposes

  Rx<VehicleTypeModel?> selectedVehicleType = (null as VehicleTypeModel?).obs;
  List<VehicleTypeModel> _vehicleTypes = [];
  callGetVehicleType() {
    VehicleRepo vehicleRepo = VehicleRepo();
    vehicleRepo.getVehicleTypeApi().then((value) {
      if (value.isNotEmpty) {
        _vehicleTypes = value;
        change(value, status: RxStatus.success());
      } else {
        change(null, status: RxStatus.empty());
      }
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }

  callAddVehicleApi() {
    VehicleRepo vehicleRepo = VehicleRepo();
    vehicleRepo.addVehicleApi(
        vehicleNumber: vehicleNumber.text,
        seatsOffered: int.parse(seats.text),
        vehicleTypeId: selectedVehicleType.value!.id,
        features: features.text,
        fuelPoint: double.parse(fuelPoints.text),
        isDefault: isDefault.value,
        makeAndCategory: makeAndCategory.text);
  }

  callUpdateVehicleApi() {
    VehicleRepo vehicleRepo = VehicleRepo();
    vehicleRepo.updateVehicleApi(
        vehicleNumber: vehicleNumber.text,
        seatsOffered: int.parse(seats.text),
        vehicleTypeId: selectedVehicleType.value!.id,
        features: features.text,
        fuelPoint: double.parse(fuelPoints.text),
        isDefault: isDefault.value,
        makeAndCategory: makeAndCategory.text,
        vehicleId: vehicleId);
  }

  _callGetVehicleByID() {
    VehicleRepo vehicleRepo = VehicleRepo();
    vehicleRepo.getVehicleById(Id: vehicleId).then((value) {
      vehicleNumber.text = value.vehicleNumber;
      seats.text = value.seatsOffering.toString();
      selectedVehicleType.value = _vehicleTypes
          .firstWhere((element) => element.id == value.vehicleType.id);
      features.text = value.features;
      fuelPoints.text = value.fuelPoints.toString();
      isDefault.value = value.isDefault;
      makeAndCategory.text = value.makeAndCategory;
    });
  }

  @override
  void onInit() {
    callGetVehicleType();
    //callgetvehicleby id if updating vehicle
    if (vehicleId != null) {
      _callGetVehicleByID();
    }
    
    super.onInit();
  }
}
