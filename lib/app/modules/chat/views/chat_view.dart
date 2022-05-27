import 'package:envo_safe/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../widget/app color/app_colors.dart';
import '../../../widget/constants.dart';
import '../../carpool/views/carpool_view.dart';
import '../controllers/chat_controller.dart';

class ChatView extends GetView<ChatController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'CHAT'),
      body: RefreshIndicator(
        onRefresh: () async {
          await controller.callGetChatListApi();
        },
        child: controller.obx(
            (state) => ListView.builder(
                  itemCount: state!.chats.length,
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      Get.toNamed(Routes.CHATING,arguments: [state.chats[index].firstUser.id != state.userId
                                  ? state.chats[index].firstUser.id
                                  : state.chats[index].secondUser.id,state.chats[index].messages,
                                  state.chats[index].firstUser.id == state.userId
                            ? state.chats[index].firstUser.id
                            : state.chats[index].secondUser.id
                                  ]);//sending chater user id
                    },
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 20.w,
                                height: 20.w,
                                child: ClipOval(
                                  child: Image.network(
                                    state.chats[index].firstUser.id !=
                                            state.userId
                                        ? state
                                            .chats[index].firstUser.profileImage
                                        : state.chats[index].secondUser
                                            .profileImage,
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            Image.asset(
                                                'assets/images/profile.png'),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      state.chats[index].firstUser.id !=
                                              state.userId
                                          ? state.chats[index].firstUser.name
                                          : state.chats[index].secondUser.name,
                                      style: titleTxtStyle),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const Divider(
                          color: appBarColor,
                        )
                      ],
                    ),
                  ),
                ),
            onEmpty: Text("No Active Chats")),
      ),
    );
  }
}
