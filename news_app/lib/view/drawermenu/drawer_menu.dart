import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/drawer.dart';
import 'package:news_app/main.dart';
import 'package:news_app/model/responsiveui.dart';
import 'package:url_launcher/url_launcher.dart';

class MenuScreen extends GetView<MyDrawerController> {
  const MenuScreen({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            SizedBox(
              height: ResponsiveUi()
                  .getMediaQueryHeight(context: context, value: 80),
            ),
            Padding(
              padding: sharedPref!.getString("lang") == null
                  ? Get.deviceLocale?.languageCode == "en"
                      ? EdgeInsets.only(
                          left: ResponsiveUi()
                              .getMediaQueryWidth(context: context, value: 25),
                        )
                      : EdgeInsets.only(
                          right: ResponsiveUi()
                              .getMediaQueryWidth(context: context, value: 20),
                        )
                  : Locale(sharedPref!.getString("lang")!).languageCode == "en"
                      ? EdgeInsets.only(
                          left: ResponsiveUi()
                              .getMediaQueryWidth(context: context, value: 20),
                        )
                      : EdgeInsets.only(
                          right: ResponsiveUi()
                              .getMediaQueryWidth(context: context, value: 20),
                        ),
              child: Text(
                'Browse'.tr,
                textScaler:
                    TextScaler.linear(ResponsiveUi().textScaleFactor(context)),
                style: Theme.of(context).textTheme.bodySmall!.copyWith(),
              ),
            ),
            Divider(
              height: ResponsiveUi()
                  .getMediaQueryHeight(context: context, value: 20),
            ),
            SizedBox(
              height: ResponsiveUi()
                  .getMediaQueryHeight(context: context, value: 10),
            ),
            ListTile(
              onTap: () {
                Get.toNamed('/Notifications');
              },
              leading: const Icon(Icons.notifications),
              title: Text(
                textScaler:
                    TextScaler.linear(ResponsiveUi().textScaleFactor(context)),
                'Notification'.tr,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            SizedBox(
              height: ResponsiveUi()
                  .getMediaQueryHeight(context: context, value: 20),
            ),
            Padding(
              padding: sharedPref!.getString("lang") == null
                  ? Get.deviceLocale?.languageCode == "en"
                      ? EdgeInsets.only(
                          left: ResponsiveUi()
                              .getMediaQueryWidth(context: context, value: 20),
                        )
                      : EdgeInsets.only(
                          right: ResponsiveUi()
                              .getMediaQueryWidth(context: context, value: 20),
                        )
                  : Locale(sharedPref!.getString("lang")!).languageCode == "en"
                      ? EdgeInsets.only(
                          left: ResponsiveUi()
                              .getMediaQueryWidth(context: context, value: 20),
                        )
                      : EdgeInsets.only(
                          right: ResponsiveUi()
                              .getMediaQueryWidth(context: context, value: 20),
                        ),
              child: Text(
                  textScaler: TextScaler.linear(
                      ResponsiveUi().textScaleFactor(context)),
                  'Mode'.tr,
                  style: Theme.of(context).textTheme.bodySmall),
            ),
            Divider(
              height: ResponsiveUi()
                  .getMediaQueryHeight(context: context, value: 25),
            ),
            SizedBox(
              height: ResponsiveUi()
                  .getMediaQueryHeight(context: context, value: 20),
            ),
            ListTile(
              onTap: () {
                Get.toNamed('/CustomThemeModeService');
              },
              leading: const Icon(Icons.dark_mode_outlined),
              title: Text(
                  textScaler: TextScaler.linear(
                      ResponsiveUi().textScaleFactor(context)),
                  'Dark mode'.tr,
                  style: Theme.of(context).textTheme.bodyMedium),
            ),
            SizedBox(
              height: ResponsiveUi()
                  .getMediaQueryHeight(context: context, value: 10),
            ),
            ListTile(
              onTap: () {
                Get.toNamed('/LanguagePage');
              },
              leading: const Icon(Icons.language),
              title: Text(
                  textScaler: TextScaler.linear(
                      ResponsiveUi().textScaleFactor(context)),
                  'Language'.tr,
                  style: Theme.of(context).textTheme.bodyMedium),
            ),
            SizedBox(
              height: ResponsiveUi()
                  .getMediaQueryHeight(context: context, value: 20),
            ),
            Padding(
              padding: sharedPref!.getString("lang") == null
                  ? Get.deviceLocale?.languageCode == "en"
                      ? EdgeInsets.only(
                          left: ResponsiveUi()
                              .getMediaQueryWidth(context: context, value: 20),
                        )
                      : EdgeInsets.only(
                          right: ResponsiveUi()
                              .getMediaQueryWidth(context: context, value: 20),
                        )
                  : Locale(sharedPref!.getString("lang")!).languageCode == "en"
                      ? EdgeInsets.only(
                          left: ResponsiveUi()
                              .getMediaQueryWidth(context: context, value: 20),
                        )
                      : EdgeInsets.only(
                          right: ResponsiveUi()
                              .getMediaQueryWidth(context: context, value: 20),
                        ),
              child: Text(
                  textScaler: TextScaler.linear(
                      ResponsiveUi().textScaleFactor(context)),
                  'About'.tr,
                  style: Theme.of(context).textTheme.bodySmall),
            ),
            Divider(
              height: ResponsiveUi()
                  .getMediaQueryHeight(context: context, value: 25),
            ),
            SizedBox(
              height: ResponsiveUi()
                  .getMediaQueryHeight(context: context, value: 20),
            ),
            ListTile(
              onTap: () {
                launchUrl(Uri.parse('https://newsapi.org/terms'));
              },
              leading: const Icon(Icons.newspaper),
              title: Text(
                  textScaler: TextScaler.linear(
                      ResponsiveUi().textScaleFactor(context)),
                  'About News'.tr,
                  style: Theme.of(context).textTheme.bodyMedium),
            ),
            SizedBox(
              height: ResponsiveUi()
                  .getMediaQueryHeight(context: context, value: 10),
            ),
            ListTile(
              onTap: () {
                launchUrl(Uri.parse('https://www.weatherapi.com/terms.aspx'));
              },
              leading: const Icon(Icons.sunny_snowing),
              title: Text(
                  textScaler: TextScaler.linear(
                      ResponsiveUi().textScaleFactor(context)),
                  'About Weather'.tr,
                  style: Theme.of(context).textTheme.bodyMedium),
            ),
            SizedBox(
              height: ResponsiveUi()
                  .getMediaQueryHeight(context: context, value: 20),
            ),
            Padding(
              padding: sharedPref!.getString("lang") == null
                  ? Get.deviceLocale?.languageCode == "en"
                      ? EdgeInsets.only(
                          left: ResponsiveUi()
                              .getMediaQueryWidth(context: context, value: 20),
                        )
                      : EdgeInsets.only(
                          right: ResponsiveUi()
                              .getMediaQueryWidth(context: context, value: 20),
                        )
                  : Locale(sharedPref!.getString("lang")!).languageCode == "en"
                      ? EdgeInsets.only(
                          left: ResponsiveUi()
                              .getMediaQueryWidth(context: context, value: 20),
                        )
                      : EdgeInsets.only(
                          right: ResponsiveUi()
                              .getMediaQueryWidth(context: context, value: 20),
                        ),
              child: Text(
                'Exit'.tr,
                textScaler:
                    TextScaler.linear(ResponsiveUi().textScaleFactor(context)),
                style: Theme.of(context).textTheme.bodySmall!.copyWith(),
              ),
            ),
            Divider(
              height: ResponsiveUi()
                  .getMediaQueryHeight(context: context, value: 25),
            ),
            SizedBox(
              height: ResponsiveUi()
                  .getMediaQueryHeight(context: context, value: 20),
            ),
            ListTile(
              onTap: () {
                if (Platform.isAndroid) {
                  SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                } else if (Platform.isIOS) {
                  exit(0);
                }
              },
              leading: const Icon(Icons.logout),
              title: Text(
                textScaler:
                    TextScaler.linear(ResponsiveUi().textScaleFactor(context)),
                'Logout'.tr,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
