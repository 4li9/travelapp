import 'package:flutter/material.dart';
import 'package:travelapp/core/constant/imageasset.dart';

class logoauth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imageasset.logo,
      height: 160,
    );
  }
}
