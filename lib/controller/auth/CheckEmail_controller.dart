import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/core/constant/routes.dart';

abstract class CheckEmailController extends GetxController {
  CheckEmail();
  goToverifycodeEmail();
}

class CheckEmailControllerImp extends CheckEmailController {
  late TextEditingController email;

  @override
  CheckEmail() {}

  @override
  goToverifycodeEmail() {
    Get.offNamed(AppRoute.verifycodeEmail);
  }

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}
