
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:izi_app/commons/extensions/space.dart';

import 'controller.dart';

class ProfilePage extends GetView<ProfileController> {
  ProfilePage({super.key});

  final _textTheme = Get.textTheme;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             
              120.verticalSpace,
            ],
          ).paddingSymmetric(horizontal: 16),
        ),
      ),
    );
  }

}
