import 'dart:convert';
import 'package:envo_safe/app/data/api_provider/api_client.dart';
import 'package:envo_safe/app/modules/chat/models/chat_list_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart';

class ChatingController extends GetxController {
  TextEditingController input = TextEditingController();
  String chaterId = Get.arguments[0];
  String userId = Get.arguments[2];
  RxList<Message> messages = <Message>[].obs;
  late Socket socket;

  late ScrollController listScrollController;

  @override
  void onInit() {
    listScrollController = ScrollController();
    setUpClient();
    super.onInit();
  }

  setUpClient() {
    socket = io(
        ApiClient.baseUrl,
        OptionBuilder()
            .setTransports(['websocket'])
            .disableAutoConnect() // disable auto-connection
            .build());
    //ading previous messages
    messages.addAll(Get.arguments[1]);
    messages.refresh();
    if (listScrollController.hasClients)
      listScrollController.animateTo(
          listScrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 1),
          curve: Curves.easeIn);
    //setup
    socket.connect();
    socket.onConnect((_) {
      debugPrint("Socket Connected");
      socket.emit("setup", jsonEncode({"id": userId}));
    });

    //listening for message
    socket.on("toclient", (data) {
      var dataMap = data;
      String senderId = dataMap["user"] == userId ? userId : dataMap["user"];
      String recieverId = dataMap["user"] != userId ? userId : dataMap["user"];
      var tempjson = {
        "message": dataMap["message"],
        "sender": senderId,
        "receiver": recieverId,
        "timestamp": DateTime.now().millisecondsSinceEpoch,
      };
      var _msg = Message.fromJson((tempjson));
      messages.add(_msg);
      messages.refresh();
      if (listScrollController.hasClients)
        listScrollController.animateTo(
            listScrollController.position.maxScrollExtent,
            duration: Duration(milliseconds: 1),
            curve: Curves.easeIn);
    });
    socket.onConnectTimeout((data) => debugPrint("connetion timeout"));
    socket.onError((data) => debugPrint(data.toString()));
  }

  sendMessage() {
    socket.emit(
        "message", jsonEncode({"user": chaterId, "message": input.text}));
    input.clear();
  }

  /* setUpClient() {
    messages.addAll(Get.arguments[1]);
    messages.refresh();
    ChatingRepo chatingRepo = ChatingRepo();
    chatingRepo.setUp();    
    ChatWsClient().socket.on("message", (data) {
      var dataMap = jsonDecode(data);
      String senderId = dataMap["user"] == userId ? userId : dataMap["user"];
      String recieverId = dataMap["user"] != userId ? userId : dataMap["user"];
      var tempjson = {
        "message": dataMap["message"],
        "sender": senderId,
        "receiver": recieverId,
        "timestamp": DateTime.now().toUtc().toString(),
      };
      var _msg = Message.fromJson((tempjson));
      messages.add(_msg);
      messages.refresh();
    });
  }

//   {
//     "user": "6278c0384cea08bd1984711c",
//     "message": "some message"
//  }
 */
  @override
  void onClose() {
    socket.disconnect();
    socket.dispose();
    listScrollController.dispose();
    input.dispose();
    super.onClose();
  }
}
