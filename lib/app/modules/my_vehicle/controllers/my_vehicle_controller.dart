import 'package:envo_safe/app/data/api_provider/repos/vehicle_repo.dart';
import 'package:envo_safe/app/data/models/api_models/vehicle_model.dart';
import 'package:get/get.dart';

class MyVehicleController extends GetxController
    with StateMixin<List<VehicleModel>> {
  callGetUserVehicleApi() {
    change(null, status: RxStatus.loading());
    VehicleRepo vehicleRepo = VehicleRepo();
    vehicleRepo.getUserVehicle().then((value) {
      if (value.isNotEmpty) {
        change(value, status: RxStatus.success());
      } else {
        change(null, status: RxStatus.empty());
      }
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }

  callRemoveVehicleApi({required String vehicleId}) {
    VehicleRepo vehicleRepo = VehicleRepo();
    vehicleRepo
        .deleteVehicle(vehicleId: vehicleId)
        .then((value) => callGetUserVehicleApi());
  }

  @override
  void onInit() {
    callGetUserVehicleApi();
    super.onInit();
  }
}
