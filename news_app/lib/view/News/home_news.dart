import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/hide_controller.dart';
import 'package:news_app/controller/network_connection.dart';
import 'package:news_app/controller/news_controller.dart';
import 'package:news_app/main.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/model/responsiveui.dart';
import 'package:news_app/utils/custom_breaking_news.dart';
import 'package:news_app/utils/custom_internet.dart';
import 'package:news_app/utils/custom_recent_news.dart';
import 'package:news_app/utils/custom_ticker_news.dart';
import 'package:news_app/utils/shimmer_recent.dart';
import 'package:news_app/utils/shimmer_breaking.dart';
import 'package:news_app/utils/shimmer_ticker.dart';

class HomeNews extends StatelessWidget {
  HomeNews({super.key});
  final cont = Get.lazyPut(() => ConnectionManagerController());
  final ConnectionManagerController controller =
      Get.find<ConnectionManagerController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.connectionType.value == 1 ||
            controller.connectionType.value == 2
        ? GetBuilder<Hide>(
            init: Hide(),
            builder: (controller) => ListView(
              controller: controller.scrollController,
              physics: const BouncingScrollPhysics(),
              children: [
                FutureBuilder(
                  future: sharedPref!.getString("lang") == null
                      ? Get.deviceLocale?.languageCode == "en"
                          ? NewsController().getNewsTicker('en')
                          : NewsController().getNewsTicker('ar')
                      : Locale(sharedPref!.getString("lang")!).languageCode ==
                              "en"
                          ? NewsController().getNewsTicker('en')
                          : NewsController().getNewsTicker('ar'),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text(
                        'Error',
                        style: Theme.of(context).textTheme.bodyLarge,
                      );
                    } else if (!snapshot.hasData) {
                      return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => const ShimmerTicker(),
                        shrinkWrap: true,
                        itemCount: 1,
                      );
                    } else {
                      List<NewsModel> newsList = [];
                      newsList.addAll(snapshot.data as List<NewsModel>);
                      return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) =>
                            TickerNews(n: newsList[index]),
                        itemCount: 1,
                      );
                    }
                  },
                ),
                SizedBox(
                  height: ResponsiveUi()
                      .getMediaQueryHeight(context: context, value: 5),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Text(
                    textScaler: TextScaler.linear(
                        ResponsiveUi().textScaleFactor(context)),
                    'Recent News'.tr,
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ),
                SizedBox(
                  height: ResponsiveUi()
                      .getMediaQueryHeight(context: context, value: 10),
                ),
                FutureBuilder(
                  future: sharedPref!.getString("lang") == null
                      ? Get.deviceLocale?.languageCode == "en"
                          ? NewsController().getNewsRecent('en')
                          : NewsController().getNewsRecent('ar')
                      : Locale(sharedPref!.getString("lang")!).languageCode ==
                              "en"
                          ? NewsController().getNewsRecent('en')
                          : NewsController().getNewsRecent('ar'),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text(
                        'Error',
                        style: Theme.of(context).textTheme.bodyLarge,
                      );
                    } else if (!snapshot.hasData) {
                      return CarouselSlider.builder(
                          options: CarouselOptions(
                            aspectRatio: 16 / 9,
                            viewportFraction: 1,
                            autoPlay: true,
                            autoPlayInterval: const Duration(seconds: 3),
                            autoPlayAnimationDuration:
                                const Duration(milliseconds: 800),
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enlargeCenterPage: true,
                            height: ResponsiveUi().getMediaQueryHeight(
                                context: context, value: 250),
                          ),
                          itemCount: 1,
                          itemBuilder: (BuildContext context, int itemIndex,
                                  int pageViewIndex) =>
                              const ShimmerRecent());
                    } else {
                      List<NewsModel> newsList = [];
                      newsList.addAll(snapshot.data as List<NewsModel>);
                      return CarouselSlider.builder(
                          options: CarouselOptions(
                            aspectRatio: 16 / 9,
                            viewportFraction: 1,
                            autoPlay: true,
                            autoPlayInterval: const Duration(seconds: 3),
                            autoPlayAnimationDuration:
                                const Duration(milliseconds: 800),
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enlargeCenterPage: true,
                            height: ResponsiveUi().getMediaQueryHeight(
                                context: context, value: 250),
                          ),
                          itemCount: newsList.length,
                          itemBuilder: (BuildContext context, int itemIndex,
                                  int pageViewIndex) =>
                              CustomNewsRecent(nr: newsList[itemIndex]));
                    }
                  },
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  child: Text(
                    textScaler: TextScaler.linear(
                        ResponsiveUi().textScaleFactor(context)),
                    'Breaking News'.tr,
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ),
                SizedBox(
                  height: ResponsiveUi()
                      .getMediaQueryHeight(context: context, value: 10),
                ),
                FutureBuilder(
                  future: sharedPref!.getString("lang") == null
                      ? Get.deviceLocale?.languageCode == "en"
                          ? NewsController().getNewsBreaking('en')
                          : NewsController().getNewsBreaking('ar')
                      : Locale(sharedPref!.getString("lang")!).languageCode ==
                              "en"
                          ? NewsController().getNewsBreaking('en')
                          : NewsController().getNewsBreaking('ar'),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text(
                        'Error',
                        style: Theme.of(context).textTheme.bodyLarge,
                      );
                    } else if (!snapshot.hasData) {
                      return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) =>
                            const ShimmerBreaking(),
                        shrinkWrap: true,
                        itemCount: 6,
                      );
                    } else {
                      List<NewsModel> newsList = [];
                      newsList.addAll(snapshot.data as List<NewsModel>);
                      return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) =>
                            CustomNews(n: newsList[index]),
                        itemCount: newsList.length,
                      );
                    }
                  },
                ),
              ],
            ),
          )
        : const CustomInternet());
  }
}
