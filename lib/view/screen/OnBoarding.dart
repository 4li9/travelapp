import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelapp/controller/onboarding_controller.dart';
import 'package:travelapp/data/datasorce/static/static.dart';
import 'package:travelapp/view/widget/onboarding/custombutton.dart';
import 'package:travelapp/view/widget/onboarding/customslider.dart';
import 'package:travelapp/view/widget/onboarding/dotcontroller.dart';

class OnBoarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            // جزء عرض الصور في الخلفية
            CustomSliderOnBoarding(),

            // النص يظهر في وسط الشاشة أفقيًا وقريبًا من الجانب الأيمن
            Positioned(
              top: MediaQuery.of(context).size.height *
                  .6, // تقريبًا في منتصف الشاشة عموديًا
              right: 20, // قريب من الجانب الأيمن للشاشة
              child: GetBuilder<OnBoardingControllerImp>(
                builder: (controller) => Text(
                  OnBoardinglist[controller.currentPage].body!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white, // لون النص
                    fontSize: 38,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            // جزء الزر والمؤشر فوق الصورة
            Positioned(
              bottom: 30,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  CustomDotControllerOnBoarding(),
                  const SizedBox(height: 20),
                  CustomButtonOnBoarding(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
