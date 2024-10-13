import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelapp/core/constant/routes.dart';

abstract class ForgetPasswordController extends GetxController {
  ForgetPassword();
  goToChik_Email();
  goToCheck_Phone();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  @override
  ForgetPassword() {}

  @override
  goToChik_Email() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.toNamed(AppRoute.Chik_Email);
    });
  }

  @override
  goToCheck_Phone() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.toNamed(AppRoute.Check_Phone);
    });
  }
}
