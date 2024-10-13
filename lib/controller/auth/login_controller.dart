import 'package:get/get.dart';
import 'package:untitled/core/constant/routes.dart';

abstract class login_controller extends GetxController {
  login();
  gotoSignUp();
  gotoSignIn();
}

class login_controllerimp extends login_controller {
  @override
  login() {}

  @override
  gotoSignUp() {
    Get.toNamed(AppRoute.SignUp);
  }

  @override
  gotoSignIn() {
    Get.toNamed(AppRoute.SignIn);
  }
}
