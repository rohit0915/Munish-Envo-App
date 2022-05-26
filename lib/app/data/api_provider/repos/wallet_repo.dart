import 'package:dio/dio.dart';
import 'package:envo_safe/app/data/api_provider/api_client.dart';
import 'package:envo_safe/app/widget/common_loader/common_loader.dart';

class WalletRepo {
  Future<num> getBalanceApi() async {
    try {
      Response r = await ApiClient().dio.get("/wallet");
      return r.data["data"]["balance"];
    } on Exception catch (e) {
      return Future.error(e.toString());
    }
  }

  Future<Map<String, dynamic>> addMoneyApi({required int amount}) async {
    CommonLoader.showLoading();
    try {
      var data = {"amount": amount};
      Response r = await ApiClient().dio.post("/wallet/add-money", data: data);
      CommonLoader.hideLoading();
      return r.data;
    } on Exception catch (e) {
      return Future.error(e.toString());
    }
  }
}
