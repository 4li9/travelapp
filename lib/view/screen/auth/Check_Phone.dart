import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelapp/controller/auth/CheckPhone_controller.dart';
import 'package:travelapp/view/widget/auth/custombuttonauth.dart';
import 'package:travelapp/view/widget/auth/customtextformauth.dart';

class Check_Phone extends StatefulWidget {
  @override
  _Check_Phonestate createState() => _Check_Phonestate();
}

class _Check_Phonestate extends State<Check_Phone> {
  @override
  Widget build(BuildContext context) {
    CheckPhoneControllerImp controller = Get.put(
        CheckPhoneControllerImp()); // استدعاء عنصر التحكم الخاص بتسجيل الدخول وإدخاله في الـ GetX

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
                  labeltext: "Enter your Phone Number", // النص التوضيحي للحقل
                  iconData: Icons.phone, // أيقونة البريد الإلكتروني
                  mycontroller:
                      controller.Phone), // عنصر التحكم لحقل البريد الإلكتروني
              SizedBox(height: 20), // إضافة مسافة عمودية

              custombuttonauth(
                text: "Connect", // نص الزر
                onPressed: () {
                  controller
                      .goToverifycodePhone(); // الانتقال إلى الصفحة الرئيسية عند الضغط على الزر
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
