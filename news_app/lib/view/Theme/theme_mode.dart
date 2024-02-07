import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/custom_radiobutton.dart';
import 'package:news_app/controller/theme_custom.dart';
import 'package:news_app/model/responsiveui.dart';
import 'package:news_app/utils/custom_appbar.dart';

class CustomThemeMode extends StatelessWidget {
  CustomThemeMode({Key? key}) : super(key: key);
  final controller = Get.put(ThemeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar().appBar(
        title: Text(
          'Dark mode'.tr,
          textScaler:
              TextScaler.linear(ResponsiveUi().textScaleFactor(context)),
        ),
        center: true,
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: ResponsiveUi()
                  .getMediaQueryHeight(context: context, value: 25),
            ),
            child: Text(
              textScaler:
                  TextScaler.linear(ResponsiveUi().textScaleFactor(context)),
              "Change Mode".tr,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          CustomRadioButton().addRadioButton(
              title: "System".tr,
              val: ThemeMode.system,
              context: context,
              icon: Icons.system_security_update_good),
          CustomRadioButton().addRadioButton(
            title: "Light".tr,
            val: ThemeMode.light,
            icon: Icons.light_mode_outlined,
            context: context,
          ),
          CustomRadioButton().addRadioButton(
            title: "Dark".tr,
            val: ThemeMode.dark,
            icon: Icons.dark_mode_outlined,
            context: context,
          ),
        ],
      ),
    );
  }
}
