import 'package:get/get.dart';

import '../../../data/api_provider/repos/hiker_repo.dart';
import '../../../data/api_provider/repos/rider_repo.dart';
import '../../../data/models/api_models/hike_model.dart';
import '../../../data/models/api_models/ride_model.dart';

class HistoryController extends GetxController with StateMixin {
  List<RidesModel> rides = [];
  List<HikesModel> hikes = [];
  @override
  void onInit() async {
    callGetApis();
    super.onInit();
  }

  callGetApis() async {
    change(null, status: RxStatus.loading());
    Future.wait(
            [RiderRepo().getUserRidesApi(), HikerRepo().getUserHikesRequests()])
        .then((value) {
      rides = value[0] as List<RidesModel>;
      hikes = value[1] as List<HikesModel>;
      change(null, status: RxStatus.success());
    });
  }
}
