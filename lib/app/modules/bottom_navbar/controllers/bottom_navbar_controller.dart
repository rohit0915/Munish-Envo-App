import 'package:envo_safe/app/modules/account/views/account_view.dart';
import 'package:envo_safe/app/modules/carpool/views/carpool_view.dart';
import 'package:envo_safe/app/modules/chat/views/chat_view.dart';
import 'package:envo_safe/app/modules/history/views/history_view.dart';
import 'package:envo_safe/app/modules/requests/views/requests_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class BottomNavbarController extends GetxController {
  RxInt index = 0.obs;
  List<Widget> screens = [
    CarpoolView(),
    RequestsView(),
    ChatView(),
    AccountView(),
  ];
}
