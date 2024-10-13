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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                'assets/images/2024_06_01_16_52_IMG_7070.JPG', // تأكد من أنك قد أضفت الملف الصحيح في مجلد assets
                height: 230,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Select which contact details should we use to reset your password',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
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
            SizedBox(height: 20),
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
            )
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
    return Container(
      padding: EdgeInsets.all(16),
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
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(contactType, style: TextStyle(color: Colors.grey)),
              Text(contactDetail,
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }
}
