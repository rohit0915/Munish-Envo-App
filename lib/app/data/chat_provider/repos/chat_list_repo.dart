import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:envo_safe/app/data/api_provider/api_client.dart';
import 'package:envo_safe/app/data/chat_provider/chat_api_client.dart';
import 'package:envo_safe/app/modules/chat/models/chat_list_model.dart';

class ChatListRepo {
  Future<ChatListModel> getChatList() async {
    try {
      Response r = await ChatApiClient().dio.get("/chats");
      return chatListModelFromJson(jsonEncode(r.data["data"]));
    } on Exception catch (e) {
      return Future.error(e.toString());
    }
  }
}
