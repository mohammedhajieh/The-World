import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/model/lottie.dart';
import 'package:news_app/model/responsiveui.dart';

class CustomInternet extends StatelessWidget {
  const CustomInternet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Lottie.asset(LottieImage.internet, alignment: Alignment.topCenter),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(top: 20, bottom: 10),
            child: Text(
              textScaler:
                  TextScaler.linear(ResponsiveUi().textScaleFactor(context)),
              "No Internet connection".tr,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(bottom: 20),
            child: Text(
              "Check your connection, then refresh the page.".tr,
              textScaler:
                  TextScaler.linear(ResponsiveUi().textScaleFactor(context)),
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            alignment: Alignment.center,
            height:
                ResponsiveUi().getMediaQueryHeight(context: context, value: 50),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                alignment: Alignment.center,
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              ),
              onPressed: () async {},
              child: Text("Try Again".tr,
                  textScaler: TextScaler.linear(
                      ResponsiveUi().textScaleFactor(context)),
                  style: Theme.of(context).textTheme.bodyMedium),
            ),
          ),
        ],
      ),
    );
  }
}
