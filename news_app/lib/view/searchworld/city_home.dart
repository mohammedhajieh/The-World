import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:news_app/controller/city_controller.dart';
import 'package:news_app/controller/network_connection.dart';
import 'package:news_app/main.dart';
import 'package:news_app/model/city.dart';
import 'package:news_app/model/responsiveui.dart';
import 'package:news_app/utils/custom_appbar.dart';
import 'package:news_app/utils/custom_internet.dart';
import 'package:news_app/utils/shimmer_citystate.dart';
import 'package:news_app/view/Weather/weather_search.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CityHome extends StatelessWidget {
  CityHome({Key? key, required this.q}) : super(key: key);
  final String q;
  final CityCon controller = Get.put(CityCon());

  @override
  Widget build(BuildContext context) {
    final ConnectionManagerController controllers =
        Get.find<ConnectionManagerController>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar().appBar(title: Text('City'.tr), center: true),
      body: Obx(
        () => controllers.connectionType.value == 1 ||
                controllers.connectionType.value == 2
            ? FutureBuilder(
                future: sharedPref!.getString("lang") == null
                    ? Get.deviceLocale?.languageCode == "en"
                        ? controller.cityData(q, 'en')
                        : controller.cityData(q, 'ar')
                    : Locale(sharedPref!.getString("lang")!).languageCode ==
                            "en"
                        ? controller.cityData(q, 'en')
                        : controller.cityData(q, 'ar'),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: ShimmerCityState());
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(14),
                          child: TextField(
                            controller: controller.searchController,
                            onChanged: (_) {
                              controller.filterCity();
                            },
                            keyboardAppearance: Get.isDarkMode
                                ? Brightness.dark
                                : Brightness.light,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                    fontSize: 16.sp /
                                        MediaQuery.of(context).textScaler.scale(
                                            ResponsiveUi()
                                                .textScaleFactor(context))),
                            cursorColor: Colors.grey,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(22),
                                ),
                                borderSide: BorderSide(
                                    color: Theme.of(context).iconTheme.color!),
                              ),
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                      fontSize: 16.sp /
                                          MediaQuery.of(context)
                                              .textScaler
                                              .scale(ResponsiveUi()
                                                  .textScaleFactor(context))),
                              labelStyle: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      fontSize: 16.sp /
                                          MediaQuery.of(context)
                                              .textScaler
                                              .scale(ResponsiveUi()
                                                  .textScaleFactor(context))),
                              labelText: 'Search...'.tr,
                              hintText: 'Enter City Name'.tr,
                              prefixIcon: Icon(
                                Icons.search,
                                color: Theme.of(context).iconTheme.color,
                              ),
                              contentPadding: const EdgeInsets.all(16),
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(22),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Obx(
                          () {
                            List<CityClass> cityList = controller.myList1.value;
                            return ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: cityList.length,
                              itemBuilder: (context, index) {
                                final city = cityList[index];
                                return InkWell(
                                  onTap: () {
                                    showModalBottomSheet(
                                      context: context,
                                      showDragHandle: true,
                                      enableDrag: true,
                                      isScrollControlled: true,
                                      useSafeArea: true,
                                      clipBehavior: Clip.hardEdge,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(20),
                                        ),
                                      ),
                                      builder: (context) => SizedBox(
                                        height: ResponsiveUi()
                                            .getMediaQueryHeight(
                                                context: context, value: 700),
                                        child: WeatherSearch(
                                            lat: city.lat,
                                            lon: city.lng,
                                            name: city.name),
                                      ),
                                    );
                                  },
                                  child: ListTile(
                                    title: Text(
                                      city.name,
                                      textScaler: TextScaler.linear(
                                          ResponsiveUi()
                                              .textScaleFactor(context)),
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ],
                    );
                  }
                },
              )
            : const CustomInternet(),
      ),
    );
  }
}
