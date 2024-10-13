import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelapp/core/localization/changelocal.dart';
import 'package:travelapp/core/localization/translation.dart';
import 'package:travelapp/core/services/services.dart';
import 'package:travelapp/routes.dart';
import 'package:travelapp/view/screen/language.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialservices();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());

    return GetMaterialApp(
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      locale: controller.language,
      home: Language(),
      routes: routes,
    );
  }
}
