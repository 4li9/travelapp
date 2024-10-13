import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelapp/controller/onboarding_controller.dart';
import 'package:travelapp/core/constant/colore.dart';
import 'package:travelapp/data/datasorce/static/static.dart';



class CustomDotControllerOnBoarding extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(
        builder: (controller) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                    OnBoardinglist.length,
                    (index) => AnimatedContainer(
                          margin: const EdgeInsets.only(right: 5),
                          duration: const Duration(milliseconds: 900),
                          width: controller.currentPage == index ? 20 : 5,
                          height: 6,
                          decoration: BoxDecoration(
                              color: AppColor.primaryColor,
                              borderRadius: BorderRadius.circular(10)),
                        ))
              ],
            ));
  }
}