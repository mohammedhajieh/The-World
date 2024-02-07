import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/model/responsiveui.dart';
import 'package:news_app/utils/custom_parallax.dart';
import 'package:news_app/view/NewsDetail/news_detail.dart';

class CustomSearchPage extends StatelessWidget {
  CustomSearchPage({super.key, required this.nr});

  final GlobalKey _backgroundImageKey = GlobalKey();
  final NewsModel nr;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(
          () => NewsDetail(
            n: nr,
          ),
        );
      },
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
                        imageUrl: nr.urlToImage,
                        placeholder: (context, url) => Center(
                            child: CircularProgressIndicator(
                          color: Theme.of(context).iconTheme.color,
                        )),
                        errorWidget: (context, url, error) => Center(
                          child: Lottie.asset(
                            'assets/Lottie/Animation - 1704298513408.json',
                            height: 500,
                            width: 500,
                          ),
                        ),
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
                            nr.title,
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
                      Jiffy.parse(DateTime.parse(nr.publishedAt.toString())
                              .toString())
                          .fromNow(),
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
