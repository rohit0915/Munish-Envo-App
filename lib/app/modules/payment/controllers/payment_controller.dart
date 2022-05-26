import 'package:envo_safe/app/data/api_provider/repos/wallet_repo.dart';
import 'package:envo_safe/app/widget/common_loader/common_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentController extends GetxController with StateMixin<num> {
  TextEditingController money = TextEditingController();
  late Razorpay _razorpay;
  @override
  void onInit() {
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    callGetBalanceApi();
    super.onInit();
  }

  @override
  void onClose() {
    _razorpay.clear();    
    super.onClose();
  }

  callGetBalanceApi() {
    change(null, status: RxStatus.loading());
    WalletRepo walletRepo = WalletRepo();
    walletRepo.getBalanceApi().then((value) {
      change(value, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }

  callAddBalanceApi() {
    WalletRepo walletRepo = WalletRepo();
    walletRepo.addMoneyApi(amount: int.parse(money.text)).then((value) {
      var options = {
        'key':
            'rzp_test_RCA60YesrxgJwm', //razorPayKey,//todo change it to user key
        'amount': value["data"]["order"]["amount"]! * 100,
        'order_id': value["data"]["order"]["orderId"],
        'name': 'Envo Safe Ride',
        'description': 'Adding Money to wallet',
      };

      try {
        _razorpay.open(options);
      } catch (e) {
        debugPrint('Error: e');
      }
    });
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    print('Success Response: $response');
    CommonLoader.showSuccessDialog(description: "Money Successfully Added");
    callGetBalanceApi();
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print('Error Response: $response');
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print('External SDK Response: $response');
  }
}
