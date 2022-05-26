import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/chating_controller.dart';

class ChatingView extends GetView<ChatingController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          title: Text('Chat'),
          centerTitle: true,
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(child: StreamBuilder<>(
              stream: null,
              builder: (context, snapshot) {
                return ListView.builder(itemBuilder: ());
              }
            )),
            Align(
              alignment: Alignment.bottomCenter,
              child: TextField(
                controller: controller.message,
                decoration: InputDecoration(suffixIcon: Icon(Icons.send)),
              ),
            )
          ],
        ));
  }
}
