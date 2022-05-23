import 'package:envo_safe/app/data/api_provider/repos/auth_repo.dart';
import 'package:envo_safe/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  TextEditingController mobile = TextEditingController();

  String? mobileValidator(value) {
    if (value == '') {
      return 'Please enter your Mobile number';
    } else if (value.length != 10) {
      return 'Please enter 10 digit Mobile number';
    } else {
      return null;
    }
  }

  callLoginApi() {
    AuthRepo authRepo = AuthRepo();
    authRepo.loginApi(phoneNumber: mobile.text);
  }
  
  checkLogin() {
    final isValidator = loginKey.currentState!.validate();
    if (!isValidator) {
      return;
    } else {
      callLoginApi();
      //Get.toNamed(Routes.VERIFY);
    }
  }
}
