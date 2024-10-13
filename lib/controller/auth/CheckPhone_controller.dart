import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelapp/core/constant/routes.dart';

abstract class CheckPhoneController extends GetxController {
  Check_Phone();
  goToverifycodePhone();
}

class CheckPhoneControllerImp extends CheckPhoneController {
  late TextEditingController Phone;

  @override
  Check_Phone() {}

  @override
  goToverifycodePhone() {
    Get.offNamed(AppRoute.verifycodePhone);
  }

  @override
  void onInit() {
    Phone = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    Phone.dispose();
    super.dispose();
  }
}
