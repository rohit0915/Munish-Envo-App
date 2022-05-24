import 'package:envo_safe/app/data/api_provider/repos/hiker_repo.dart';
import 'package:envo_safe/app/data/api_provider/repos/rider_repo.dart';
import 'package:envo_safe/app/data/models/api_models/ride_model.dart';
import 'package:get/get.dart';

class RequestsController extends GetxController with StateMixin {
  List<RidesModel> rides = [];

  @override
  void onInit() async {
    callGetApis();
    super.onInit();
  }

  callGetApis() async {
    change(null, status: RxStatus.loading());
    Future.wait([
      RiderRepo().getUserRidesApi(),
    ]).then((value) {
      rides = value.first;
      change(null, status: RxStatus.success());
    });
  }
}
