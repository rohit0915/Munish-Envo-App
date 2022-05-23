import 'dart:io';

import 'package:envo_safe/app/data/models/api_models/user_details_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../../../data/api_provider/repos/auth_repo.dart';

class ManageProfileController extends GetxController
    with StateMixin<UserDetailsModel> {
  GlobalKey<FormState> registerKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  Rx<File> image = File("").obs;

  @override
  void onInit() {
    callGetUserDetailsApi();
    super.onInit();
  }

  callGetUserDetailsApi() {
    AuthRepo authRepo = AuthRepo();
    authRepo.getUserDetails().then((value) {
      change(value, status: RxStatus.success());
      name.text = value.name;
      email.text = value.email;
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }

  pickImage() async {
    ImagePicker picker = ImagePicker();
    var tempImage = await picker.pickImage(source: ImageSource.gallery);
    if (tempImage != null) {
      cropImage(tempImage.path);
    }
  }

  cropImage(String path) async {
    ImageCropper cropper = ImageCropper();
    var tempImage = await cropper.cropImage(
        sourcePath: path, aspectRatioPresets: [CropAspectRatioPreset.square]);
    if (tempImage != null) {
      image.value = File(tempImage.path);
    }
  }

  callUpdateUserDetailsApi() {
    AuthRepo authRepo = AuthRepo();
    authRepo.updateUserDetailsApi(
        email: email.text, name: name.text, profileImagePath: image.value.path);
  }
}
