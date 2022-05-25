import 'package:envo_safe/app/data/api_provider/repos/hiker_repo.dart';
import 'package:envo_safe/app/data/api_provider/repos/rider_repo.dart';
import 'package:envo_safe/app/data/models/api_models/hike_model.dart';
import 'package:envo_safe/app/data/models/api_models/ride_model.dart';
import 'package:envo_safe/app/widget/constants.dart';
import 'package:get/get.dart';

class RequestsController extends GetxController with StateMixin {
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
      //!filtering rides
      rides.clear();
      for (var item in value[0] as List<RidesModel>) {
        if (item.status == created || item.status == ongoing) {
          rides.add(item);
        }
      }
      //!filtering hikes
      hikes.clear();
      for (var item in value[1] as List<HikesModel>) {
        if (item.status == requested ||
            item.status == accepted ||
            item.status == ongoing) {
          hikes.add(item);
        }
      }
      change(null, status: RxStatus.success());
    });
  }
}
