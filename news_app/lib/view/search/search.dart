import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/hide_controller.dart';
import 'package:news_app/controller/network_connection.dart';
import 'package:news_app/controller/news_controller.dart';
import 'package:news_app/main.dart';
import 'package:news_app/model/my_delegate.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/model/responsiveui.dart';
import 'package:news_app/utils/custom_breaking_news.dart';
import 'package:news_app/utils/custom_internet.dart';
import 'package:news_app/utils/custom_searchnews.dart';
import 'package:news_app/utils/shimmer_breaking.dart';

class Search extends StatelessWidget {
  Search({super.key});
  final cont = Get.lazyPut(() => ConnectionManagerController());
  final ConnectionManagerController controller =
      Get.find<ConnectionManagerController>();
  @override
  Widget build(BuildContext context) {
    List<String> tabs = [
      'Business',
      'Entertainment',
      'General',
      'Health',
      'Science',
      'Sports',
      'Technology',
    ];
    return Obx(
      () => controller.connectionType.value == 1 ||
              controller.connectionType.value == 2
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              child: GetBuilder<Hide>(
                init: Hide(),
                builder: (controller) => DefaultTabController(
                  length: tabs.length,
                  initialIndex: 0,
                  child: NestedScrollView(
                    controller: controller.scrollController,
                    physics: const NeverScrollableScrollPhysics(),
                    headerSliverBuilder: (context, isScolled) {
                      return [
                        SliverAppBar(
                          backgroundColor:
                              Theme.of(context).scaffoldBackgroundColor,
                          collapsedHeight: ResponsiveUi().getMediaQueryHeight(
                              context: context, value: 220),
                          expandedHeight: ResponsiveUi().getMediaQueryHeight(
                              context: context, value: 220),
                          flexibleSpace: CustomSearchNews(
                            controller: TextEditingController(),
                          ),
                        ),
                        SliverPersistentHeader(
                          delegate: MyDelegate(
                            TabBar(
                              tabAlignment: TabAlignment.start,
                              physics: const BouncingScrollPhysics(),
                              isScrollable: true,
                              indicatorColor: Theme.of(context).iconTheme.color,
                              tabs: tabs
                                  .map(
                                    (tab) => Tab(
                                      icon: Text(
                                          textScaler: TextScaler.linear(
                                              ResponsiveUi()
                                                  .textScaleFactor(context)),
                                          tab.tr,
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayMedium),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                          floating: true,
                          pinned: true,
                        )
                      ];
                    },
                    body: Column(
                      children: [
                        SizedBox(
                          height: ResponsiveUi()
                              .getMediaQueryHeight(context: context, value: 10),
                        ),
                        Expanded(
                          child: TabBarView(
                              physics: const BouncingScrollPhysics(),
                              children: tabs
                                  .map(
                                    (e) => FutureBuilder(
                                      future: sharedPref!.getString("lang") ==
                                              null
                                          ? Get.deviceLocale?.languageCode ==
                                                  "en"
                                              ? NewsController()
                                                  .getNewsCategory('en', e)
                                              : NewsController()
                                                  .getNewsCategory('ar', e)
                                          : Locale(sharedPref!
                                                          .getString("lang")!)
                                                      .languageCode ==
                                                  "en"
                                              ? NewsController()
                                                  .getNewsCategory('en', e)
                                              : NewsController()
                                                  .getNewsCategory('ar', e),
                                      builder: (context, snapshot) {
                                        if (snapshot.hasError) {
                                          return Text(
                                            'Error',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge,
                                          );
                                        } else if (!snapshot.hasData) {
                                          return ListView.builder(
                                            itemBuilder: (context, index) =>
                                                const ShimmerBreaking(),
                                            shrinkWrap: true,
                                            itemCount: 6,
                                          );
                                        } else {
                                          List<NewsModel> newsList = [];
                                          newsList.addAll(
                                              snapshot.data as List<NewsModel>);
                                          return ListView.builder(
                                            physics:
                                                const BouncingScrollPhysics(),
                                            shrinkWrap: true,
                                            itemCount: newsList.length,
                                            itemBuilder: (context, index) {
                                              return CustomNews(
                                                  n: newsList[index]);
                                            },
                                          );
                                        }
                                      },
                                    ),
                                  )
                                  .toList()),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          : const CustomInternet(),
    );
  }
}
