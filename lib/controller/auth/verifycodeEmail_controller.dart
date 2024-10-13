import 'package:get/get.dart';
import 'package:travelapp/core/constant/routes.dart';

abstract class verifycodeEmailController extends GetxController {
  verifycodeEmail();
  goToResetPassword();
}

class verifycodeEmailControllerImp extends verifycodeEmailController {
  @override
  verifycodeEmail() {}

  @override
  goToResetPassword() {
    Get.toNamed(AppRoute.ResetPassword);
  }

  @override
  void onInit() {
    super.onInit();
  }
}
