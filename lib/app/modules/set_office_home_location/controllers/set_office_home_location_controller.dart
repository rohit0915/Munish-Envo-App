import 'package:get/get.dart';

import '../../../data/api_provider/repos/auth_repo.dart';
import '../../../routes/app_pages.dart';

class SetOfficeHomeLocationController extends GetxController {  
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
}
