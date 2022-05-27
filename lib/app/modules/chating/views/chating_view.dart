import 'package:envo_safe/app/modules/chat/controllers/chat_controller.dart';
import 'package:envo_safe/app/widget/app%20color/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controllers/chating_controller.dart';

class ChatingView extends GetView<ChatingController> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.find<ChatController>().callGetChatListApi();
        return true;
      },
      child: Scaffold(
          appBar: AppBar(
            foregroundColor: Colors.white,
            title: Text('Chat'),
            centerTitle: true,
          ),
          body: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Obx(() => ListView.builder(
                    controller: controller.listScrollController,
                    itemCount: controller.messages.length,
                    itemBuilder: (context, index) {
                      var msg = controller.messages[index];
                      if (msg.sender == controller.chaterId) {
                        return Align(
                          alignment: Alignment.centerLeft,
                          child: ChatBubble(
                            text: msg.message,
                          ),
                        );
                      } else {
                        return Align(
                          alignment: Alignment.centerRight,
                          child: ChatBubble(
                            text: msg.message,
                          ),
                        );
                      }
                    })),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: .5.h, horizontal: 2.5.w),
                  child: TextField(
                    controller: controller.input,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                      icon: Icon(Icons.send),
                      onPressed: () {
                        if (controller.input.text != "") {
                          controller.sendMessage();
                        }
                      },
                    )),
                  ),
                ),
              )
            ],
          )),
    );
  }
}

class ChatBubble extends StatelessWidget {
  const ChatBubble({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.sp),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.sp),
          color: appBarColor.withOpacity(0.4),
        ),
        child: Padding(
          padding: EdgeInsets.all(6.sp),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 15.sp,
            ),
          ),
        ),
      ),
    );
  }
}
