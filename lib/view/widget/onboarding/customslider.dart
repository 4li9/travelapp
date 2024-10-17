import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelapp/controller/onboarding_controller.dart';
import 'package:travelapp/core/constant/colore.dart';
import 'package:travelapp/data/datasorce/static/static.dart';
import 'package:travelapp/view/widget/onboarding/custombutton.dart';
import 'package:travelapp/view/widget/onboarding/dotcontroller.dart';

class CustomSliderOnBoarding extends GetView<OnBoardingControllerImp> {
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: controller.pageController,
        onPageChanged: (val) {
          controller.onPageChanged(val);
        },
        itemCount: OnBoardinglist.length,
        itemBuilder: (context, i) => Image.asset(
              OnBoardinglist[i].image!,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover, // لجعل الصورة تغطي الشاشة بالكامل
            ));
  }
}
