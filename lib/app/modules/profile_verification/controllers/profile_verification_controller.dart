import 'package:envo_safe/app/data/api_provider/repos/auth_repo.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileVerificationController extends GetxController
    with StateMixin<bool> {
  @override
  void onInit() {
    callApi();
    super.onInit();
  }

  callApi() {
    AuthRepo authRepo = AuthRepo();
    authRepo.getProfileVerificationStatus().then((value) {
      change(value, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }

  pickImage() async {
    ImagePicker picker = ImagePicker();
    var tempImage = await picker.pickImage(source: ImageSource.gallery);
    if (tempImage != null) {
      //todo manage  profile verification
    }
  }
}
