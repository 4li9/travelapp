import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:travelapp/controller/auth/resetpassword_controller.dart';
import 'package:travelapp/view/widget/auth/custombuttonauth.dart';
import 'package:travelapp/view/widget/auth/customtextformauth.dart';

class ResetPassword extends StatefulWidget {
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    ResetPasswordControllerImp controller =
        Get.put(ResetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Create New Password',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Image.asset(
                'assets/images/2024_06_01_16_53_IMG_7071.JPG', // تأكد من أنك قمت بإضافة الصورة إلى مجلد assets
                height: 200,
              ),
              SizedBox(height: 20),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Create Your New Password',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20),
              CustomTextFormAuthPassword(
                labelText: "New Password",
                iconData: Icons.lock,
                controller: controller.password,
              ),
              SizedBox(height: 20),
              CustomTextFormAuthPassword(
                  labelText: "Confirm Password",
                  iconData: Icons.lock,
                  controller: controller.repassword),
              SizedBox(height: 20),
              Row(
                children: [
                  Transform.scale(
                    scale: 1.2, // تكبير مربع الاختيار
                    child: Checkbox(
                      value: _rememberMe,
                      activeColor:
                          Colors.black, // تغيير لون علامة الصح إلى الأسود
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            7), // جعل حواف مربع الاختيار منحنية
                      ),
                      onChanged: (bool? newValue) {
                        setState(() {
                          _rememberMe = newValue!; // تحديث حالة مربع الاختيار
                        });
                      },
                    ),
                  ),
                  Text('Remember me'),
                ],
              ),
              SizedBox(height: 40),
              custombuttonauth(
                  text: "Continue",
                  onPressed: () {
                    _showSuccessDialog();
                  })
            ],
          ),
        ),
      ),
    );
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      barrierDismissible: false, // لا يمكن إغلاق الحوار بالضغط خارج النافذة
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Container(
            padding: EdgeInsets.all(20.0),
            height: 450.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/2024_06_04_04_16_IMG_7120.PNG', // تأكد من أنك قمت بإضافة الصورة إلى مجلد assets
                  height: 150,
                ),
                SizedBox(height: 20),
                const Text(
                  'Congratulations!',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                const Text(
                  'Your account is ready to use. You will be redirected to the Home page in a few seconds.',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                // استخدام Lottie لعرض الرسوم المتحركة
                Lottie.asset(
                  'assets/images/loding.json', // تأكد من أن ملف الرسوم المتحركة موجود في مجلد assets
                  height: 50,
                ),
              ],
            ),
          ),
        );
      },
    );

    // يمكن إغلاق النافذة بعد مدة معينة
    Future.delayed(Duration(seconds: 5), () {
      Navigator.of(context).pop();
    });
  }
}
