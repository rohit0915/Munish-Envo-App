import 'dart:io';

import 'package:envo_safe/app/data/api_provider/repos/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class SignupController extends GetxController {
  GlobalKey<FormState> registerKey = GlobalKey<FormState>();
  TextEditingController mobile = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController referalCode = TextEditingController();
  Rx<File> Image = File("").obs;

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
      Image.value = File(tempImage.path);
    }
  }

  callRegisterApi() {
    AuthRepo authRepo = AuthRepo();
    authRepo.registerApi(
        phone: mobile.text,
        email: email.text,
        name: name.text,
        profileImagePath: Image.value.path);
  }

  checkRegister() {
    final isValidator = registerKey.currentState!.validate();
    if (!isValidator) {
      return;
    } else {
      callRegisterApi();
    }
  }
}
