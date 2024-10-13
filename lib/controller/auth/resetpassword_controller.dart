import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelapp/core/constant/routes.dart';

abstract class ResetPasswordController extends GetxController {
  resetpassword();
  goToSuccessResetPassword();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  late TextEditingController password;
  late TextEditingController repassword;

  @override
  resetpassword() {}

  @override
  goToSuccessResetPassword() {
    Get.offNamed(AppRoute.ResetPassword);
  }

  @override
  void onInit() {
    password = TextEditingController();
    repassword = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    repassword.dispose();
    super.dispose();
  }
}
