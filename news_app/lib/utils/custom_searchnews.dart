import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/model/responsiveui.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomSearchNews extends StatelessWidget {
  const CustomSearchNews({super.key, required this.controller});
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
      child: ListView(
        children: [
          SizedBox(
            height:
                ResponsiveUi().getMediaQueryHeight(context: context, value: 20),
          ),
          Text(
            'Discover'.tr,
            style: Theme.of(context).textTheme.displaySmall,
            textScaler:
                TextScaler.linear(ResponsiveUi().textScaleFactor(context)),
          ),
          SizedBox(
              height: ResponsiveUi()
                  .getMediaQueryHeight(context: context, value: 10)),
          Text(
            'News from all over the world'.tr,
            textScaler:
                TextScaler.linear(ResponsiveUi().textScaleFactor(context)),
            style: Theme.of(context).textTheme.titleSmall,
          ),
          SizedBox(
              height: ResponsiveUi()
                  .getMediaQueryHeight(context: context, value: 25)),
          TextFormField(
            controller: controller,
            textInputAction: TextInputAction.search,
            onEditingComplete: () {
              Get.toNamed('/SearchPage', arguments: controller.text);
            },
            keyboardAppearance:
                Get.isDarkMode ? Brightness.dark : Brightness.light,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontSize: 16.sp /
                    MediaQuery.of(context)
                        .textScaler
                        .scale(ResponsiveUi().textScaleFactor(context))),
            cursorColor: Colors.grey,
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.never,
              filled: true,
              fillColor: Theme.of(context).cardColor,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.all(18),
              labelText: "Search...".tr,
              prefixIcon: const Icon(
                Icons.search,
                size: 26,
                color: Colors.grey,
              ),
              hintStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: 16.sp /
                      MediaQuery.of(context)
                          .textScaler
                          .scale(ResponsiveUi().textScaleFactor(context))),
              labelStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: 16.sp /
                      MediaQuery.of(context)
                          .textScaler
                          .scale(ResponsiveUi().textScaleFactor(context))),
            ),
          )
        ],
      ),
    );
  }
}
