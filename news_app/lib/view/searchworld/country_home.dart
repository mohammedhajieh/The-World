import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/country_controller.dart';
import 'package:news_app/controller/network_connection.dart';
import 'package:news_app/main.dart';
import 'package:news_app/model/country.dart';
import 'package:news_app/model/responsiveui.dart';
import 'package:news_app/utils/custom_appbar.dart';
import 'package:news_app/utils/custom_internet.dart';
import 'package:news_app/utils/shimmer_country.dart';
import 'package:news_app/view/searchworld/state_home.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CountryHome extends StatelessWidget {
  CountryHome({Key? key}) : super(key: key);
  final CountryCon controller = Get.put(CountryCon());

  @override
  Widget build(BuildContext context) {
    final ConnectionManagerController controllers =
        Get.find<ConnectionManagerController>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar().appBar(title: Text('Country'.tr), center: true),
      body: Obx(
        () => controllers.connectionType.value == 1 ||
                controllers.connectionType.value == 2
            ? FutureBuilder(
                future: sharedPref!.getString("lang") == null
                    ? Get.deviceLocale?.languageCode == "en"
                        ? controller.countryData('en')
                        : controller.countryData('ar')
                    : Locale(sharedPref!.getString("lang")!).languageCode ==
                            "en"
                        ? controller.countryData('en')
                        : controller.countryData('ar'),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: ShimmerCountry());
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
                              hintText: 'Enter Country Name'.tr,
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
                            List<Country> countryList =
                                controller.myList1.value;
                            return ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: countryList.length,
                              itemBuilder: (context, index) {
                                final country = countryList[index];
                                return InkWell(
                                  onTap: () {
                                    Get.to(() => StateHome(
                                          id: country.geonameId,
                                        ));
                                  },
                                  child: ListTile(
                                    title: Text(
                                      country.countryName,
                                      textScaler: TextScaler.linear(
                                          ResponsiveUi()
                                              .textScaleFactor(context)),
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
                                    ),
                                    leading: CachedNetworkImage(
                                      placeholder: (context, url) => Center(
                                          child: CircularProgressIndicator(
                                        color:
                                            Theme.of(context).iconTheme.color,
                                      )),
                                      errorWidget: (context, url, error) =>
                                          const Center(
                                              child: Icon(Icons.error)),
                                      imageUrl: country.flagUrl,
                                      height: ResponsiveUi()
                                          .getMediaQueryHeight(
                                              context: context, value: 50),
                                      width: ResponsiveUi().getMediaQueryWidth(
                                          context: context, value: 50),
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
