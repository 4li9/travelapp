import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelapp/core/constant/routes.dart';

abstract class SignIn_controller extends GetxController {
  SignIn();
  gotoSignUp();
  gotohome();
  gotoforgetpassword();
}

class SignIn_controllerimp extends SignIn_controller {
  late TextEditingController email;
  late TextEditingController password;
  @override
  SignIn() {}

  @override
  gotoSignUp() {
    Get.toNamed(AppRoute.SignUp);
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  gotohome() {
    Get.toNamed(AppRoute.home);
  }

  @override
  gotoforgetpassword() {
    Get.toNamed(AppRoute.forgetPassword);
  }
}
