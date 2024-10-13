import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test'),
      ),
      body: Container(
          padding: EdgeInsets.all(20),
          child: ListView(
            children: [
              OtpTextField(
                fieldWidth: 50.0,
                borderRadius: BorderRadius.circular(20),
                numberOfFields: 5,
                borderColor: Color(0xFF512DA8),
                //set to true to show as box or false to show as dash
                showFieldAsBox: true,
                //runs when a code is typed in
                onCodeChanged: (String code) {
                  //handle validation or checks here
                },
                //runs when every textfield is filled
                onSubmit: (String verificationCode) {}, // end onSubmit
              ),
            ],
          )),
    );
  }

  OtpTextField(
      {required double fieldWidth,
      required BorderRadius borderRadius,
      required int numberOfFields,
      required Color borderColor,
      required bool showFieldAsBox,
      required Null Function(String code) onCodeChanged,
      required Null Function(String verificationCode) onSubmit}) {}
}
