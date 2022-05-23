import 'dart:convert';
import 'package:envo_safe/app/data/api_provider/api_client.dart';
import 'package:dio/dio.dart';
import 'package:envo_safe/app/data/models/api_models/vehicle_model.dart';
import 'package:envo_safe/app/data/models/api_models/vehicle_type.dart';
import 'package:envo_safe/app/widget/common_loader/common_loader.dart';
import 'package:get/get.dart' as g;

class VehicleRepo {

  Future<List<VehicleTypeModel>> getVehicleTypeApi() async {
    try {
      Response r = await ApiClient().dio.get("/vehicle-types");
      return vehicleTypeModelFromJson(
          jsonEncode(r.data["data"]["vehicleTypes"]));
    } on Exception catch (e) {
      return Future.error(e.toString());
    }
  }

  Future<void> addVehicleApi(
      {required String vehicleNumber,
      required int seatsOffered,
      required String vehicleTypeId,
      required String features,
      required double fuelPoint,
      required bool isDefault,
      required String makeAndCategory}) async {
    CommonLoader.showLoading();
    try {
      var data = {
        "vehicleNumber": vehicleNumber,
        "seatsOffering": seatsOffered,
        "vehicleType": vehicleTypeId,
        "features": features,
        "fuelPoints": fuelPoint,
        "isDefault": isDefault,
        "makeAndCategory": makeAndCategory
      };
      Response r = await ApiClient().dio.post("/vehicles", data: data);
      CommonLoader.hideLoading();
      g.Get.back();
    } on Exception catch (e) {
      CommonLoader.showErrorDialog(description: e.toString());
    }
  }

  Future<void> deleteVehicle({required String vehicleId}) async {
    CommonLoader.showLoading();
    try {
      Response r = await ApiClient().dio.delete("vehicles/$vehicleId");
      CommonLoader.hideLoading();
    } on Exception catch (e) {
      CommonLoader.showErrorDialog(description: e.toString());
    }
  }

  Future<void> updateVehicleApi(
      {required String vehicleNumber,
      required int seatsOffered,
      required String vehicleTypeId,
      required String features,
      required double fuelPoint,
      required bool isDefault,
      required String makeAndCategory,
      required String vehicleId}) async {
    CommonLoader.showLoading();
    try {
      var data = {
        "vehicleNumber": vehicleNumber,
        "seatsOffering": seatsOffered,
        "vehicleType": vehicleTypeId,
        "features": features,
        "fuelPoints": fuelPoint,
        "isDefault": isDefault,
        "makeAndCategory": makeAndCategory,
      };
      Response r =
          await ApiClient().dio.post("/vehicles/$vehicleId", data: data);
      CommonLoader.hideLoading();
      g.Get.back();
    } on Exception catch (e) {
      CommonLoader.showErrorDialog(description: e.toString());
    }
  }

  Future<List<VehicleModel>> getUserVehicle() async {
    try {
      Response r = await ApiClient().dio.get("/vehicles");
      return vehicleModelFromJson(jsonEncode(r.data["data"]["vehicles"]));
    } on Exception catch (e) {
      return Future.error(e.toString());
    }
  }

  Future<VehicleModel> getVehicleById({required String Id}) async {
    try {
      Response r = await ApiClient().dio.get("/vehicles/$Id");
      return VehicleModel.fromJson(r.data["data"]["vehicle"]);
    } on Exception catch (e) {
      return Future.error(e.toString());
    }
  }

}
