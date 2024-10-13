import 'package:flutter/material.dart';
import 'package:travelapp/core/constant/colore.dart';

class custombuttonauth extends StatelessWidget {
  final String text;
  final void Function()? onPressed;

  const custombuttonauth(
      {super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.only(top: 0),
        child: MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16),
          onPressed: onPressed,
          color: AppColor.primaryColor,
          textColor: AppColor.waith,
          child: Text(text),
        ),
      ),
    );
  }
}
