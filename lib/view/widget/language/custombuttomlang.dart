import 'package:flutter/material.dart';
import 'package:untitled/core/constant/colore.dart';

class CustomButtonLang extends StatelessWidget {
  final String textbutton;
  final void Function()? onPressed;
  const CustomButtonLang({Key? key, required this.textbutton, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 100),
      width: double.infinity,
      child: MaterialButton(
        color: AppColor.primaryColor,
        textColor: AppColor.waith,
        onPressed: onPressed,
        child: Text(textbutton, style: TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }
}
