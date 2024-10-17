import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelapp/controller/auth/forgetpassword_controller.dart';
import 'package:travelapp/view/widget/auth/custombuttonauth.dart';

class ForgetPassword extends StatefulWidget {
  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    ForgetPasswordControllerImp controller =
        Get.put(ForgetPasswordControllerImp());

    // الحصول على أبعاد الشاشة
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Forgot Password',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.05), // هامش جانبي بناءً على عرض الشاشة
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                'assets/images/2024_06_01_16_52_IMG_7070.JPG', // تأكد من أن الملف موجود في مجلد assets
                height:
                    screenHeight * 0.3, // جعل الصورة تأخذ نسبة من ارتفاع الشاشة
              ),
            ),
            SizedBox(
                height: screenHeight * 0.03), // مسافة بناءً على ارتفاع الشاشة
            Text(
              'Select which contact details should we use to reset your password',
              style: TextStyle(
                  fontSize:
                      screenHeight * 0.022), // حجم النص بناءً على ارتفاع الشاشة
            ),
            SizedBox(
                height: screenHeight * 0.03), // مسافة بناءً على ارتفاع الشاشة
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedOption = 'sms';
                });
              },
              child: ContactOption(
                icon: Icons.sms,
                contactType: 'via SMS:',
                contactDetail: '',
                isSelected: selectedOption == 'sms',
              ),
            ),
            SizedBox(height: screenHeight * 0.02), // مسافة بين الخيارات
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedOption = 'email';
                });
              },
              child: ContactOption(
                icon: Icons.email,
                contactType: 'via Email:',
                contactDetail: '',
                isSelected: selectedOption == 'email',
              ),
            ),
            Spacer(),
            custombuttonauth(
              text: "Continue",
              onPressed: selectedOption != null
                  ? () {
                      if (selectedOption == 'sms') {
                        controller.goToCheck_Phone();
                      } else if (selectedOption == 'email') {
                        controller.goToChik_Email();
                      }
                    }
                  : null,
            ),
            SizedBox(height: screenHeight * 0.02), // مسافة أخيرة لتفادي التلاصق
          ],
        ),
      ),
    );
  }

  SmsPage() {}

  EmailPage() {}
}

class ContactOption extends StatelessWidget {
  final IconData icon;
  final String contactType;
  final String contactDetail;
  final bool isSelected;

  ContactOption({
    required this.icon,
    required this.contactType,
    required this.contactDetail,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    // استخدام MediaQuery لضبط الحجم
    var screenHeight = MediaQuery.of(context).size.height;

    return Container(
      padding: EdgeInsets.all(
          screenHeight * 0.02), // padding بناءً على ارتفاع الشاشة
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue.shade50 : Colors.white,
        borderRadius: BorderRadius.circular(10),
        border:
            Border.all(color: isSelected ? Colors.blue : Colors.grey.shade300),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey.shade200,
            child: Icon(icon, color: Colors.black),
          ),
          SizedBox(
              width: screenHeight *
                  0.02), // مسافة بين الأيقونة والنص بناءً على ارتفاع الشاشة
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(contactType,
                  style: TextStyle(
                      color: Colors.grey, fontSize: screenHeight * 0.02)),
              Text(contactDetail,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: screenHeight * 0.02)),
            ],
          ),
        ],
      ),
    );
  }
}
