import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/model/responsiveui.dart';
import 'package:news_app/view/NewsDetail/news_detail.dart';

class CustomNews extends StatelessWidget {
  const CustomNews({super.key, required this.n});
  final NewsModel n;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      child: InkWell(
        onTap: () {
          Get.to(
            () => NewsDetail(
              n: n,
            ),
          );
        },
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
                  imageUrl: n.urlToImage,
                  placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(
                      color: Theme.of(context).iconTheme.color,
                    ),
                  ),
                  errorWidget: (context, url, error) => Center(
                    child: Lottie.asset(
                      'assets/Lottie/Animation - 1704298513408.json',
                      height: 500,
                      width: 500,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: ResponsiveUi()
                    .getMediaQueryWidth(context: context, value: 20),
              ),
              Expanded(
                child: SizedBox(
                  height: ResponsiveUi()
                      .getMediaQueryHeight(context: context, value: 130),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child: Text(
                              textScaler: TextScaler.linear(
                                  ResponsiveUi().textScaleFactor(context)),
                              n.title,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              style: Theme.of(context).textTheme.labelMedium)),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              Jiffy.parse(
                                      DateTime.parse(n.publishedAt.toString())
                                          .toString())
                                  .fromNow(),
                              textScaler: TextScaler.linear(
                                  ResponsiveUi().textScaleFactor(context)),
                              style: Theme.of(context).textTheme.labelSmall),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
