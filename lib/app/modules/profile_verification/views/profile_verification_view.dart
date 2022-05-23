import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_verification_controller.dart';

class ProfileVerificationView extends GetView<ProfileVerificationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ProfileVerificationView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ProfileVerificationView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
