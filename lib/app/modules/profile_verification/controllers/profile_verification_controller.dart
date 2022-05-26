import 'dart:io';

import 'package:envo_safe/app/data/api_provider/repos/auth_repo.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileVerificationController extends GetxController
    with StateMixin<bool> {
  Rx<File> aadharImage = File("").obs;
  Rx<File> panImage = File("").obs;
  Rx<File> dlImage = File("").obs;
  Rx<File> voterImage = File("").obs;

  @override
  void onInit() {
    callGetStatusApi();
    super.onInit();
  }

  callGetStatusApi() {
    AuthRepo authRepo = AuthRepo();
    authRepo.getProfileVerificationStatus().then((value) {
      change(value, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }

  pickImage(Rx<File> image) async {
    ImagePicker picker = ImagePicker();
    var tempImage = await picker.pickImage(source: ImageSource.gallery);
    if (tempImage != null) {
      image.value = File(tempImage.path);
    }
  }

  callUploadDocument() {
    AuthRepo authRepo = AuthRepo();
    authRepo.uploadDocumentsApi(
        aadhaarImagePath: aadharImage.value.path,
        panCardImagePath: panImage.value.path,
        voterImagePath: voterImage.value.path,
        drivingLicensePath: dlImage.value.path);
  }
}
