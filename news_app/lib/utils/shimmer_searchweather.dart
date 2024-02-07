import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/model/responsiveui.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerSearchWeather extends StatelessWidget {
  const ShimmerSearchWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 20),
      child: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
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
                  margin: const EdgeInsets.symmetric(
                    vertical: 10.0,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: ResponsiveUi()
                    .getMediaQueryHeight(context: context, value: 20),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Shimmer.fromColors(
                    baseColor:
                        Get.isDarkMode ? Colors.grey[700]! : Colors.grey[350]!,
                    highlightColor:
                        Get.isDarkMode ? Colors.grey[50]! : Colors.grey[50]!,
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      height: ResponsiveUi()
                          .getMediaQueryHeight(context: context, value: 75),
                      width: ResponsiveUi()
                          .getMediaQueryWidth(context: context, value: 75),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: ResponsiveUi()
                        .getMediaQueryWidth(context: context, value: 15),
                  ),
                  Shimmer.fromColors(
                    baseColor:
                        Get.isDarkMode ? Colors.grey[700]! : Colors.grey[350]!,
                    highlightColor:
                        Get.isDarkMode ? Colors.grey[50]! : Colors.grey[50]!,
                    enabled: true,
                    child: Container(
                      width: ResponsiveUi()
                          .getMediaQueryWidth(context: context, value: 100),
                      height: ResponsiveUi()
                          .getMediaQueryHeight(context: context, value: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: ResponsiveUi()
                    .getMediaQueryHeight(context: context, value: 15),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Shimmer.fromColors(
                    baseColor:
                        Get.isDarkMode ? Colors.grey[700]! : Colors.grey[350]!,
                    highlightColor:
                        Get.isDarkMode ? Colors.grey[50]! : Colors.grey[50]!,
                    enabled: true,
                    child: Container(
                      height: ResponsiveUi()
                          .getMediaQueryHeight(context: context, value: 80),
                      width: ResponsiveUi()
                          .getMediaQueryWidth(context: context, value: 80),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          color: Theme.of(context)
                              .appBarTheme
                              .backgroundColor!
                              .withOpacity(0.45),
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                  Shimmer.fromColors(
                    baseColor:
                        Get.isDarkMode ? Colors.grey[700]! : Colors.grey[350]!,
                    highlightColor:
                        Get.isDarkMode ? Colors.grey[50]! : Colors.grey[50]!,
                    enabled: true,
                    child: Container(
                      height: ResponsiveUi()
                          .getMediaQueryHeight(context: context, value: 80),
                      width: ResponsiveUi()
                          .getMediaQueryWidth(context: context, value: 80),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          color: Theme.of(context)
                              .appBarTheme
                              .backgroundColor!
                              .withOpacity(0.45),
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                  Shimmer.fromColors(
                    baseColor:
                        Get.isDarkMode ? Colors.grey[700]! : Colors.grey[350]!,
                    highlightColor:
                        Get.isDarkMode ? Colors.grey[50]! : Colors.grey[50]!,
                    enabled: true,
                    child: Container(
                      height: ResponsiveUi()
                          .getMediaQueryHeight(context: context, value: 80),
                      width: ResponsiveUi()
                          .getMediaQueryWidth(context: context, value: 80),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          color: Theme.of(context)
                              .appBarTheme
                              .backgroundColor!
                              .withOpacity(0.45),
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: ResponsiveUi()
                    .getMediaQueryHeight(context: context, value: 15),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Shimmer.fromColors(
                    baseColor:
                        Get.isDarkMode ? Colors.grey[700]! : Colors.grey[350]!,
                    highlightColor:
                        Get.isDarkMode ? Colors.grey[50]! : Colors.grey[50]!,
                    enabled: true,
                    child: Container(
                      height: ResponsiveUi()
                          .getMediaQueryHeight(context: context, value: 5),
                      width: ResponsiveUi()
                          .getMediaQueryWidth(context: context, value: 70),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Shimmer.fromColors(
                    baseColor:
                        Get.isDarkMode ? Colors.grey[700]! : Colors.grey[350]!,
                    highlightColor:
                        Get.isDarkMode ? Colors.grey[50]! : Colors.grey[50]!,
                    enabled: true,
                    child: Container(
                      height: ResponsiveUi()
                          .getMediaQueryHeight(context: context, value: 5),
                      width: ResponsiveUi()
                          .getMediaQueryWidth(context: context, value: 70),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Shimmer.fromColors(
                    baseColor:
                        Get.isDarkMode ? Colors.grey[700]! : Colors.grey[350]!,
                    highlightColor:
                        Get.isDarkMode ? Colors.grey[50]! : Colors.grey[50]!,
                    enabled: true,
                    child: Container(
                      height: ResponsiveUi()
                          .getMediaQueryHeight(context: context, value: 5),
                      width: ResponsiveUi()
                          .getMediaQueryWidth(context: context, value: 70),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: ResponsiveUi()
                    .getMediaQueryHeight(context: context, value: 25),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Shimmer.fromColors(
                    baseColor:
                        Get.isDarkMode ? Colors.grey[700]! : Colors.grey[350]!,
                    highlightColor:
                        Get.isDarkMode ? Colors.grey[50]! : Colors.grey[50]!,
                    enabled: true,
                    child: Container(
                      height: ResponsiveUi()
                          .getMediaQueryHeight(context: context, value: 80),
                      width: ResponsiveUi()
                          .getMediaQueryWidth(context: context, value: 80),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          color: Theme.of(context)
                              .appBarTheme
                              .backgroundColor!
                              .withOpacity(0.45),
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                  Shimmer.fromColors(
                    baseColor:
                        Get.isDarkMode ? Colors.grey[700]! : Colors.grey[350]!,
                    highlightColor:
                        Get.isDarkMode ? Colors.grey[50]! : Colors.grey[50]!,
                    enabled: true,
                    child: Container(
                      height: ResponsiveUi()
                          .getMediaQueryHeight(context: context, value: 80),
                      width: ResponsiveUi()
                          .getMediaQueryWidth(context: context, value: 80),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          color: Theme.of(context)
                              .appBarTheme
                              .backgroundColor!
                              .withOpacity(0.45),
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                  Shimmer.fromColors(
                    baseColor:
                        Get.isDarkMode ? Colors.grey[700]! : Colors.grey[350]!,
                    highlightColor:
                        Get.isDarkMode ? Colors.grey[50]! : Colors.grey[50]!,
                    enabled: true,
                    child: Container(
                      height: ResponsiveUi()
                          .getMediaQueryHeight(context: context, value: 80),
                      width: ResponsiveUi()
                          .getMediaQueryWidth(context: context, value: 80),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          color: Theme.of(context)
                              .appBarTheme
                              .backgroundColor!
                              .withOpacity(0.45),
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: ResponsiveUi()
                    .getMediaQueryHeight(context: context, value: 15),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Shimmer.fromColors(
                    baseColor:
                        Get.isDarkMode ? Colors.grey[700]! : Colors.grey[350]!,
                    highlightColor:
                        Get.isDarkMode ? Colors.grey[50]! : Colors.grey[50]!,
                    enabled: true,
                    child: Container(
                      height: ResponsiveUi()
                          .getMediaQueryHeight(context: context, value: 5),
                      width: ResponsiveUi()
                          .getMediaQueryWidth(context: context, value: 70),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Shimmer.fromColors(
                    baseColor:
                        Get.isDarkMode ? Colors.grey[700]! : Colors.grey[350]!,
                    highlightColor:
                        Get.isDarkMode ? Colors.grey[50]! : Colors.grey[50]!,
                    enabled: true,
                    child: Container(
                      height: ResponsiveUi()
                          .getMediaQueryHeight(context: context, value: 5),
                      width: ResponsiveUi()
                          .getMediaQueryWidth(context: context, value: 70),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Shimmer.fromColors(
                    baseColor:
                        Get.isDarkMode ? Colors.grey[700]! : Colors.grey[350]!,
                    highlightColor:
                        Get.isDarkMode ? Colors.grey[50]! : Colors.grey[50]!,
                    enabled: true,
                    child: Container(
                      height: ResponsiveUi()
                          .getMediaQueryHeight(context: context, value: 5),
                      width: ResponsiveUi()
                          .getMediaQueryWidth(context: context, value: 70),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height:
                ResponsiveUi().getMediaQueryHeight(context: context, value: 40),
          ),
          Shimmer.fromColors(
            baseColor: Get.isDarkMode ? Colors.grey[700]! : Colors.grey[350]!,
            highlightColor:
                Get.isDarkMode ? Colors.grey[50]! : Colors.grey[50]!,
            enabled: true,
            child: Container(
              width: ResponsiveUi()
                  .getMediaQueryWidth(context: context, value: 100),
              height: ResponsiveUi()
                  .getMediaQueryHeight(context: context, value: 20),
              margin: const EdgeInsets.symmetric(horizontal: 150),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: Theme.of(context).appBarTheme.backgroundColor,
              ),
            ),
          ),
          SizedBox(
            height:
                ResponsiveUi().getMediaQueryHeight(context: context, value: 15),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Shimmer.fromColors(
                      baseColor: Get.isDarkMode
                          ? Colors.grey[700]!
                          : Colors.grey[350]!,
                      highlightColor:
                          Get.isDarkMode ? Colors.grey[50]! : Colors.grey[50]!,
                      enabled: true,
                      child: Container(
                        width: ResponsiveUi()
                            .getMediaQueryWidth(context: context, value: 80),
                        height: ResponsiveUi()
                            .getMediaQueryHeight(context: context, value: 150),
                        decoration: BoxDecoration(
                          color: Theme.of(context).appBarTheme.backgroundColor,
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: ResponsiveUi()
                          .getMediaQueryWidth(context: context, value: 15),
                    ),
                    Shimmer.fromColors(
                      baseColor: Get.isDarkMode
                          ? Colors.grey[700]!
                          : Colors.grey[350]!,
                      highlightColor:
                          Get.isDarkMode ? Colors.grey[50]! : Colors.grey[50]!,
                      enabled: true,
                      child: Container(
                        width: ResponsiveUi()
                            .getMediaQueryWidth(context: context, value: 80),
                        height: ResponsiveUi()
                            .getMediaQueryHeight(context: context, value: 150),
                        decoration: BoxDecoration(
                          color: Theme.of(context).appBarTheme.backgroundColor,
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: ResponsiveUi()
                          .getMediaQueryWidth(context: context, value: 15),
                    ),
                    Shimmer.fromColors(
                      baseColor: Get.isDarkMode
                          ? Colors.grey[700]!
                          : Colors.grey[350]!,
                      highlightColor:
                          Get.isDarkMode ? Colors.grey[50]! : Colors.grey[50]!,
                      enabled: true,
                      child: Container(
                        width: ResponsiveUi()
                            .getMediaQueryWidth(context: context, value: 80),
                        height: ResponsiveUi()
                            .getMediaQueryHeight(context: context, value: 150),
                        decoration: BoxDecoration(
                          color: Theme.of(context).appBarTheme.backgroundColor,
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: ResponsiveUi()
                          .getMediaQueryWidth(context: context, value: 15),
                    ),
                    Shimmer.fromColors(
                      baseColor: Get.isDarkMode
                          ? Colors.grey[700]!
                          : Colors.grey[350]!,
                      highlightColor:
                          Get.isDarkMode ? Colors.grey[50]! : Colors.grey[50]!,
                      enabled: true,
                      child: Container(
                        width: ResponsiveUi()
                            .getMediaQueryWidth(context: context, value: 80),
                        height: ResponsiveUi()
                            .getMediaQueryHeight(context: context, value: 150),
                        decoration: BoxDecoration(
                          color: Theme.of(context).appBarTheme.backgroundColor,
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
