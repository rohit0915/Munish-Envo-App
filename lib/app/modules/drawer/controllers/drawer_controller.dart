import 'package:envo_safe/app/data/models/api_models/user_details_model.dart';
import 'package:get/get.dart';

import '../../../data/api_provider/repos/auth_repo.dart';

class SideDrawerController extends GetxController with StateMixin<UserDetailsModel>{
  @override
  void onInit() {
    callGetUserDetailsApi();
    super.onInit();
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
