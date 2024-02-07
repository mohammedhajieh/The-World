import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:news_app/controller/clock_controller.dart';
import 'package:news_app/controller/network_connection.dart';
import 'package:news_app/model/clock.dart';
import 'package:news_app/model/network_image.dart';
import 'package:news_app/model/responsiveui.dart';
import 'package:news_app/utils/custom_clock.dart';
import 'package:news_app/utils/custom_internet.dart';
import 'package:news_app/utils/custom_nosearch.dart';
import 'package:news_app/utils/shimmer_clock.dart';
import 'package:news_app/utils/shimmer_search_world.dart';

class SearchClock extends SearchDelegate {
  final cont = Get.lazyPut(() => ConnectionManagerController());
  final ConnectionManagerController controller =
      Get.find<ConnectionManagerController>();

  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        icon: const Icon(
          Icons.close,
          size: 26,
        ),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back, size: 26),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  String selectedResult = "";

  @override
  Widget buildResults(BuildContext context) {
    return Obx(
      () => controller.connectionType.value == 1 ||
              controller.connectionType.value == 2
          ? StreamBuilder(
              stream: ClockController()
                  .clockWorldZone(selectedResult.replaceAll(', ', '/'))
                  .asStream(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Center(
                    child: CustomNoSearch(),
                  );
                } else if (snapshot.hasData) {
                  Clock? data = snapshot.data;
                  return Stack(
                    children: [
                      if (data!.currentLocalTime!.hour >= 0 &&
                          data.currentLocalTime!.hour <= 6)
                        const Image(
                          image: NetworkImage(NetworkPhoto.goodNight),
                          fit: BoxFit.fill,
                          height: double.infinity,
                          width: double.infinity,
                        )
                      else if (data.currentLocalTime!.hour >= 7 &&
                          data.currentLocalTime!.hour <= 12)
                        const Image(
                          image: NetworkImage(NetworkPhoto.googMorning),
                          fit: BoxFit.fill,
                          height: double.infinity,
                          width: double.infinity,
                        )
                      else if (data.currentLocalTime!.hour >= 13 &&
                          data.currentLocalTime!.hour <= 18)
                        const Image(
                          image: NetworkImage(NetworkPhoto.goodAfternoon),
                          fit: BoxFit.fill,
                          height: double.infinity,
                          width: double.infinity,
                        )
                      else if (data.currentLocalTime!.hour >= 19 &&
                          data.currentLocalTime!.hour <= 23)
                        const Image(
                          image: NetworkImage(NetworkPhoto.goodEvning),
                          fit: BoxFit.fill,
                          height: double.infinity,
                          width: double.infinity,
                        ),
                      ListView(
                        physics: const BouncingScrollPhysics(),
                        children: [
                          SizedBox(
                            height: ResponsiveUi().getMediaQueryHeight(
                                context: context, value: 50),
                          ),
                          if (data.currentLocalTime!.hour >= 0 &&
                              data.currentLocalTime!.hour <= 6)
                            Column(
                              children: [
                                Text(
                                  'Good Night!!'.tr,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displaySmall!
                                      .copyWith(color: Colors.white),
                                  textAlign: TextAlign.center,
                                  textScaler: TextScaler.linear(
                                      ResponsiveUi().textScaleFactor(context)),
                                ),
                                SizedBox(
                                  height: ResponsiveUi().getMediaQueryHeight(
                                      context: context, value: 15),
                                ),
                                Text(
                                  data.timeZone!.replaceAll('/', ','),
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium!
                                      .copyWith(color: Colors.white),
                                  textAlign: TextAlign.center,
                                  textScaler: TextScaler.linear(
                                      ResponsiveUi().textScaleFactor(context)),
                                ),
                                SizedBox(
                                  height: ResponsiveUi().getMediaQueryHeight(
                                      context: context, value: 15),
                                ),
                                Text(
                                  Jiffy.parse(data.currentLocalTime.toString())
                                      .yMMMMEEEEd,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium!
                                      .copyWith(color: Colors.white),
                                  textAlign: TextAlign.center,
                                  textScaler: TextScaler.linear(
                                      ResponsiveUi().textScaleFactor(context)),
                                ),
                              ],
                            )
                          else if (data.currentLocalTime!.hour >= 7 &&
                              data.currentLocalTime!.hour <= 12)
                            Column(
                              children: [
                                Text(
                                  'Good Morning!!'.tr,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displaySmall!
                                      .copyWith(color: Colors.black),
                                  textAlign: TextAlign.center,
                                  textScaler: TextScaler.linear(
                                      ResponsiveUi().textScaleFactor(context)),
                                ),
                                SizedBox(
                                  height: ResponsiveUi().getMediaQueryHeight(
                                      context: context, value: 15),
                                ),
                                Text(
                                  data.timeZone!.replaceAll('/', ','),
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium!
                                      .copyWith(color: Colors.black),
                                  textAlign: TextAlign.center,
                                  textScaler: TextScaler.linear(
                                      ResponsiveUi().textScaleFactor(context)),
                                ),
                                SizedBox(
                                  height: ResponsiveUi().getMediaQueryHeight(
                                      context: context, value: 15),
                                ),
                                Text(
                                  Jiffy.parse(data.currentLocalTime.toString())
                                      .yMMMMEEEEd,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium!
                                      .copyWith(color: Colors.black),
                                  textAlign: TextAlign.center,
                                  textScaler: TextScaler.linear(
                                      ResponsiveUi().textScaleFactor(context)),
                                ),
                              ],
                            )
                          else if (data.currentLocalTime!.hour >= 13 &&
                              data.currentLocalTime!.hour <= 18)
                            Column(
                              children: [
                                Text(
                                  'Good Afternoon!!'.tr,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displaySmall!
                                      .copyWith(color: Colors.black),
                                  textAlign: TextAlign.center,
                                  textScaler: TextScaler.linear(
                                      ResponsiveUi().textScaleFactor(context)),
                                ),
                                SizedBox(
                                  height: ResponsiveUi().getMediaQueryHeight(
                                      context: context, value: 15),
                                ),
                                Text(
                                  data.timeZone!.replaceAll('/', ','),
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium!
                                      .copyWith(color: Colors.black),
                                  textAlign: TextAlign.center,
                                  textScaler: TextScaler.linear(
                                      ResponsiveUi().textScaleFactor(context)),
                                ),
                                SizedBox(
                                  height: ResponsiveUi().getMediaQueryHeight(
                                      context: context, value: 15),
                                ),
                                Text(
                                  Jiffy.parse(data.currentLocalTime.toString())
                                      .yMMMMEEEEd,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium!
                                      .copyWith(color: Colors.black),
                                  textAlign: TextAlign.center,
                                  textScaler: TextScaler.linear(
                                      ResponsiveUi().textScaleFactor(context)),
                                ),
                              ],
                            )
                          else if (data.currentLocalTime!.hour >= 19 &&
                              data.currentLocalTime!.hour <= 23)
                            Column(
                              children: [
                                Text(
                                  'Good Evening!!'.tr,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displaySmall!
                                      .copyWith(color: Colors.white),
                                  textAlign: TextAlign.center,
                                  textScaler: TextScaler.linear(
                                      ResponsiveUi().textScaleFactor(context)),
                                ),
                                SizedBox(
                                  height: ResponsiveUi().getMediaQueryHeight(
                                      context: context, value: 15),
                                ),
                                Text(
                                  data.timeZone!.replaceAll('/', ','),
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium!
                                      .copyWith(color: Colors.white),
                                  textAlign: TextAlign.center,
                                  textScaler: TextScaler.linear(
                                      ResponsiveUi().textScaleFactor(context)),
                                ),
                                SizedBox(
                                  height: ResponsiveUi().getMediaQueryHeight(
                                      context: context, value: 15),
                                ),
                                Text(
                                  Jiffy.parse(data.currentLocalTime.toString())
                                      .yMMMMEEEEd,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium!
                                      .copyWith(color: Colors.white),
                                  textAlign: TextAlign.center,
                                  textScaler: TextScaler.linear(
                                      ResponsiveUi().textScaleFactor(context)),
                                ),
                              ],
                            ),
                          SizedBox(
                            height: ResponsiveUi().getMediaQueryHeight(
                                context: context, value: 30),
                          ),
                          CustomClock(
                            dateTime: data.currentLocalTime,
                          ),
                        ],
                      ),
                    ],
                  );
                } else {
                  return const ShimmerClock();
                }
              },
            )
          : const CustomInternet(),
    );
  }

  SearchClock();

  @override
  Widget buildSuggestions(BuildContext context) {
    return Obx(
      () => controller.connectionType.value == 1 ||
              controller.connectionType.value == 2
          ? FutureBuilder(
              future: ClockController().clockTimeZone(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text(
                    'Error',
                    style: Theme.of(context).textTheme.bodyLarge,
                  );
                } else if (!snapshot.hasData) {
                  return ListView.builder(
                    itemBuilder: (context, index) => const ShimmerSearchWorld(),
                    itemCount: 20,
                  );
                } else {
                  List<String> suggestionList = [];
                  suggestionList.addAll(snapshot.data as Iterable<String>);
                  List<String> filteredList = [];

                  query.isEmpty
                      ? filteredList = suggestionList //In the true case
                      : filteredList.addAll(
                          suggestionList.where(
                            // In the false case
                            (element) =>
                                element
                                    .replaceAll(' ', '')
                                    .replaceAll('/', '')
                                    .toLowerCase()
                                    .contains(query
                                        .toLowerCase()
                                        .replaceAll(' ', '')
                                        .replaceAll('/', '')) ||
                                element
                                    .replaceAll(' ', '')
                                    .replaceAll('/', '')
                                    .toUpperCase()
                                    .contains(query
                                        .toUpperCase()
                                        .replaceAll(' ', '')
                                        .replaceAll('/', '')),
                          ),
                        );

                  return ListView.builder(
                    itemCount: filteredList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          filteredList[index].replaceAll('/', ', '),
                          textScaler: TextScaler.linear(
                              ResponsiveUi().textScaleFactor(context)),
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        onTap: () {
                          selectedResult = filteredList[index];
                          showResults(context);
                        },
                      );
                    },
                  );
                }
              },
            )
          : const CustomInternet(),
    );
  }
}
