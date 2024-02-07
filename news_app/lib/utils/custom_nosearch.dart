import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/model/lottie.dart';
import 'package:news_app/model/responsiveui.dart';

class CustomNoSearch extends StatelessWidget {
  const CustomNoSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          SizedBox(
            height: ResponsiveUi()
                .getMediaQueryHeight(context: context, value: 150),
          ),
          Lottie.asset(LottieImage.noSearch, alignment: Alignment.center),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(top: 20, bottom: 10),
            child: Text(
              textScaler:
                  TextScaler.linear(ResponsiveUi().textScaleFactor(context)),
              "No search result found".tr,
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ),
        ],
      ),
    );
  }
}
