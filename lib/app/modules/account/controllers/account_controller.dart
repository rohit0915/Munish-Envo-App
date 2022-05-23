import 'package:envo_safe/app/data/api_provider/repos/auth_repo.dart';
import 'package:envo_safe/app/data/models/api_models/user_details_model.dart';
import 'package:envo_safe/app/routes/app_pages.dart';
import 'package:get/get.dart';

class AccountController extends GetxController
    with StateMixin<UserDetailsModel> {
      
  @override
  void onInit() {
    callGetUserDetailsApi();
    super.onInit();
  }

  callUpdateHomeLocation() async {
    var pickedLatLng = await Get.toNamed(Routes.LOCATION_PICKER);
    if (pickedLatLng != null) {
      AuthRepo authRepo = AuthRepo();
      authRepo.updateHomeLocation(homeLatLng: pickedLatLng);
    }
  }

  callUpdateOfficeLocation() async {
    var pickedLatLng = await Get.toNamed(Routes.LOCATION_PICKER);
    if (pickedLatLng != null) {
      AuthRepo authRepo = AuthRepo();
      authRepo.updateOfficeLocation(officeLatLng: pickedLatLng);
    }
  }

  callGetUserDetailsApi() {
    AuthRepo authRepo = AuthRepo();
    authRepo.getUserDetails().then((value) {
      change(value, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }
}
