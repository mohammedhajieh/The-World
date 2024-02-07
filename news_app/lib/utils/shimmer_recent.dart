import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/model/responsiveui.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerRecent extends StatelessWidget {
  const ShimmerRecent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Shimmer.fromColors(
          baseColor: Get.isDarkMode ? Colors.grey[700]! : Colors.grey[350]!,
          highlightColor: Get.isDarkMode ? Colors.grey[50]! : Colors.grey[50]!,
          enabled: true,
          child: Container(
            padding: const EdgeInsets.only(left: 5.0, right: 5.0, bottom: 10.0),
            child: Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Stack(
                children: [
                  SizedBox(
                    height: double.infinity,
                    width: double.infinity,
                    child: CachedNetworkImage(
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
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          stops: const [
                            0.1,
                            0.9
                          ],
                          colors: [
                            Colors.black.withOpacity(0.9),
                            Colors.white.withOpacity(0.0)
                          ]),
                    ),
                  ),
                  Positioned(
                    bottom: 30.0,
                    child: Container(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                      width: ResponsiveUi()
                          .getMediaQueryWidth(context: context, value: 350),
                      child: Column(
                        children: [
                          Text(
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            '',
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
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: const Text(
                      '',
                      style: TextStyle(
                        color: Colors.white54,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
