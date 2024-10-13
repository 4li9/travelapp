import 'dart:io'; // مكتبة dart.io لاستخدام File.
import 'package:flutter/material.dart'; // مكتبة Flutter لبناء واجهة المستخدم.
import 'package:get/get.dart'; // مكتبة GetX لإدارة الحالة والتنقل.
import 'package:image_picker/image_picker.dart'; // مكتبة ImagePicker لاختيار الصور.
import 'package:intl_phone_number_input/intl_phone_number_input.dart'; // مكتبة IntlPhoneNumberInput لاختيار رقم الهاتف الدولي.
import 'package:untitled/controller/auth/SignUp_controller.dart'; // استيراد SignUp_controllerimp.
import 'package:untitled/core/constant/colore.dart';
import 'package:untitled/view/widget/auth/custombuttonauth.dart'; // استيراد custombuttonauth widget.
import 'package:untitled/view/widget/auth/customtextformauth.dart'; // استيراد customtextformauth widget.

// ignore: must_be_immutable
class SignUp extends StatelessWidget {
  final ImagePicker _imagePicker = ImagePicker(); // إنشاء مثيل من ImagePicker.
  final TextEditingController phoneNumberController =
      TextEditingController(); // وحدة التحكم في النص لرقم الهاتف.
  PhoneNumber initialPhoneNumber =
      PhoneNumber(isoCode: 'US'); // تعيين رمز الدولة الافتراضي.

  SignUp({super.key}); // مُنشئ للصفحة.

