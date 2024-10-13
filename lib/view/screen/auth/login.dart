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
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
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
            SizedBox(height: 15),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                foregroundColor: AppColor.primaryColor,
                backgroundColor: AppColor.waith,
                side: BorderSide(color: Color.fromARGB(255, 222, 222, 222)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: EdgeInsets.symmetric(vertical: 12),
              ),
              onPressed: () {},
              icon: Icon(Icons.facebook, color: Colors.blue),
              label: Text('Continue with Facebook'),
            ),
            SizedBox(height: 15),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Colors.white,
                side: BorderSide(color: Color.fromARGB(255, 222, 222, 222)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: EdgeInsets.symmetric(vertical: 12),
              ),
              onPressed: () {},
              icon: Icon(Icons.g_mobiledata, color: Colors.red),
              label: Text('Continue with Google'),
            ),
            SizedBox(height: 15),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Colors.white,
                side: BorderSide(color: Color.fromARGB(255, 222, 222, 222)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: EdgeInsets.symmetric(vertical: 12),
              ),
              onPressed: () {},
              icon: Icon(Icons.apple, color: Colors.black),
              label: Text('Continue with Apple'),
            ),
            SizedBox(height: 30),
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
            const SizedBox(height: 5),
            custombuttonauth(
              text: "Sing in with password",
              onPressed: () {
                controller.gotoSignIn();
              },
            ),
            const SizedBox(height: 16),
            customtextSignuporsignin(
              textone: "Already have an account? ",
              texttwo: "Sign Up",
              onTap: () {
                controller.gotoSignUp();
              },
            )
          ],
        ),
      ),
    );
  }
}
