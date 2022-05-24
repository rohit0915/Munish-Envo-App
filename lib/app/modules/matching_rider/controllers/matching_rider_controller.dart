import 'package:envo_safe/app/data/api_provider/repos/hiker_repo.dart';
import 'package:envo_safe/app/data/models/api_models/ride_suggestion_model.dart';
import 'package:get/get.dart';

class MatchingRiderController extends GetxController
    with StateMixin<List<RideSuggestionModel>> {
  String hikeId = Get.arguments;

  @override
  void onInit() {
    callGetRideSuggestionApi();
    super.onInit();
  }

  callGetRideSuggestionApi() {
    HikerRepo hickerRepo = HikerRepo();
    hickerRepo.getRideSuggestionsForHike(hikeId: hikeId).then((value) {
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
