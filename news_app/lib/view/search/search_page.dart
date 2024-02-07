import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/network_connection.dart';
import 'package:news_app/controller/news_controller.dart';
import 'package:news_app/main.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/utils/custom_appbar.dart';
import 'package:news_app/utils/custom_internet.dart';
import 'package:news_app/utils/custom_nosearch.dart';
import 'package:news_app/utils/custom_searchpage.dart';
import 'package:news_app/utils/shimmer_searchpage.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});
  final cont = Get.lazyPut(() => ConnectionManagerController());
  final ConnectionManagerController controller =
      Get.find<ConnectionManagerController>();
  @override
  Widget build(BuildContext context) {
    var fromData = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
        appBar: CustomAppBar().appBar(title: Text('Search'.tr), center: true),
        body: Obx(() => controller.connectionType.value == 1 ||
                controller.connectionType.value == 2
            ? Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                child: FutureBuilder(
                  future: sharedPref!.getString("lang") == null
                      ? Get.deviceLocale?.languageCode == "en"
                          ? NewsController()
                              .getNewsSearch('en', fromData.toString())
                          : NewsController()
                              .getNewsSearch('ar', fromData.toString())
                      : Locale(sharedPref!.getString("lang")!).languageCode ==
                              "en"
                          ? NewsController()
                              .getNewsSearch('en', fromData.toString())
                          : NewsController()
                              .getNewsSearch('ar', fromData.toString()),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text(
                        'Error',
                        style: Theme.of(context).textTheme.bodyLarge,
                      );
                    } else if (!snapshot.hasData) {
                      return ListView.builder(
                        itemBuilder: (context, index) => ShimmerSearchPage(),
                        itemCount: 7,
                      );
                    } else {
                      List<NewsModel> newsList = [];
                      newsList.addAll(snapshot.data as List<NewsModel>);
                      return newsList.isNotEmpty
                          ? ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context, index) =>
                                  CustomSearchPage(nr: newsList[index]),
                              itemCount: newsList.length,
                            )
                          : const CustomNoSearch();
                    }
                  },
                ),
              )
            : const CustomInternet()));
  }
}
