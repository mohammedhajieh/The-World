import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/model/responsiveui.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerTicker extends StatelessWidget {
  const ShimmerTicker({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      children: [
        Column(
          children: [
            Shimmer.fromColors(
              baseColor: Get.isDarkMode ? Colors.grey[700]! : Colors.grey[350]!,
              highlightColor:
                  Get.isDarkMode ? Colors.grey[50]! : Colors.grey[50]!,
              enabled: true,
              child: Container(
                width: ResponsiveUi().getMediaQueryWidth(
                    context: context, value: double.infinity),
                height: ResponsiveUi()
                    .getMediaQueryHeight(context: context, value: 40),
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
