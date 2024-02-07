import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/model/responsiveui.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerSearchWorld extends StatelessWidget {
  const ShimmerSearchWorld({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Shimmer.fromColors(
            baseColor: Get.isDarkMode ? Colors.grey[700]! : Colors.grey[350]!,
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
        ],
      ),
    );
  }
}
