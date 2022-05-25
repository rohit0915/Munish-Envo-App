import 'package:envo_safe/app/data/api_provider/repos/rider_repo.dart';
import 'package:envo_safe/app/modules/requests_on_ride/model/request_on_ride_model.dart';
import 'package:get/get.dart';

class RequestsOnRideController extends GetxController
    with StateMixin<List<RequestOnRideModel>> {
  String rideId = Get.arguments;

  @override
  void onInit() {
    callGetRequestOnRideApi();
    super.onInit();
  }

  callGetRequestOnRideApi() {
    RiderRepo().getRequestsOnRideModel(rideId: rideId).then((value) {
      if (value.isNotEmpty) {
        change(value, status: RxStatus.success());
      } else {
        change(null, status: RxStatus.empty());
      }
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }
}
