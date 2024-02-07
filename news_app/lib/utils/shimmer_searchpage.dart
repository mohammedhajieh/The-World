import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/model/responsiveui.dart';
import 'package:news_app/utils/custom_parallax.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerSearchPage extends StatelessWidget {
  ShimmerSearchPage({super.key});

  final GlobalKey _backgroundImageKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Get.isDarkMode ? Colors.grey[700]! : Colors.grey[350]!,
      highlightColor: Get.isDarkMode ? Colors.grey[50]! : Colors.grey[50]!,
      enabled: true,
      child: AspectRatio(
        aspectRatio: 16 / 10,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Container(
            padding: const EdgeInsets.only(left: 5.0, right: 5.0, bottom: 10.0),
            child: Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Stack(
                children: [
                  Flow(
                    delegate: ParallaxFlowDelegate(
                      scrollable: Scrollable.of(context),
                      listItemContext: context,
                      backgroundImageKey: _backgroundImageKey,
                    ),
                    children: [
                      CachedNetworkImage(
                        height: ResponsiveUi()
                            .getMediaQueryHeight(context: context, value: 320),
                        key: _backgroundImageKey,
                        fit: BoxFit.fill,
                        imageUrl: '',
                        placeholder: (context, url) => Center(
                            child: CircularProgressIndicator(
                          color: Theme.of(context).iconTheme.color,
                        )),
                        errorWidget: (context, url, error) =>
                            const Center(child: Icon(Icons.error)),
                      ),
                    ],
                  ),
                  Positioned.fill(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.7)
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: const [0.6, 0.95],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 25.0,
                    child: Container(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                      width: ResponsiveUi()
                          .getMediaQueryWidth(context: context, value: 350),
                      child: Column(
                        children: [
                          Text(
                            textScaler: TextScaler.linear(
                                ResponsiveUi().textScaleFactor(context)),
                            maxLines: 3,
                            '',
                            textAlign: TextAlign.start,
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(
                                  color: Colors.white,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomRight,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                    child: Text(
                      '',
                      textScaler: TextScaler.linear(
                          ResponsiveUi().textScaleFactor(context)),
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            color: Colors.white54,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
