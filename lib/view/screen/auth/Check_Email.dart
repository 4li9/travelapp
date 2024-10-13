import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/controller/auth/CheckEmail_controller.dart';
import 'package:untitled/view/widget/auth/custombuttonauth.dart';
import 'package:untitled/view/widget/auth/customtextformauth.dart';

class Check_Email extends StatefulWidget {
  @override
  _Check_Emailstate createState() => _Check_Emailstate();
}

class _Check_Emailstate extends State<Check_Email> {
  @override
  Widget build(BuildContext context) {
   CheckEmailControllerImp controller = Get.put(
        CheckEmailControllerImp()); // استدعاء عنصر التحكم الخاص بتسجيل الدخول وإدخاله في الـ GetX

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
                    'Chik Email',
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'Code',
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              SizedBox(height: 40), // إضافة مسافة عمودية
              CustonTextFormAuth(
                  labeltext: "Enter your Email", // النص التوضيحي للحقل
                  iconData: Icons.email, // أيقونة البريد الإلكتروني
                  mycontroller:
                      controller.email), // عنصر التحكم لحقل البريد الإلكتروني
              SizedBox(height: 20), // إضافة مسافة عمودية

              custombuttonauth(
                text: "Connect", // نص الزر
                onPressed: () {
                  controller
                      .goToverifycodeEmail(); // الانتقال إلى الصفحة الرئيسية عند الضغط على الزر
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
