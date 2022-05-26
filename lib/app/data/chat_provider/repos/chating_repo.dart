import 'dart:convert';

import 'package:envo_safe/app/data/api_provider/repos/auth_repo.dart';
import 'package:envo_safe/app/data/chat_provider/chat_ws_client.dart';

class ChatingRepo {
  setUp() {
    ChatWsClient().socket.connect();
    ChatWsClient().socket.on("connect", (data) async {
      var user = await AuthRepo().getUserDetails();
      ChatWsClient().socket.emit("setup", jsonEncode({"id": user.id}));
    });
  }

  sendMesssage({required String chaterID, required String message}) {
    ChatWsClient()
        .socket
        .emit("message", jsonEncode({"user": chaterID, "message": message}));
  }
}
