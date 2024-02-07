import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:news_app/controller/language_controller.dart';
import 'package:news_app/main.dart';
import 'package:news_app/model/responsiveui.dart';
import 'package:news_app/utils/custom_appbar.dart';

class LanguagePage extends StatelessWidget {
  const LanguagePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar().appBar(
        title: Text(
          'Language'.tr,
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
              "Change Language".tr,
              textScaler:
                  TextScaler.linear(ResponsiveUi().textScaleFactor(context)),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    LanguageController().changeLanguage('en');
                    Jiffy.setLocale(
                      sharedPref!.getString("lang") == null
                          ? Get.deviceLocale?.languageCode == "en"
                              ? 'en'
                              : 'ar'
                          : Locale(sharedPref!.getString("lang")!)
                                      .languageCode ==
                                  "en"
                              ? 'en'
                              : 'ar',
                    );
                  },
                  child: Text(
                    textScaler: TextScaler.linear(
                        ResponsiveUi().textScaleFactor(context)),
                    'English'.tr,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                sharedPref!.getString("lang") == null
                    ? Get.deviceLocale?.languageCode == "en"
                        ? Icon(
                            Icons.check,
                            color: Theme.of(context).primaryIconTheme.color,
                            size: Theme.of(context).primaryIconTheme.size,
                          )
                        : Container()
                    : Locale(sharedPref!.getString("lang")!).languageCode ==
                            "en"
                        ? Icon(
                            Icons.check,
                            color: Theme.of(context).primaryIconTheme.color,
                            size: Theme.of(context).primaryIconTheme.size,
                          )
                        : Container(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    LanguageController().changeLanguage('ar');
                    Jiffy.setLocale(
                      sharedPref!.getString("lang") == null
                          ? Get.deviceLocale?.languageCode == "en"
                              ? 'en'
                              : 'ar'
                          : Locale(sharedPref!.getString("lang")!)
                                      .languageCode ==
                                  "en"
                              ? 'en'
                              : 'ar',
                    );
                  },
                  child: Text(
                    textScaler: TextScaler.linear(
                        ResponsiveUi().textScaleFactor(context)),
                    'Arabic'.tr,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                sharedPref!.getString("lang") == null
                    ? Get.deviceLocale?.languageCode == "en"
                        ? Container()
                        : Icon(
                            Icons.check,
                            color: Theme.of(context).primaryIconTheme.color,
                            size: Theme.of(context).primaryIconTheme.size,
                          )
                    : Locale(sharedPref!.getString("lang")!).languageCode ==
                            "en"
                        ? Container()
                        : Icon(
                            Icons.check,
                            color: Theme.of(context).primaryIconTheme.color,
                            size: Theme.of(context).primaryIconTheme.size,
                          )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
