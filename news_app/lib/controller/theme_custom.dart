import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController extends GetxController {
  static ThemeController get to => Get.find();

  @override
  void onInit() {
    super.onInit();
    getSavedThemeMode();
  }

  GetStorage box = GetStorage();

  ThemeMode themeMode = ThemeMode.system;

  Future<void> setThemeMode(ThemeMode theme) async {
    Get.changeThemeMode(theme);
    themeMode = theme;
    box.write("theme", themeMode.toString().split('.')[1]);
    update();
  }

  getSavedThemeMode() async {
    var savedTheme = box.read("theme") ?? "system";
    themeMode = ThemeMode.values.firstWhere((e) => e.name == savedTheme);
    Get.changeThemeMode(themeMode);
    update();
  }
}
