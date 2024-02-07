import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/theme_custom.dart';
import 'package:news_app/model/responsiveui.dart';

class CustomRadioButton extends GetxController {
  GetBuilder addRadioButton(
      {required ThemeMode val,
      required String title,
      required IconData icon,
      required BuildContext context}) {
    return GetBuilder<ThemeController>(
      builder: (controller) => RadioListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              textScaler:
                  TextScaler.linear(ResponsiveUi().textScaleFactor(context)),
              title,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Icon(icon),
          ],
        ),
        value: val,
        groupValue: controller.themeMode,
        onChanged: (ThemeMode? value) {
          controller.setThemeMode(value!);
        },
      ),
    );
  }
}