  Future<void> _pickImage() async {
    // دالة لاختيار صورة من المعرض.
    final XFile? pickedImage = await _imagePicker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedImage != null) {
      // إذا تم اختيار صورة.
      SignUp_controllerimp controller = Get.find();
      controller.profileImage.value = pickedImage; // تعيين الصورة الملتقطة.
    }
  }

  @override
  Widget build(BuildContext context) {
    SignUp_controllerimp controller =
        Get.put(SignUp_controllerimp()); // الحصول على المثيل المتحكم في الحالة.

    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            const Color.fromARGB(0, 255, 255, 255), // تعيين لون خلفية شفاف.
        elevation: 0, // تعيين ارتفاع الظل إلى 0.
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black), // زر الرجوع.
          onPressed: () {
            Navigator.pop(context); // الرجوع إلى الشاشة السابقة.
          },
        ),
        title: const Text(
          'Fill Your Profile', // عنوان الصفحة.
          style: TextStyle(color: Colors.black), // نمط النص.
        ),
        centerTitle: true, // توسيط العنوان.
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0), // إضافة حواف.
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.stretch, // تمديد العناصر لتملأ العرض.
            children: [
              const SizedBox(height: 16), // مسافة عمودية.
              Center(
                child: Stack(
                  alignment: Alignment
                      .bottomRight, // محاذاة الأيقونة في الأسفل إلى اليمين.
                  children: [
                    Obx(
                      () {
                        // ملاحظة التغيرات في profileImage.
                        final profileImage = controller.profileImage
                            .value; // الحصول على قيمة profileImage.
                        return CircleAvatar(
                          radius: 50, // تعيين نصف القطر.
                          backgroundColor:
                              Colors.grey[300], // تعيين لون الخلفية.
                          backgroundImage: profileImage != null
                              ? FileImage(File(profileImage.path))
                                  as ImageProvider<Object>? // تعيين صورة الملف.
                              : const AssetImage(
                                  'assets/images/2024_06_01_15_33_IMG_7065.PNG', // تعيين صورة افتراضية.
                                ),
                        );
                      },
                    ),
                    CircleAvatar(
                      radius: 16, // تعيين نصف القطر.
                      backgroundColor:
                          AppColor.primaryColor, // تعيين لون الخلفية.
                      child: IconButton(
                        icon: const Icon(Icons.edit,
                            size: 16, color: Colors.white), // أيقونة التعديل.
                        onPressed:
                            _pickImage, // استدعاء دالة اختيار الصورة عند الضغط.
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32), // مسافة عمودية.
              Column(
                crossAxisAlignment:
                    CrossAxisAlignment.stretch, // تمديد العناصر لتملأ العرض.
                children: [
                  CustonTextFormAuth(
                    labeltext: "Full Name", // تسمية الحقل.
                    iconData: Icons.person_outline, // أيقونة الحقل.
                    mycontroller: controller.username, // وحدة التحكم في النص.
                  ),
                  const SizedBox(height: 10), // مسافة عمودية.
                  TextField(
                    decoration: InputDecoration(
                      filled: true, // تعبئة الخلفية.
                      fillColor: Colors.grey[100], // لون الخلفية.
                      floatingLabelBehavior:
                          FloatingLabelBehavior.auto, // سلوك التسمية العائمة.
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 30), // حشوة المحتوى.
                      label: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 5), // حشوة التسمية.
                        child: const Text("Nickname"), // تسمية الحقل.
                      ),
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(15), // نصف القطر للزوايا.
                        borderSide: BorderSide.none, // بدون حافة.
                      ),
                    ),
                  ),
                  const SizedBox(height: 10), // مسافة عمودية.
                  CustonTextFormAuth(
                    labeltext: "Date of Birth", // تسمية الحقل.
                    iconData: Icons.calendar_today, // أيقونة الحقل.
                    mycontroller: controller.birth, // وحدة التحكم في النص.
                  ),
                  const SizedBox(height: 10), // مسافة عمودية.
                  CustonTextFormAuth(
                    labeltext: "Email", // تسمية الحقل.
                    iconData: Icons.email, // أيقونة الحقل.
                    mycontroller: controller.email, // وحدة التحكم في النص.
                  ),
                  const SizedBox(height: 10), // مسافة عمودية.
                  InternationalPhoneNumberInput(
                    onInputChanged: (PhoneNumber number) {
                      print(number
                          .phoneNumber); // يمكنك استخدام هذه القيمة حسب الحاجة
                    },
                    selectorConfig: const SelectorConfig(
                      selectorType:
                          PhoneInputSelectorType.BOTTOM_SHEET, // نوع محدد الدول
                      showFlags: true, // عرض أعلام الدول
                      useEmoji: true, // استخدام الرموز التعبيرية للأعلام
                    ),
                    searchBoxDecoration: const InputDecoration(
                      filled: true,
                      fillColor: Color.fromARGB(255, 245, 245, 245),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                      label: Text("Search Country..."),
                      suffixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide.none,
                      ), // تسمية الحقل.
                    ),
                    ignoreBlank: false,
                    autoValidateMode: AutovalidateMode.disabled,
                    selectorTextStyle: const TextStyle(color: Colors.black),
                    initialValue: initialPhoneNumber,
                    textFieldController: phoneNumberController,
                    formatInput: false,
                    keyboardType: const TextInputType.numberWithOptions(
                        signed: true, decimal: true),
                    inputDecoration: InputDecoration(
                      labelText: '   Phone Number', // تسمية الحقل.
                      filled: true, // تعبئة الخلفية.
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 5), // حشوة المحتوى.
                      fillColor: Colors.grey[100], // لون الخلفية.
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(15), // نصف القطر للزوايا.
                        borderSide: BorderSide.none, // بدون حافة.
                      ),
                    ),
                    onSaved: (PhoneNumber number) {
                      print('On Saved: $number');
                    },
                  ),
                  const SizedBox(height: 10), // مسافة عمودية.
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      filled: true, // تعبئة الخلفية.
                      labelText: '     Gender', // تسمية الحقل.
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(15), // نصف القطر للزوايا.
                        borderSide: BorderSide.none, // بدون حافة.
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 5), // حشوة المحتوى.
                      fillColor: Colors.grey[100], // لون الخلفية.
                    ),
                    items: ['     Male', '     Female', '     Other']
                        .map((String category) {
                      // العناصر في القائمة المنسدلة.
                      return DropdownMenuItem(
                        value: category,
                        child: Text(category), // عرض العنصر.
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      // فعل اختيار النوع.
                    },
                  ),
                  const SizedBox(height: 32), // مسافة عمودية.
                  custombuttonauth(
                    text: "content", // نص الزر.
                    onPressed: () {
                      controller.gotoForgetPasswordSignUp();
                    }, // فعل الضغط على الزر.
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
