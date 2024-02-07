import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/model/responsiveui.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerBreaking extends StatelessWidget {
  const ShimmerBreaking({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Shimmer.fromColors(
        baseColor: Get.isDarkMode ? Colors.grey[700]! : Colors.grey[350]!,
        highlightColor: Get.isDarkMode ? Colors.grey[50]! : Colors.grey[50]!,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 5),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Theme.of(context).cardColor),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: ResponsiveUi()
                    .getMediaQueryHeight(context: context, value: 130),
                width: ResponsiveUi()
                    .getMediaQueryWidth(context: context, value: 130),
                clipBehavior: Clip.hardEdge,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: CachedNetworkImage(
                  height: ResponsiveUi()
                      .getMediaQueryHeight(context: context, value: 130),
                  width: ResponsiveUi()
                      .getMediaQueryWidth(context: context, value: 130),
                  alignment: Alignment.center,
                  fit: BoxFit.fill,
                  imageUrl: '',
                  placeholder: (context, url) => Center(
                      child: CircularProgressIndicator(
                    color: Theme.of(context).iconTheme.color,
                  )),
                  errorWidget: (context, url, error) =>
                      const Center(child: Icon(Icons.error)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
