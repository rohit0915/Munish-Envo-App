import 'package:envo_safe/app/data/chat_provider/repos/chat_list_repo.dart';
import 'package:envo_safe/app/modules/chat/models/chat_list_model.dart';
import 'package:get/get.dart';

class ChatController extends GetxController with StateMixin<ChatListModel> {

  @override
  onInit() {
    callGetChatListApi();
    super.onInit();
  }

  callGetChatListApi() {
    change(null, status: RxStatus.loading());
    ChatListRepo chatListRepo = ChatListRepo();
    chatListRepo.getChatList().then((value) {
      if (value.chats.isNotEmpty) {
        change(value, status: RxStatus.success());
      } else {
        change(null, status: RxStatus.empty());
      }
    }, onError: (err) {
      change(null, status: RxStatus.error());
    });
  }
}
