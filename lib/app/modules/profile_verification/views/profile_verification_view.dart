import 'package:envo_safe/app/modules/profile_verification/widgets/not_verified_widget.dart';
import 'package:envo_safe/app/modules/profile_verification/widgets/verified_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_verification_controller.dart';

class ProfileVerificationView extends GetView<ProfileVerificationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text('Profile Verification Status'),
        centerTitle: true,
      ),
      body: controller.obx(
        (state)=> Center(
            child:
                state! ? VerifiedWidget() : NotVerifiedWidget()),
      ),
    );
  }
}
