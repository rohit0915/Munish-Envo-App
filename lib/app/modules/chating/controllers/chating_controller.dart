import 'package:envo_safe/app/data/chat_provider/repos/chating_repo.dart';
import 'package:envo_safe/app/modules/chat/models/chat_list_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChatingController extends GetxController {
  TextEditingController message = TextEditingController();
  String chaterId = Get.arguments[0];
  RxList<Message> messages = Get.arguments[1].obs;

  setUpClient() {
    ChatingRepo chatingRepo = ChatingRepo();
    chatingRepo.setUp();
  }

  sendMessage() {
    ChatingRepo chatingRepo = ChatingRepo();
    chatingRepo.sendMesssage(chaterID: chaterId, message: message.text);
  }
}
