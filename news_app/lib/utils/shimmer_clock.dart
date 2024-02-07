import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/model/responsiveui.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerClock extends StatelessWidget {
  const ShimmerClock({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Shimmer.fromColors(
            baseColor: Get.isDarkMode ? Colors.grey[700]! : Colors.grey[350]!,
            highlightColor:
                Get.isDarkMode ? Colors.grey[50]! : Colors.grey[50]!,
            enabled: true,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              height: ResponsiveUi()
                  .getMediaQueryHeight(context: context, value: 50),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: Theme.of(context).appBarTheme.backgroundColor,
              ),
            ),
          ),
          SizedBox(
            height:
                ResponsiveUi().getMediaQueryHeight(context: context, value: 30),
          ),
          Column(
            children: [
              Shimmer.fromColors(
                baseColor:
                    Get.isDarkMode ? Colors.grey[700]! : Colors.grey[350]!,
                highlightColor:
                    Get.isDarkMode ? Colors.grey[50]! : Colors.grey[50]!,
                enabled: true,
                child: Container(
                  width: ResponsiveUi()
                      .getMediaQueryWidth(context: context, value: 220),
                  height: ResponsiveUi()
                      .getMediaQueryHeight(context: context, value: 15),
                  margin: const EdgeInsets.symmetric(vertical: 10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: ResponsiveUi()
                    .getMediaQueryHeight(context: context, value: 15),
              ),
              Shimmer.fromColors(
                baseColor:
                    Get.isDarkMode ? Colors.grey[700]! : Colors.grey[350]!,
                highlightColor:
                    Get.isDarkMode ? Colors.grey[50]! : Colors.grey[50]!,
                enabled: true,
                child: Container(
                  width: ResponsiveUi()
                      .getMediaQueryWidth(context: context, value: 150),
                  height: ResponsiveUi()
                      .getMediaQueryHeight(context: context, value: 15),
                  margin: const EdgeInsets.symmetric(vertical: 10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: ResponsiveUi()
                    .getMediaQueryHeight(context: context, value: 15),
              ),
              Shimmer.fromColors(
                baseColor:
                    Get.isDarkMode ? Colors.grey[700]! : Colors.grey[350]!,
                highlightColor:
                    Get.isDarkMode ? Colors.grey[50]! : Colors.grey[50]!,
                enabled: true,
                child: Container(
                  width: ResponsiveUi()
                      .getMediaQueryWidth(context: context, value: 220),
                  height: ResponsiveUi()
                      .getMediaQueryHeight(context: context, value: 15),
                  margin: const EdgeInsets.symmetric(vertical: 10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height:
                ResponsiveUi().getMediaQueryHeight(context: context, value: 30),
          ),
          Shimmer.fromColors(
            baseColor: Get.isDarkMode ? Colors.grey[700]! : Colors.grey[350]!,
            highlightColor:
                Get.isDarkMode ? Colors.grey[50]! : Colors.grey[50]!,
            enabled: true,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: AspectRatio(
                aspectRatio: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).appBarTheme.backgroundColor,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
