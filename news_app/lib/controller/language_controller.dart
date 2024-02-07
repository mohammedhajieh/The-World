import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/main.dart';

class LanguageController extends GetxController {
  Locale? intilang = sharedPref!.getString("lang") == null
      ? Get.deviceLocale
      : Locale(sharedPref!.getString("lang")!);
  void changeLanguage(String codeLanguage) async {
    Locale locale = Locale(codeLanguage);
    sharedPref!.setString("lang", codeLanguage);
    Get.updateLocale(locale);
  }
}
