import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelapp/core/constant/routes.dart';
import 'package:travelapp/core/localization/changelocal.dart';
import 'package:travelapp/view/widget/language/custombuttomlang.dart';

class Language extends GetView<LocaleController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("1".tr, style: Theme.of(context).textTheme.displayLarge),
              SizedBox(height: 20),
              CustomButtonLang(
                  textbutton: "Ar",
                  onPressed: () {
                    controller.changeLang("ar");
                    Get.toNamed(AppRoute.onbording);
                  }),
              CustomButtonLang(
                  textbutton: "En",
                  onPressed: () {
                    controller.changeLang("en");
                    Get.toNamed(AppRoute.onbording);
                  }),
            ],
          )),
    );
  }
}
