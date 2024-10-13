import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelapp/core/services/services.dart';


class LocaleController extends GetxController {

Locale? language ;  

Myservices myServices = Get.find()  ;


changeLang(String langcode){
 Locale locale = Locale(langcode) ; 
 myServices.sharedPreferences.setString("lang", langcode) ; 
 Get.updateLocale(locale) ; 
}


@override
  void onInit() {

    String? sharedPrefLang = myServices.sharedPreferences.getString("lang") ;  
    if (sharedPrefLang == "ar"){
      language = const Locale("ar")  ;
    }else if (sharedPrefLang == "en"){
      language = const Locale("en")  ;
    }else {
      language = Locale(Get.deviceLocale!.languageCode) ; 
    }
    super.onInit();
  }


}