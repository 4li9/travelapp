import 'package:get/get.dart';
import 'package:travelapp/core/constant/routes.dart';

abstract class verifycodePhoneController extends GetxController {
  verifycodePhone();
  goToResetPassword();
}

class verifycodePhoneControllerImp extends verifycodePhoneController {
  @override
  verifycodePhone() {}

  @override
  goToResetPassword() {
    Get.toNamed(AppRoute.ResetPassword);
  }

  @override
  void onInit() {
    super.onInit();
  }
}
