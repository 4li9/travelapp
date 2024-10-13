import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:untitled/controller/auth/verifycodeEmail_controller.dart';
import 'package:untitled/view/widget/auth/custombuttonauth.dart';

class verifycodeEmail extends StatefulWidget {
  @override
  _verifycodeEmailState createState() => _verifycodeEmailState();
}

class _verifycodeEmailState extends State<verifycodeEmail> {
  TextEditingController textEditingController = TextEditingController();
  int _resendCodeTimer = 55; // 55 seconds for the initial timer
  bool _isTimerRunning = true;

  @override
  void initState() {
    super.initState();
    _startResendCodeTimer();
  }

  void _startResendCodeTimer() {
    Future.delayed(Duration(seconds: 1), () {
      if (_isTimerRunning && _resendCodeTimer > 0) {
        setState(() {
          _resendCodeTimer--;
        });
        _startResendCodeTimer();
      }
    });
  }

  @override
  void dispose() {
    _isTimerRunning = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    verifycodeEmailControllerImp controller = Get.put(verifycodeEmailControllerImp());
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Text(
              'Code has been sent to and***ley@yourdomain.com',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            PinCodeTextField(
              appContext: context,
              length: 4,
              obscureText: false,
              animationType: AnimationType.fade,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(10),
                fieldHeight: 50,
                fieldWidth: 70,
                activeFillColor: Colors.grey[100],
                inactiveFillColor: Colors.grey[100],
                selectedFillColor: Colors.grey[100],
                inactiveColor: Colors.grey.shade300,
                activeColor: Colors.black,
                selectedColor: Colors.black,
              ),
              animationDuration: Duration(milliseconds: 300),
              backgroundColor: Colors.transparent,
              enableActiveFill: true,
              controller: textEditingController,
              onCompleted: (v) {
                print("Completed");
              },
              onChanged: (value) {
                print(value);
                setState(() {
                  // currentText = value;
                });
              },
            ),
            SizedBox(height: 20),
            Text(
              'Resend code in $_resendCodeTimer s',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            Spacer(),
            custombuttonauth(
                text: "Verify",
                onPressed: () {
                  controller.goToResetPassword();
                })
          ],
        ),
      ),
    );
  }
}
