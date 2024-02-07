import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/model/responsiveui.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCountry extends StatelessWidget {
  const ShimmerCountry({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Shimmer.fromColors(
          baseColor: Get.isDarkMode ? Colors.grey[700]! : Colors.grey[350]!,
          highlightColor: Get.isDarkMode ? Colors.grey[50]! : Colors.grey[50]!,
          enabled: true,
          child: Container(
            width: double.infinity,
            height:
                ResponsiveUi().getMediaQueryHeight(context: context, value: 55),
            margin: const EdgeInsets.only(left: 16, right: 16, top: 16),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(22),
              ),
              color: Colors.white,
            ),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: 25,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Shimmer.fromColors(
              baseColor: Get.isDarkMode ? Colors.grey[700]! : Colors.grey[350]!,
              highlightColor:
                  Get.isDarkMode ? Colors.grey[50]! : Colors.grey[50]!,
              enabled: true,
              child: Row(
                children: [
                  Container(
                    width: ResponsiveUi()
                        .getMediaQueryWidth(context: context, value: 50),
                    height: ResponsiveUi()
                        .getMediaQueryHeight(context: context, value: 45),
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: ResponsiveUi()
                        .getMediaQueryWidth(context: context, value: 10),
                  ),
                  Container(
                    width: ResponsiveUi()
                        .getMediaQueryWidth(context: context, value: 150),
                    height: ResponsiveUi()
                        .getMediaQueryHeight(context: context, value: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
