import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelapp/controller/auth/login_controller.dart';
import 'package:travelapp/core/constant/colore.dart';
import 'package:travelapp/view/widget/auth/custombuttonauth.dart';
import 'package:travelapp/view/widget/auth/logoauth.dart';
import 'package:travelapp/view/widget/auth/customtextSignuporsignin.dart';

class login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    login_controllerimp controller = Get.put(login_controllerimp());

    // الحصول على أبعاد الشاشة
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.05), // 5% من عرض الشاشة
        child: SingleChildScrollView(
          // استخدام ScrollView لتفادي مشاكل المساحة في الشاشات الصغيرة
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                  height: screenHeight * 0.05), // مسافة 5% من ارتفاع الشاشة
              logoauth(),
              const Center(
                child: Text(
                  "Let's you in",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                  height: screenHeight * 0.02), // مسافة 2% من ارتفاع الشاشة
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  foregroundColor: AppColor.primaryColor,
                  backgroundColor: AppColor.waith,
                  side: const BorderSide(
                      color: Color.fromARGB(255, 222, 222, 222)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: EdgeInsets.symmetric(
                      vertical: screenHeight *
                          0.02), // padding بناءً على ارتفاع الشاشة
                ),
                onPressed: () {},
                icon: const Icon(Icons.facebook, color: Colors.blue),
                label: const Text('Continue with Facebook'),
              ),
              SizedBox(
                  height: screenHeight * 0.02), // مسافة 2% من ارتفاع الشاشة
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.white,
                  side: const BorderSide(
                      color: Color.fromARGB(255, 222, 222, 222)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: EdgeInsets.symmetric(
                      vertical: screenHeight *
                          0.02), // padding بناءً على ارتفاع الشاشة
                ),
                onPressed: () {},
                icon: const Icon(Icons.g_mobiledata, color: Colors.red),
                label: const Text('Continue with Google'),
              ),
              SizedBox(height: screenHeight * 0.02),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.white,
                  side: const BorderSide(
                      color: Color.fromARGB(255, 222, 222, 222)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: EdgeInsets.symmetric(
                      vertical: screenHeight *
                          0.02), // padding بناءً على ارتفاع الشاشة
                ),
                onPressed: () {},
                icon: const Icon(Icons.apple, color: Colors.black),
                label: const Text('Continue with Apple'),
              ),
              SizedBox(
                  height: screenHeight * 0.04), // مسافة 4% من ارتفاع الشاشة
              const Row(
                children: [
                  Expanded(child: Divider(color: Colors.grey)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text('or', style: TextStyle(color: AppColor.grey)),
                  ),
                  Expanded(child: Divider(color: Colors.grey)),
                ],
              ),
              SizedBox(
                  height: screenHeight * 0.02), // مسافة 2% من ارتفاع الشاشة
              custombuttonauth(
                text: "Sing in with password",
                onPressed: () {
                  controller.gotoSignIn();
                },
              ),
              SizedBox(
                  height: screenHeight * 0.02), // مسافة 2% من ارتفاع الشاشة
              customtextSignuporsignin(
                textone: "Already have an account? ",
                texttwo: "Sign Up",
                onTap: () {
                  controller.gotoSignUp();
                },
              ),
              SizedBox(height: screenHeight * 0.02), // مسافة أخيرة
            ],
          ),
        ),
      ),
    );
  }
}
