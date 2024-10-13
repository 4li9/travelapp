import 'package:flutter/material.dart';
import 'package:untitled/core/constant/routes.dart';
import 'package:untitled/view/screen/OnBoarding.dart';
import 'package:untitled/view/screen/auth/Check_Email.dart';
import 'package:untitled/view/screen/auth/Check_Phone.dart';
import 'package:untitled/view/screen/auth/My_Wiishlist.dart';
import 'package:untitled/view/screen/auth/Notifications.dart';
import 'package:untitled/view/screen/auth/SignUp.dart';
import 'package:untitled/view/screen/auth/Special_Offers.dart';
import 'package:untitled/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:untitled/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:untitled/view/screen/auth/forgetpassword/verifycodeEmail.dart';
import 'package:untitled/view/screen/auth/forgetpassword/verifycodePhone.dart';
import 'package:untitled/view/screen/auth/home.dart';
import 'package:untitled/view/screen/auth/login.dart';
import 'package:untitled/view/screen/auth/SignIn.dart';
import 'package:untitled/view/screen/auth/widget_test.dart';
import 'package:untitled/view/screen/language.dart';

Map<String, Widget Function(BuildContext)> routes = {
  AppRoute.Language: (context) => Language(),
  AppRoute.login: (context) => login(),
  AppRoute.SignUp: (context) => SignUp(),
  AppRoute.onbording: (context) => OnBoarding(),
  AppRoute.SignIn: (context) => SignIn(),
  AppRoute.home: (context) => Home(),
  AppRoute.forgetPassword: (context) => ForgetPassword(),
  AppRoute.verifycodeEmail: (context) => verifycodeEmail(),
  AppRoute.verifycodePhone: (context) => verifycodePhone(),
  AppRoute.ResetPassword: (context) => ResetPassword(),
  AppRoute.Check_Phone: (context) => Check_Phone(),
  AppRoute.Chik_Email: (context) => Check_Email(),
  AppRoute.My_Wiishlist: (context) => My_Wiishlist(),
  AppRoute.Notifications: (context) => Notifications(),
  AppRoute.Special_Offers: (context) => Special_Offers(),
  AppRoute.MyHomePage: (context) => MyHomePage(),
};
