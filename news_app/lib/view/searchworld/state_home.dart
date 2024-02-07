import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/network_connection.dart';
import 'package:news_app/controller/state_controller.dart';
import 'package:news_app/main.dart';
import 'package:news_app/model/city.dart';
import 'package:news_app/model/responsiveui.dart';
import 'package:news_app/utils/custom_appbar.dart';
import 'package:news_app/utils/custom_internet.dart';
import 'package:news_app/utils/shimmer_citystate.dart';
import 'package:news_app/view/searchworld/city_home.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class StateHome extends StatelessWidget {
  StateHome({Key? key, required this.id}) : super(key: key);
  final int id;
  final StateCon controller = Get.put(StateCon());

  @override
  Widget build(BuildContext context) {
    final ConnectionManagerController controllers =
        Get.find<ConnectionManagerController>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar:
          CustomAppBar().appBar(title: Text('Governorate'.tr), center: true),
      body: Obx(
        () => controllers.connectionType.value == 1 ||
                controllers.connectionType.value == 2
            ? FutureBuilder(
                future: sharedPref!.getString("lang") == null
                    ? Get.deviceLocale?.languageCode == "en"
                        ? controller.stateData(id, 'en')
                        : controller.stateData(id, 'ar')
                    : Locale(sharedPref!.getString("lang")!).languageCode ==
                            "en"
                        ? controller.stateData(id, 'en')
                        : controller.stateData(id, 'ar'),
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
                              hintText: 'Enter Governorate Name'.tr,
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
                            List<CityClass> stateList =
                                controller.myList1.value;
                            return ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: stateList.length,
                              itemBuilder: (context, index) {
                                final state = stateList[index];
                                return InkWell(
                                  onTap: () {
                                    Get.to(() => CityHome(
                                          q: state.toponymName,
                                        ));
                                  },
                                  child: ListTile(
                                    title: Text(
                                      state.name,
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
