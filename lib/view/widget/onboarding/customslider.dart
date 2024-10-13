import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelapp/controller/onboarding_controller.dart';
import 'package:travelapp/core/constant/colore.dart';
import 'package:travelapp/data/datasorce/static/static.dart';

class CustomSliderOnBoarding extends GetView<OnBoardingControllerImp> {

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller:controller.pageController,
      onPageChanged: (val){
        controller.onPageChanged(val) ; 
      },
        itemCount: OnBoardinglist.length,
        itemBuilder: (context, i) => Column(
              children: [
                Text(OnBoardinglist[i].body!,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20)),
                const SizedBox(height: 80),
                Image.asset(
                  OnBoardinglist[i].image!,
                  width: 200,
                  height: 230,
                  fit: BoxFit.fill,
                ),
                const SizedBox(height: 80),
                Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Text(
                      OnBoardinglist[i].body!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          height: 2,
                          color: AppColor.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    )),
              ],
            ));
  }
}