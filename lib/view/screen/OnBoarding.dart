import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/controller/onboarding_controller.dart';
import 'package:untitled/view/widget/onboarding/custombutton.dart';
import 'package:untitled/view/widget/onboarding/customslider.dart';
import 'package:untitled/view/widget/onboarding/dotcontroller.dart';

class OnBoarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(children: [
            Expanded(
              flex: 3,
              child: CustomSliderOnBoarding(),
            ),
            Expanded(
                flex: 1,
                child: Column(
                  children: [
                    CustomDotControllerOnBoarding(),
                    Spacer(flex: 2),
                    CustomButtonOnBoarding()
                  ],
                ))
          ]),
        ));
  }
}
