import 'dart:async';

import 'package:envo_safe/app/data/api_provider/repos/auth_repo.dart';
import 'package:envo_safe/app/modules/login/controllers/login_controller.dart';
import 'package:envo_safe/app/modules/signup/controllers/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyController extends GetxController {
  GlobalKey<FormState> otpkey = GlobalKey<FormState>();
  RxString elapsedTime = '02:00'.obs;
  int _start = 120;
  String result = '';
  bool isLogin = Get.arguments;
  List<TextEditingController> otp = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  late Timer _timer;
  String formatTime(int secs) {
    var minutes = ((secs % 3600) ~/ 60).toString().padLeft(2, '0');
    var seconds = (secs % 60).toString().padLeft(2, '0');
    return "$minutes:$seconds";
  }

  String? otpvalidator(value) {
    if (value.length == 0) {
      return '';
    } else {
      return null;
    }
  }

  callLoginVerifyApi() {
    LoginController loginController = Get.find();
    AuthRepo authRepo = AuthRepo();
    authRepo.verifyLoginApi(phone: loginController.mobile.text, otp: result);
  }

  callRegisterVerifyApi() {
    SignupController signupController = Get.find();
    AuthRepo authRepo = AuthRepo();
    authRepo.verifyRegisterApi(
        phone: signupController.mobile.text, otp: result);
  }

  checkOtp() {
    final isValiadtor = otpkey.currentState!.validate();
    if (!isValiadtor) {
      return;
    } else {
      otpdigits();
      if (isLogin) {
        //call login verify api
        callLoginVerifyApi();
      } else {
        //call register verify api
        callRegisterVerifyApi();
      }
    }
  }

  @override
  void onInit() {
    startTimer();

    super.onInit();
  }

  void otpdigits() {
    result = "";
    for (int i = 0; i < otp.length; i++) {
      result += otp[i].text;
    }
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_start < 1) {
        timer.cancel();
        elapsedTime.value = '00:00';
      } else {
        _start = _start - 1;
        elapsedTime.value = formatTime(_start);
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  void onClose() {
    _timer.cancel();
    super.onClose();
  }
}
