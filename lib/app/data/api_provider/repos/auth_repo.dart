import 'dart:convert';

import 'package:envo_safe/app/data/api_provider/api_client.dart';
import 'package:envo_safe/app/data/models/api_models/user_details_model.dart';
import 'package:envo_safe/app/modules/profile_verification/controllers/profile_verification_controller.dart';
import 'package:envo_safe/app/routes/app_pages.dart';
import 'package:envo_safe/app/widget/common_loader/common_loader.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as g;
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'image_repo.dart';

class AuthRepo {
  loginApi({required String phoneNumber}) async {
    CommonLoader.showLoading();
    var data = {"phoneNumber": phoneNumber};
    try {
      Response r = await ApiClient().dio.post("/users/login", data: data);
      CommonLoader.hideLoading();
      g.Get.toNamed(Routes.VERIFY, arguments: true);
    } on Exception catch (e) {
      CommonLoader.showErrorDialog(description: e.toString());
    }
  }

  verifyLoginApi({required String phone, required String otp}) async {
    CommonLoader.showLoading();
    var data = {"phoneNumber": phone, "otp": otp};
    try {
      Response r = await ApiClient()
          .dio
          .post("/users/login-otp-verification", data: data);
      CommonLoader.hideLoading();
      _saveToken(r.data["data"]["loginToken"]);
      g.Get.offAllNamed(
        Routes.BOTTOM_NAVBAR,
      );
    } on Exception catch (e) {
      CommonLoader.showErrorDialog(description: e.toString());
    }
  }

  registerApi(
      {required String phone,
      required String email,
      required String name,
      required String profileImagePath}) async {
    CommonLoader.showLoading();
    try {
      String imageUrl = await ImageRepo().upload(imagePath: profileImagePath);
      var data = {
        "phoneNumber": phone,
        "email": email,
        "name": name,
        "profileImage": imageUrl
      };
      Response r = await ApiClient().dio.post("/users/register", data: data);
      CommonLoader.hideLoading();
      g.Get.toNamed(Routes.VERIFY, arguments: false);
    } on Exception catch (e) {
      CommonLoader.showErrorDialog(description: e.toString());
    }
  }

  verifyRegisterApi({required String phone, required String otp}) async {
    CommonLoader.showLoading();
    var data = {"phoneNumber": phone, "otp": otp};
    try {
      Response r = await ApiClient()
          .dio
          .post("/users/registration-otp-verification", data: data);
      CommonLoader.hideLoading();
      _saveToken(r.data["data"]["loginToken"]);
      g.Get.offAllNamed(
        Routes.SET_OFFICE_HOME_LOCATION,
      );
    } on Exception catch (e) {
      CommonLoader.showErrorDialog(description: e.toString());
    }
  }

  Future<void> updateHomeLocation({required LatLng homeLatLng}) async {
    CommonLoader.showLoading();
    var data = {"lat": homeLatLng.latitude, "lng": homeLatLng.longitude};
    try {
      Response r =
          await ApiClient().dio.put("/users/locations/home", data: data);
      CommonLoader.showSuccessDialog();
    } on Exception catch (e) {
      CommonLoader.showErrorDialog(description: e.toString());
    }
  }

  Future<void> updateOfficeLocation({required LatLng officeLatLng}) async {
    CommonLoader.showLoading();
    var data = {"lat": officeLatLng.latitude, "lng": officeLatLng.longitude};
    try {
      Response r =
          await ApiClient().dio.put("/users/locations/office", data: data);
      CommonLoader.showSuccessDialog();
    } on Exception catch (e) {
      CommonLoader.showErrorDialog(description: e.toString());
    }
  }

  Future<UserDetailsModel> getUserDetails() async {
    try {
      Response r = await ApiClient().dio.get("/users");
      return userDetailsModelFromJson(jsonEncode(r.data["data"]["user"]));
    } on Exception catch (e) {
      return Future.error(e.toString());
    }
  }

  Future<UserDetailsModel> getUserDetailsById({required String id}) async {
    try {
      Response r = await ApiClient().dio.get("/users/$id");
      return userDetailsModelFromJson(jsonEncode(r.data["data"]["user"]));
    } on Exception catch (e) {
      return Future.error(e.toString());
    }
  }

  updateUserDetailsApi(
      {required String email,
      required String name,
      required String profileImagePath}) async {
    CommonLoader.showLoading();
    try {
      String imageUrl = await ImageRepo().upload(imagePath: profileImagePath);
      var data = {"email": email, "name": name, "profileImage": imageUrl};
      Response r = await ApiClient().dio.put("/users", data: data);
      CommonLoader.showSuccessDialog(
          description: "Details Updated Succesfully");
    } on Exception catch (e) {
      CommonLoader.showErrorDialog(description: e.toString());
    }
  }

  Future<void> uploadDocumentsApi(
      {required String aadhaarImagePath,
      required String panCardImagePath,
      required String voterImagePath,
      required String drivingLicensePath}) async {
    CommonLoader.showLoading();
    try {
      var data = {
        "aadhaarCard": await ImageRepo().upload(imagePath: aadhaarImagePath),
        "panCard": await ImageRepo().upload(imagePath: panCardImagePath),
        "voterCard": await ImageRepo().upload(imagePath: voterImagePath),
        "drivingLicense":
            await ImageRepo().upload(imagePath: drivingLicensePath)
      };
      Response r = await ApiClient().dio.put("/users/documents", data: data);
      CommonLoader.showSuccessDialog(description: "Documents Uploaded");
      g.Get.find<ProfileVerificationController>().callGetStatusApi();
    } on Exception catch (e) {
      CommonLoader.showErrorDialog(description: e.toString());
    }
  }

  Future<bool> getProfileVerificationStatus() async {
    try {
      Response r = await ApiClient().dio.get("/users/verification-status");
      return r.data["data"]["status"];
    } on Exception catch (e) {
      return Future.error(e.toString());
    }
  }

  _saveToken(String token) {
    GetStorage box = GetStorage();
    box.write("token", token);
  }
}
