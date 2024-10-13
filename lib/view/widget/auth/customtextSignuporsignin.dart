import 'package:flutter/material.dart';
import 'package:travelapp/core/constant/colore.dart';

class customtextSignuporsignin extends StatelessWidget {
  final String textone;
  final String texttwo;
  final void Function()? onTap;
  const customtextSignuporsignin(
      {super.key,
      required this.textone,
      required this.texttwo,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          textone,
          style: TextStyle(color: AppColor.grey),
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            texttwo,
            style: TextStyle(
                fontWeight: FontWeight.bold, color: AppColor.primaryColor),
          ),
        ),
      ],
    );
  }
}

class customtextSignuporsignin1 extends StatelessWidget {
  final String text;
  final void Function()? onTap;

  const customtextSignuporsignin1({super.key, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: InkWell(
        onTap: onTap,
        child: Text(
          text,
          style: TextStyle(
              fontWeight: FontWeight.bold, color: AppColor.primaryColor),
        ),
      ),
    );
  }
}
