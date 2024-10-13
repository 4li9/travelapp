import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/controller/auth/SignIn_controller.dart';
import 'package:untitled/view/widget/auth/custombuttonauth.dart';
import 'package:untitled/view/widget/auth/customtextSignuporsignin.dart';
import 'package:untitled/view/widget/auth/customtextformauth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInstate createState() => _SignInstate();
}

class _SignInstate extends State<SignIn> {
  bool _rememberMe = false; // متغير لتخزين حالة مربع الاختيار

  @override
  Widget build(BuildContext context) {
    // استدعاء عنصر التحكم الخاص بتسجيل الدخول وإدخاله في الـ GetX
    SignIn_controllerimp controller = Get.put(SignIn_controllerimp());

    return Scaffold(
      // تعريف الـ Scaffold لواجهة المستخدم
      appBar: AppBar(
        // شريط العنوان العلوي للتطبيق
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // للعودة إلى الشاشة السابقة
          },
        ),
        elevation: 0, // إزالة الظل تحت شريط العنوان
        backgroundColor:
            Colors.transparent, // تعيين خلفية شريط العنوان إلى شفاف
      ),
      body: SingleChildScrollView(
        child: Padding(
          // إضافة هوامش للـ body
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.stretch, // تمديد الأطفال لملء العرض
            children: [
              SizedBox(height: 30), // إضافة مسافة عمودية
              Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start, // محاذاة النص إلى اليسار
                children: [
                  Text(
                    'Login to your',
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'Account',
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              SizedBox(height: 40), // إضافة مسافة عمودية
              CustonTextFormAuth(
                  labeltext: "Email", // النص التوضيحي للحقل
                  iconData: Icons.email, // أيقونة البريد الإلكتروني
                  mycontroller:
                      controller.email), // عنصر التحكم لحقل البريد الإلكتروني
              SizedBox(height: 20), // إضافة مسافة عمودية
              CustomTextFormAuthPassword(
                  labelText: "password", // النص التوضيحي للحقل
                  iconData: Icons.lock, // أيقونة القفل
                  controller:
                      controller.password), // عنصر التحكم لحقل كلمة المرور
              SizedBox(height: 0),
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

              SizedBox(height: 5), // إضافة مسافة عمودية
              custombuttonauth(
                text: "Sign In", // نص الزر
                onPressed: () {
                  controller
                      .gotohome(); // الانتقال إلى الصفحة الرئيسية عند الضغط على الزر
                },
              ),
              SizedBox(height: 20), // إضافة مسافة عمودية
              customtextSignuporsignin1(
                text: "Forgot the password?",
                onTap: () {
                  controller.gotoforgetpassword();
                },
              ),
              SizedBox(height: 18), // إضافة مسافة عمودية
              Row(
                children: [
                  Expanded(child: Divider(color: Colors.grey)), // خط أفقي رمادي
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text('or continue with',
                        style: TextStyle(
                            color: const Color.fromARGB(255, 111, 111, 111))),
                  ),
                  Expanded(child: Divider(color: Colors.grey)), // خط أفقي رمادي
                ],
              ),
              SizedBox(height: 8), // إضافة مسافة عمودية
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceEvenly, // توزيع الأطفال بالتساوي
                children: [
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: IconButton(
                      icon: Image.asset(
                          'assets/images/2024_05_27_02_33_IMG_7028.PNG'), // صورة فيسبوك
                      onPressed: () {
                        _loginWithFacebook(); // استدعاء دالة تسجيل الدخول عبر فيسبوك
                      },
                    ),
                  ),
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: IconButton(
                      icon: Image.asset(
                          'assets/images/2024_05_27_02_34_IMG_7029.PNG'), // صورة جوجل
                      onPressed: () {
                        _loginWithGoogle(); // استدعاء دالة تسجيل الدخول عبر جوجل
                      },
                    ),
                  ),
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: IconButton(
                      icon: Image.asset(
                          'assets/images/2024_05_27_02_35_IMG_7030.PNG'), // صورة أبل
                      onPressed: () {
                        _loginWithApple(); // استدعاء دالة تسجيل الدخول عبر أبل
                      },
                    ),
                  ),
                ],
              ),
              customtextSignuporsignin(
                textone: "Already have an account? ", // النص الأول
                texttwo: "Sign Up", // النص الثاني القابل للضغط
                onTap: () {
                  controller
                      .gotoSignUp(); // الانتقال إلى صفحة التسجيل عند الضغط
                },
              ),
              SizedBox(height: 30), // إضافة مسافة عمودية
            ],
          ),
        ),
      ),
    );
  }

  void _loginWithFacebook() {
    // قم بإضافة الكود لتسجيل الدخول عبر فيسبوك هنا
    print('Login with Facebook');
  }

  void _loginWithGoogle() {
    // قم بإضافة الكود لتسجيل الدخول عبر جوجل هنا
    print('Login with Google');
  }

  void _loginWithApple() {
    // قم بإضافة الكود لتسجيل الدخول عبر أبل هنا
    print('Login with Apple');
  }
}
