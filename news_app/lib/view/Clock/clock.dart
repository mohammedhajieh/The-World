import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:news_app/controller/location_controller.dart';
import 'package:news_app/controller/network_connection.dart';
import 'package:news_app/model/clock.dart';
import 'package:news_app/model/network_image.dart';
import 'package:news_app/model/responsiveui.dart';
import 'package:news_app/utils/custom_clock.dart';
import 'package:news_app/utils/custom_internet.dart';
import 'package:news_app/utils/custom_search_timezone.dart';
import 'package:news_app/utils/shimmer_clock.dart';

class HomeClock extends StatelessWidget {
  HomeClock({super.key});
  final cont = Get.lazyPut(() => ConnectionManagerController());
  final ConnectionManagerController controller =
      Get.find<ConnectionManagerController>();
  final LocationController co = Get.put(LocationController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.connectionType.value == 1 ||
              controller.connectionType.value == 2
          ? co.checkLoading().isFalse
              ? const ShimmerClock()
              : GetBuilder<LocationController>(
                  init: LocationController(),
                  builder: (controller) => StreamBuilder(
                    stream: controller
                        .getData()
                        .clockLocation(
                            co.getLattitude().value, co.getLongitude().value)
                        .asStream(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text(
                          'Error',
                          style: Theme.of(context).textTheme.bodyLarge,
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
                                const CustomTimeZone(),
                                SizedBox(
                                  height: ResponsiveUi().getMediaQueryHeight(
                                      context: context, value: 10),
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
                                            ResponsiveUi()
                                                .textScaleFactor(context)),
                                      ),
                                      SizedBox(
                                        height: ResponsiveUi()
                                            .getMediaQueryHeight(
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
                                            ResponsiveUi()
                                                .textScaleFactor(context)),
                                      ),
                                      SizedBox(
                                        height: ResponsiveUi()
                                            .getMediaQueryHeight(
                                                context: context, value: 15),
                                      ),
                                      Text(
                                        Jiffy.parse(data.currentLocalTime
                                                .toString())
                                            .yMMMMEEEEd,
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium!
                                            .copyWith(color: Colors.white),
                                        textAlign: TextAlign.center,
                                        textScaler: TextScaler.linear(
                                            ResponsiveUi()
                                                .textScaleFactor(context)),
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
                                            ResponsiveUi()
                                                .textScaleFactor(context)),
                                      ),
                                      SizedBox(
                                        height: ResponsiveUi()
                                            .getMediaQueryHeight(
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
                                            ResponsiveUi()
                                                .textScaleFactor(context)),
                                      ),
                                      SizedBox(
                                        height: ResponsiveUi()
                                            .getMediaQueryHeight(
                                                context: context, value: 15),
                                      ),
                                      Text(
                                        Jiffy.parse(data.currentLocalTime
                                                .toString())
                                            .yMMMMEEEEd,
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium!
                                            .copyWith(color: Colors.black),
                                        textAlign: TextAlign.center,
                                        textScaler: TextScaler.linear(
                                            ResponsiveUi()
                                                .textScaleFactor(context)),
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
                                            ResponsiveUi()
                                                .textScaleFactor(context)),
                                      ),
                                      SizedBox(
                                        height: ResponsiveUi()
                                            .getMediaQueryHeight(
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
                                            ResponsiveUi()
                                                .textScaleFactor(context)),
                                      ),
                                      SizedBox(
                                        height: ResponsiveUi()
                                            .getMediaQueryHeight(
                                                context: context, value: 15),
                                      ),
                                      Text(
                                        Jiffy.parse(data.currentLocalTime
                                                .toString())
                                            .yMMMMEEEEd,
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium!
                                            .copyWith(color: Colors.black),
                                        textAlign: TextAlign.center,
                                        textScaler: TextScaler.linear(
                                            ResponsiveUi()
                                                .textScaleFactor(context)),
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
                                            ResponsiveUi()
                                                .textScaleFactor(context)),
                                      ),
                                      SizedBox(
                                        height: ResponsiveUi()
                                            .getMediaQueryHeight(
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
                                            ResponsiveUi()
                                                .textScaleFactor(context)),
                                      ),
                                      SizedBox(
                                        height: ResponsiveUi()
                                            .getMediaQueryHeight(
                                                context: context, value: 15),
                                      ),
                                      Text(
                                        Jiffy.parse(data.currentLocalTime
                                                .toString())
                                            .yMMMMEEEEd,
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium!
                                            .copyWith(color: Colors.white),
                                        textAlign: TextAlign.center,
                                        textScaler: TextScaler.linear(
                                            ResponsiveUi()
                                                .textScaleFactor(context)),
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
                  ),
                )
          : const CustomInternet(),
    );
  }
}
