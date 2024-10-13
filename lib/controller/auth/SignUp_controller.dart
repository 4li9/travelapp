import 'package:flutter/material.dart'; // استيراد مكتبة Flutter لبناء واجهة المستخدم.
import 'package:get/get.dart'; // استيراد مكتبة GetX لإدارة الحالة والتنقل.
import 'package:image_picker/image_picker.dart'; // استيراد مكتبة ImagePicker لاختيار الصور.
import 'package:travelapp/core/constant/routes.dart'; // استيراد مسارات التطبيق من ملف constant/routes.dart.

// تعريف فئة مجردة للتحكم بعملية تسجيل الدخول
abstract class SignUp_controller extends GetxController {
  SignUp(); // دالة مجردة لعملية تسجيل الدخول
  gotoForgetPasswordSignUp(); // دالة مجردة للانتقال إلى الصفحة الرئيسية
}

// تعريف فئة تنفيذية لفئة SignUp_controller
class SignUp_controllerimp extends SignUp_controller {
  late TextEditingController username; // تعريف وحدة تحكم النص لحقل اسم المستخدم
  late TextEditingController email; // تعريف وحدة تحكم النص لحقل البريد الإلكتروني
  late TextEditingController birth; // تعريف وحدة تحكم النص لحقل تاريخ الميلاد
  late TextEditingController password; // تعريف وحدة تحكم النص لحقل كلمة المرور

  // تعريف متغير تفاعلي لصورة الملف الشخصي باستخدام Rx من GetX
  var profileImage = Rx<XFile?>(null);

  @override
  SignUp() {} // تنفيذ دالة تسجيل الدخول بدون محتوى

  @override
  gotoForgetPasswordSignUp() {
    Get.toNamed(AppRoute
        .forgetPassword); // الانتقال إلى صفحة تسجيل الدخول باستخدام المسار المحدد
  }

  @override
  void onInit() {
    // تهيئة وحدات تحكم النص عند إنشاء الكائن
    email = TextEditingController();
    password = TextEditingController();
    birth = TextEditingController();
    username = TextEditingController();
    super.onInit(); // استدعاء الدالة الأصلية onInit من GetxController
  }

  @override
  void dispose() {
    // التخلص من وحدات تحكم النص عند التخلص من الكائن
    username.dispose();
    email.dispose();
    birth.dispose();
    password.dispose();
    super.dispose(); // استدعاء الدالة الأصلية dispose من GetxController
  }
}
