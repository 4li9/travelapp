import 'package:get/get.dart';
import 'package:travelapp/core/constant/routes.dart';

abstract class SpecialOffers_Controller extends GetxController {
  home();
  goToMy_Wishlist();
  gotoNotifications();
  gotoSpecial_Offers();
}

class SpecialOffers_ControllerImp extends SpecialOffers_Controller {
  @override
  home() {}

  @override
  goToMy_Wishlist() {
    Get.toNamed(AppRoute.My_Wiishlist);
  }

  @override
  gotoNotifications() {
    Get.toNamed(AppRoute.Notifications);
  }

  @override
  gotoSpecial_Offers() {
    Get.toNamed(AppRoute.Special_Offers);
  }
}
