import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/model/lottie.dart';
import 'package:news_app/model/responsiveui.dart';
import 'package:news_app/model/weather_now.dart';
import 'package:news_app/view/searchworld/country_home.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomWeatherNow extends StatelessWidget {
  final WeatherModel weatherDataCurrent;

  const CustomWeatherNow({Key? key, required this.weatherDataCurrent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Get.to(() => CountryHome());
                  },
                  child: Container(
                    height: ResponsiveUi()
                        .getMediaQueryHeight(context: context, value: 50),
                    margin: const EdgeInsets.all(16.0),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: Theme.of(context).appBarTheme.backgroundColor,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const Icon(
                          Icons.search,
                          size: 25,
                          color: Colors.grey,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Text("Search...".tr,
                                textScaler: TextScaler.linear(
                                  ResponsiveUi().textScaleFactor(context),
                                ),
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(fontSize: 16.sp)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                  child: Text(weatherDataCurrent.location.name,
                      textScaler: TextScaler.linear(
                          ResponsiveUi().textScaleFactor(context)),
                      style: Theme.of(context).textTheme.displaySmall),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                  child: Text(
                      Jiffy.parse(
                              weatherDataCurrent.location.localtime.toString())
                          .yMMMMEEEEd,
                      textScaler: TextScaler.linear(
                          ResponsiveUi().textScaleFactor(context)),
                      style: Theme.of(context).textTheme.bodyMedium),
                ),
              ],
            ),
            SizedBox(
              height: ResponsiveUi()
                  .getMediaQueryHeight(context: context, value: 10),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                if (weatherDataCurrent.current.isDay == 1)
                  //
                  if (weatherDataCurrent.current.condition.code == 1000)
                    Lottie.network(
                      LottieImage.sunnyDay,
                      height: ResponsiveUi()
                          .getMediaQueryHeight(context: context, value: 75),
                      width: ResponsiveUi()
                          .getMediaQueryWidth(context: context, value: 75),
                    )
                  else if (weatherDataCurrent.current.condition.code == 1030)
                    Lottie.network(
                      LottieImage.mist,
                      height: ResponsiveUi()
                          .getMediaQueryHeight(context: context, value: 75),
                      width: ResponsiveUi()
                          .getMediaQueryWidth(context: context, value: 75),
                    )
                  else if (weatherDataCurrent.current.condition.code == 1006)
                    Lottie.network(
                      LottieImage.cloudy,
                      height: ResponsiveUi()
                          .getMediaQueryHeight(context: context, value: 75),
                      width: ResponsiveUi()
                          .getMediaQueryWidth(context: context, value: 75),
                    )
                  else if (weatherDataCurrent.current.condition.code == 1003)
                    Lottie.network(
                      LottieImage.partlyCloudyDay,
                      height: ResponsiveUi()
                          .getMediaQueryHeight(context: context, value: 75),
                      width: ResponsiveUi()
                          .getMediaQueryWidth(context: context, value: 75),
                    )
                  else if (weatherDataCurrent.current.condition.code == 1009)
                    Lottie.network(
                      LottieImage.overcastDay,
                      height: ResponsiveUi()
                          .getMediaQueryHeight(context: context, value: 75),
                      width: ResponsiveUi()
                          .getMediaQueryWidth(context: context, value: 75),
                    )
                  else if (weatherDataCurrent.current.condition.code == 1087)
                    Lottie.network(
                      LottieImage.thunderstorms,
                      height: ResponsiveUi()
                          .getMediaQueryHeight(context: context, value: 75),
                      width: ResponsiveUi()
                          .getMediaQueryWidth(context: context, value: 75),
                    )
                  else if (weatherDataCurrent.current.condition.code == 1117)
                    Lottie.network(
                      LottieImage.windSnow,
                      height: ResponsiveUi()
                          .getMediaQueryHeight(context: context, value: 75),
                      width: ResponsiveUi()
                          .getMediaQueryWidth(context: context, value: 75),
                    )
                  else if (weatherDataCurrent.current.condition.code == 1135)
                    Lottie.network(
                      LottieImage.fog,
                      height: ResponsiveUi()
                          .getMediaQueryHeight(context: context, value: 75),
                      width: ResponsiveUi()
                          .getMediaQueryWidth(context: context, value: 75),
                    )
                  else if (weatherDataCurrent.current.condition.code == 1147)
                    Lottie.network(
                      LottieImage.fogExtreme,
                      height: ResponsiveUi()
                          .getMediaQueryHeight(context: context, value: 75),
                      width: ResponsiveUi()
                          .getMediaQueryWidth(context: context, value: 75),
                    )
                  else if (weatherDataCurrent.current.condition.code == 1237 ||
                      weatherDataCurrent.current.condition.code == 1261 ||
                      weatherDataCurrent.current.condition.code == 1264)
                    Lottie.network(
                      LottieImage.icePellets,
                      height: ResponsiveUi()
                          .getMediaQueryHeight(context: context, value: 75),
                      width: ResponsiveUi()
                          .getMediaQueryWidth(context: context, value: 75),
                    )
                  else if (weatherDataCurrent.current.condition.code == 1072)
                    Lottie.network(
                      LottieImage.drizzlePossible,
                      height: ResponsiveUi()
                          .getMediaQueryHeight(context: context, value: 75),
                      width: ResponsiveUi()
                          .getMediaQueryWidth(context: context, value: 75),
                    )
                  else if (weatherDataCurrent.current.condition.code == 1150)
                    Lottie.network(
                      LottieImage.drizzleCloudyDay,
                      height: ResponsiveUi()
                          .getMediaQueryHeight(context: context, value: 75),
                      width: ResponsiveUi()
                          .getMediaQueryWidth(context: context, value: 75),
                    )
                  else if (weatherDataCurrent.current.condition.code == 1153)
                    Lottie.network(
                      LottieImage.drizzleOvercastDay,
                      height: ResponsiveUi()
                          .getMediaQueryHeight(context: context, value: 75),
                      width: ResponsiveUi()
                          .getMediaQueryWidth(context: context, value: 75),
                    )
                  else if (weatherDataCurrent.current.condition.code == 1168)
                    Lottie.network(
                      LottieImage.drizzleExtremeDay,
                      height: ResponsiveUi()
                          .getMediaQueryHeight(context: context, value: 75),
                      width: ResponsiveUi()
                          .getMediaQueryWidth(context: context, value: 75),
                    )
                  else if (weatherDataCurrent.current.condition.code == 1171)
                    Lottie.network(
                      LottieImage.drizzleExtreme,
                      height: ResponsiveUi()
                          .getMediaQueryHeight(context: context, value: 75),
                      width: ResponsiveUi()
                          .getMediaQueryWidth(context: context, value: 75),
                    )
                  else if (weatherDataCurrent.current.condition.code == 1069)
                    Lottie.network(
                      LottieImage.sleetPossible,
                      height: ResponsiveUi()
                          .getMediaQueryHeight(context: context, value: 75),
                      width: ResponsiveUi()
                          .getMediaQueryWidth(context: context, value: 75),
                    )
                  else if (weatherDataCurrent.current.condition.code == 1204)
                    Lottie.network(
                      LottieImage.sleetCloudyDay,
                      height: ResponsiveUi()
                          .getMediaQueryHeight(context: context, value: 75),
                      width: ResponsiveUi()
                          .getMediaQueryWidth(context: context, value: 75),
                    )
                  else if (weatherDataCurrent.current.condition.code == 1207)
                    Lottie.network(
                      LottieImage.sleetOvercastDay,
                      height: ResponsiveUi()
                          .getMediaQueryHeight(context: context, value: 75),
                      width: ResponsiveUi()
                          .getMediaQueryWidth(context: context, value: 75),
                    )
                  else if (weatherDataCurrent.current.condition.code == 1249)
                    Lottie.network(
                      LottieImage.sleetExtremeDay,
                      height: ResponsiveUi()
                          .getMediaQueryHeight(context: context, value: 75),
                      width: ResponsiveUi()
                          .getMediaQueryWidth(context: context, value: 75),
                    )
                  else if (weatherDataCurrent.current.condition.code == 1252)
                    Lottie.network(
                      LottieImage.sleetExtreme,
                      height: ResponsiveUi()
                          .getMediaQueryHeight(context: context, value: 75),
                      width: ResponsiveUi()
                          .getMediaQueryWidth(context: context, value: 75),
                    )
                  else if (weatherDataCurrent.current.condition.code == 1273)
                    Lottie.network(
                      LottieImage.thunderstormsRainDay,
                      height: ResponsiveUi()
                          .getMediaQueryHeight(context: context, value: 75),
                      width: ResponsiveUi()
                          .getMediaQueryWidth(context: context, value: 75),
                    )
                  else if (weatherDataCurrent.current.condition.code == 1276)
                    Lottie.network(
                      LottieImage.thunderstormsRainDayExtreme,
                      height: ResponsiveUi()
                          .getMediaQueryHeight(context: context, value: 75),
                      width: ResponsiveUi()
                          .getMediaQueryWidth(context: context, value: 75),
                    )
                  else if (weatherDataCurrent.current.condition.code == 1279)
                    Lottie.network(
                      LottieImage.thunderstormsSnowDay,
                      height: ResponsiveUi()
                          .getMediaQueryHeight(context: context, value: 75),
                      width: ResponsiveUi()
                          .getMediaQueryWidth(context: context, value: 75),
                    )
                  else if (weatherDataCurrent.current.condition.code == 1282)
                    Lottie.network(
                      LottieImage.thunderstormsSnowDayExtreme,
                      height: ResponsiveUi()
                          .getMediaQueryHeight(context: context, value: 75),
                      width: ResponsiveUi()
                          .getMediaQueryWidth(context: context, value: 75),
                    )
                  else if (weatherDataCurrent.current.condition.code == 1063)
                    Lottie.network(
                      LottieImage.rainPossible,
                      height: ResponsiveUi()
                          .getMediaQueryHeight(context: context, value: 75),
                      width: ResponsiveUi()
                          .getMediaQueryWidth(context: context, value: 75),
                    )
                  else if (weatherDataCurrent.current.condition.code == 1180 ||
                      weatherDataCurrent.current.condition.code == 1183)
                    Lottie.network(
                      LottieImage.rainCloudyDay,
                      height: ResponsiveUi()
                          .getMediaQueryHeight(context: context, value: 75),
                      width: ResponsiveUi()
                          .getMediaQueryWidth(context: context, value: 75),
                    )
                  else if (weatherDataCurrent.current.condition.code == 1186 ||
                      weatherDataCurrent.current.condition.code == 1189)
                    Lottie.network(
                      LottieImage.rainOvercastDay,
                      height: ResponsiveUi()
                          .getMediaQueryHeight(context: context, value: 75),
                      width: ResponsiveUi()
                          .getMediaQueryWidth(context: context, value: 75),
                    )
                  else if (weatherDataCurrent.current.condition.code == 1192 ||
                      weatherDataCurrent.current.condition.code == 1195)
                    Lottie.network(
                      LottieImage.rainExtremeDay,
                      height: ResponsiveUi()
                          .getMediaQueryHeight(context: context, value: 75),
                      width: ResponsiveUi()
                          .getMediaQueryWidth(context: context, value: 75),
                    )
                  else if (weatherDataCurrent.current.condition.code == 1198 ||
                      weatherDataCurrent.current.condition.code == 1201)
                    Lottie.network(
                      LottieImage.rainOvercast,
                      height: ResponsiveUi()
                          .getMediaQueryHeight(context: context, value: 75),
                      width: ResponsiveUi()
                          .getMediaQueryWidth(context: context, value: 75),
                    )
                  else if (weatherDataCurrent.current.condition.code == 1240 ||
                      weatherDataCurrent.current.condition.code == 1243 ||
                      weatherDataCurrent.current.condition.code == 1246)
                    Lottie.network(
                      LottieImage.rainExtreme,
                      height: ResponsiveUi()
                          .getMediaQueryHeight(context: context, value: 75),
                      width: ResponsiveUi()
                          .getMediaQueryWidth(context: context, value: 75),
                    )
                  else if (weatherDataCurrent.current.condition.code == 1066)
                    Lottie.network(
                      LottieImage.snowPossible,
                      height: ResponsiveUi()
                          .getMediaQueryHeight(context: context, value: 75),
                      width: ResponsiveUi()
                          .getMediaQueryWidth(context: context, value: 75),
                    )
                  else if (weatherDataCurrent.current.condition.code == 1114)
                    Lottie.network(
                      LottieImage.snowOvercast,
                      height: ResponsiveUi()
                          .getMediaQueryHeight(context: context, value: 75),
                      width: ResponsiveUi()
                          .getMediaQueryWidth(context: context, value: 75),
                    )
                  else if (weatherDataCurrent.current.condition.code == 1210 ||
                      weatherDataCurrent.current.condition.code == 1213)
                    Lottie.network(
                      LottieImage.snowCloudyDay,
                      height: ResponsiveUi()
                          .getMediaQueryHeight(context: context, value: 75),
                      width: ResponsiveUi()
                          .getMediaQueryWidth(context: context, value: 75),
                    )
                  else if (weatherDataCurrent.current.condition.code == 1216 ||
                      weatherDataCurrent.current.condition.code == 1219)
                    Lottie.network(
                      LottieImage.snowOvercastDay,
                      height: ResponsiveUi()
                          .getMediaQueryHeight(context: context, value: 75),
                      width: ResponsiveUi()
                          .getMediaQueryWidth(context: context, value: 75),
                    )
                  else if (weatherDataCurrent.current.condition.code == 1222 ||
                      weatherDataCurrent.current.condition.code == 1225)
                    Lottie.network(
                      LottieImage.snowExtremeDay,
                      height: ResponsiveUi()
                          .getMediaQueryHeight(context: context, value: 75),
                      width: ResponsiveUi()
                          .getMediaQueryWidth(context: context, value: 75),
                    )
                  else if (weatherDataCurrent.current.condition.code == 1255)
                    Lottie.network(
                      LottieImage.snowExtreme,
                      height: ResponsiveUi()
                          .getMediaQueryHeight(context: context, value: 75),
                      width: ResponsiveUi()
                          .getMediaQueryWidth(context: context, value: 75),
                    )
                  else if (weatherDataCurrent.current.condition.code == 1258)
                    Lottie.network(
                      LottieImage.snowMan,
                      height: ResponsiveUi()
                          .getMediaQueryHeight(context: context, value: 75),
                      width: ResponsiveUi()
                          .getMediaQueryWidth(context: context, value: 75),
                    ),
                if (weatherDataCurrent.current.isDay == 0)
                  //
                  if (weatherDataCurrent.current.condition.code == 1000)
                    Lottie.network(
                      LottieImage.sunnyNight,
                      height: ResponsiveUi()
                          .getMediaQueryHeight(context: context, value: 75),
                      width: ResponsiveUi()
                          .getMediaQueryWidth(context: context, value: 75),
                    )
                  else if (weatherDataCurrent.current.condition.code == 1030)
                    Lottie.network(
                      LottieImage.mist,
                      height: ResponsiveUi()
                          .getMediaQueryHeight(context: context, value: 75),
                      width: ResponsiveUi()
                          .getMediaQueryWidth(context: context, value: 75),
                    )
                  else if (weatherDataCurrent.current.condition.code == 1006)
                    Lottie.network(
                      LottieImage.cloudy,
                      height: ResponsiveUi()
                          .getMediaQueryHeight(context: context, value: 75),
                      width: ResponsiveUi()
                          .getMediaQueryWidth(context: context, value: 75),
                    )
                  else if (weatherDataCurrent.current.condition.code == 1003)
                    Lottie.network(
                      LottieImage.partlyCloudyNight,
                      height: ResponsiveUi()
                          .getMediaQueryHeight(context: context, value: 75),
                      width: ResponsiveUi()
                          .getMediaQueryWidth(context: context, value: 75),
                    )
                  else if (weatherDataCurrent.current.condition.code == 1009)
                    Lottie.network(
                      LottieImage.overcastNight,
                      height: ResponsiveUi()
                          .getMediaQueryHeight(context: context, value: 75),
                      width: ResponsiveUi()
                          .getMediaQueryWidth(context: context, value: 75),
                    )
                  else if (weatherDataCurrent.current.condition.code == 1087)
                    Lottie.network(
                      LottieImage.thunderstorms,
                      height: ResponsiveUi()
                          .getMediaQueryHeight(context: context, value: 75),
                      width: ResponsiveUi()
                          .getMediaQueryWidth(context: context, value: 75),
                    )
                  else if (weatherDataCurrent.current.condition.code == 1117)
                    Lottie.network(
                      LottieImage.windSnow,
                      height: ResponsiveUi()
                          .getMediaQueryHeight(context: context, value: 75),
                      width: ResponsiveUi()
                          .getMediaQueryWidth(context: context, value: 75),
                    )
                  else if (weatherDataCurrent.current.condition.code == 1135)
                    Lottie.network(
                      LottieImage.fog,
                      height: ResponsiveUi()
                          .getMediaQueryHeight(context: context, value: 75),
                      width: ResponsiveUi()
                          .getMediaQueryWidth(context: context, value: 75),
                    )
                  else if (weatherDataCurrent.current.condition.code == 1147)
                    Lottie.network(
                      LottieImage.fogExtreme,
                      height: ResponsiveUi()
                          .getMediaQueryHeight(context: context, value: 75),
                      width: ResponsiveUi()
                          .getMediaQueryWidth(context: context, value: 75),
                    )
                  else if (weatherDataCurrent.current.condition.code == 1237 ||
                      weatherDataCurrent.current.condition.code == 1261 ||
                      weatherDataCurrent.current.condition.code == 1264)
                    Lottie.network(
                      LottieImage.icePellets,
                      height: ResponsiveUi()
                          .getMediaQueryHeight(context: context, value: 75),
                      width: ResponsiveUi()
                          .getMediaQueryWidth(context: context, value: 75),
                    )
                  else if (weatherDataCurrent.current.condition.code == 1072)
                    Lottie.network(
                      LottieImage.drizzlePossible,
                      height: ResponsiveUi()
                          .getMediaQueryHeight(context: context, value: 75),
                      width: ResponsiveUi()
                          .getMediaQueryWidth(context: context, value: 75),
                    )
                  else if (weatherDataCurrent.current.condition.code == 1150)
                    Lottie.network(
                      LottieImage.drizzleCloudyNight,
                      height: ResponsiveUi()
                          .getMediaQueryHeight(context: context, value: 75),
                      width: ResponsiveUi()
                          .getMediaQueryWidth(context: context, value: 75),
                    )
                  else if (weatherDataCurrent.current.condition.code == 1153)
                    Lottie.network(
                      LottieImage.drizzleOvercastNight,
                      height: ResponsiveUi()
                          .getMediaQueryHeight(context: context, value: 75),
                      width: ResponsiveUi()
                          .getMediaQueryWidth(context: context, value: 75),
                    )
                  else if (weatherDataCurrent.current.condition.code == 1168)
                    Lottie.network(
                      LottieImage.drizzleExtremeNight,
                      height: ResponsiveUi()
                          .getMediaQueryHeight(context: context, value: 75),
                      width: ResponsiveUi()
                          .getMediaQueryWidth(context: context, value: 75),
                    )
                  else if (weatherDataCurrent.current.condition.code == 1171)
                    Lottie.network(
                      LottieImage.drizzleExtreme,
                      height: ResponsiveUi()
                          .getMediaQueryHeight(context: context, value: 75),
                      width: ResponsiveUi()
                          .getMediaQueryWidth(context: context, value: 75),
                    )
                  else if (weatherDataCurrent.current.condition.code == 1069)
                    Lottie.network(
                      LottieImage.sleetPossible,
                      height: ResponsiveUi()
                          .getMediaQueryHeight(context: context, value: 75),
                      width: ResponsiveUi()
                          .getMediaQueryWidth(context: context, value: 75),
                    )
                  else if (weatherDataCurrent.current.condition.code == 1204)
                    Lottie.network(
                      LottieImage.sleetCloudyNight,
                      height: ResponsiveUi()
                          .getMediaQueryHeight(context: context, value: 75),
                      width: ResponsiveUi()
                          .getMediaQueryWidth(context: context, value: 75),
                    )
                  else if (weatherDataCurrent.current.condition.code == 1207)
                    Lottie.network(
                      LottieImage.sleetOvercastNight,
                      height: ResponsiveUi()
                          .getMediaQueryHeight(context: context, value: 75),
                      width: ResponsiveUi()
                          .getMediaQueryWidth(context: context, value: 75),
                    )
                  else if (weatherDataCurrent.current.condition.code == 1249)
                    Lottie.network(
                      LottieImage.sleetExtremeNight,
                      height: ResponsiveUi()
                          .getMediaQueryHeight(context: context, value: 75),
                      width: ResponsiveUi()
                          .getMediaQueryWidth(context: context, value: 75),
                    )
                  else if (weatherDataCurrent.current.condition.code == 1252)
                    Lottie.network(
                      LottieImage.sleetExtreme,
                      height: ResponsiveUi()
                          .getMediaQueryHeight(context: context, value: 75),
                      width: ResponsiveUi()
                          .getMediaQueryWidth(context: context, value: 75),
                    )
                  else if (weatherDataCurrent.current.condition.code == 1273)
                    Lottie.network(
                      LottieImage.thunderstormsRainNight,
                      height: ResponsiveUi()
                          .getMediaQueryHeight(context: context, value: 75),
                      width: ResponsiveUi()
                          .getMediaQueryWidth(context: context, value: 75),
                    )
                  else if (weatherDataCurrent.current.condition.code == 1276)
                    Lottie.network(
                      LottieImage.thunderstormsRainNightExtreme,
                      height: ResponsiveUi()
                          .getMediaQueryHeight(context: context, value: 75),
                      width: ResponsiveUi()
                          .getMediaQueryWidth(context: context, value: 75),
                    )
                  else if (weatherDataCurrent.current.condition.code == 1279)
                    Lottie.network(
                      LottieImage.thunderstormsSnowNight,
                      height: ResponsiveUi()
                          .getMediaQueryHeight(context: context, value: 75),
                      width: ResponsiveUi()
                          .getMediaQueryWidth(context: context, value: 75),
                    )
                  else if (weatherDataCurrent.current.condition.code == 1282)
                    Lottie.network(
                      LottieImage.thunderstormsSnowNightExtreme,
                      height: ResponsiveUi()
                          .getMediaQueryHeight(context: context, value: 75),
                      width: ResponsiveUi()
                          .getMediaQueryWidth(context: context, value: 75),
                    )
                  else if (weatherDataCurrent.current.condition.code == 1063)
                    Lottie.network(
                      LottieImage.rainPossible,
                      height: ResponsiveUi()
                          .getMediaQueryHeight(context: context, value: 75),
                      width: ResponsiveUi()
                          .getMediaQueryWidth(context: context, value: 75),
                    )
                  else if (weatherDataCurrent.current.condition.code == 1180 ||
                      weatherDataCurrent.current.condition.code == 1183)
                    Lottie.network(
                      LottieImage.rainCloudyNight,
                      height: ResponsiveUi()
                          .getMediaQueryHeight(context: context, value: 75),
                      width: ResponsiveUi()
                          .getMediaQueryWidth(context: context, value: 75),
                    )
                  else if (weatherDataCurrent.current.condition.code == 1186 ||
                      weatherDataCurrent.current.condition.code == 1189)
                    Lottie.network(
                      LottieImage.rainOvercastNight,
                      height: ResponsiveUi()
                          .getMediaQueryHeight(context: context, value: 75),
                      width: ResponsiveUi()
                          .getMediaQueryWidth(context: context, value: 75),
                    )
                  else if (weatherDataCurrent.current.condition.code == 1192 ||
                      weatherDataCurrent.current.condition.code == 1195)
                    Lottie.network(
                      LottieImage.rainExtremeNight,
                      height: ResponsiveUi()
                          .getMediaQueryHeight(context: context, value: 75),
                      width: ResponsiveUi()
                          .getMediaQueryWidth(context: context, value: 75),
                    )
                  else if (weatherDataCurrent.current.condition.code == 1198 ||
                      weatherDataCurrent.current.condition.code == 1201)
                    Lottie.network(
                      LottieImage.rainOvercast,
                      height: ResponsiveUi()
                          .getMediaQueryHeight(context: context, value: 75),
                      width: ResponsiveUi()
                          .getMediaQueryWidth(context: context, value: 75),
                    )
                  else if (weatherDataCurrent.current.condition.code == 1240 ||
                      weatherDataCurrent.current.condition.code == 1243 ||
                      weatherDataCurrent.current.condition.code == 1246)
                    Lottie.network(
                      LottieImage.rainExtreme,
                      height: ResponsiveUi()
                          .getMediaQueryHeight(context: context, value: 75),
                      width: ResponsiveUi()
                          .getMediaQueryWidth(context: context, value: 75),
                    )
                  else if (weatherDataCurrent.current.condition.code == 1066)
                    Lottie.network(
                      LottieImage.snowPossible,
                      height: ResponsiveUi()
                          .getMediaQueryHeight(context: context, value: 75),
                      width: ResponsiveUi()
                          .getMediaQueryWidth(context: context, value: 75),
                    )
                  else if (weatherDataCurrent.current.condition.code == 1114)
                    Lottie.network(
                      LottieImage.snowOvercast,
                      height: ResponsiveUi()
                          .getMediaQueryHeight(context: context, value: 75),
                      width: ResponsiveUi()
                          .getMediaQueryWidth(context: context, value: 75),
                    )
                  else if (weatherDataCurrent.current.condition.code == 1210 ||
                      weatherDataCurrent.current.condition.code == 1213)
                    Lottie.network(
                      LottieImage.snowCloudyNight,
                      height: ResponsiveUi()
                          .getMediaQueryHeight(context: context, value: 75),
                      width: ResponsiveUi()
                          .getMediaQueryWidth(context: context, value: 75),
                    )
                  else if (weatherDataCurrent.current.condition.code == 1216 ||
                      weatherDataCurrent.current.condition.code == 1219)
                    Lottie.network(
                      LottieImage.snowOvercastNight,
                      height: ResponsiveUi()
                          .getMediaQueryHeight(context: context, value: 75),
                      width: ResponsiveUi()
                          .getMediaQueryWidth(context: context, value: 75),
                    )
                  else if (weatherDataCurrent.current.condition.code == 1222 ||
                      weatherDataCurrent.current.condition.code == 1225)
                    Lottie.network(
                      LottieImage.snowExtremeNight,
                      height: ResponsiveUi()
                          .getMediaQueryHeight(context: context, value: 75),
                      width: ResponsiveUi()
                          .getMediaQueryWidth(context: context, value: 75),
                    )
                  else if (weatherDataCurrent.current.condition.code == 1255)
                    Lottie.network(
                      LottieImage.snowExtreme,
                      height: ResponsiveUi()
                          .getMediaQueryHeight(context: context, value: 75),
                      width: ResponsiveUi()
                          .getMediaQueryWidth(context: context, value: 75),
                    )
                  else if (weatherDataCurrent.current.condition.code == 1258)
                    Lottie.network(
                      LottieImage.snowMan,
                      height: ResponsiveUi()
                          .getMediaQueryHeight(context: context, value: 75),
                      width: ResponsiveUi()
                          .getMediaQueryWidth(context: context, value: 75),
                    ),
                RichText(
                  textScaler: TextScaler.linear(
                      ResponsiveUi().textScaleFactor(context)),
                  text: TextSpan(
                    style: Theme.of(context).textTheme.bodyLarge,
                    children: [
                      TextSpan(
                          text: weatherDataCurrent.current.tempC
                              .round()
                              .toString(),
                          style: Theme.of(context).textTheme.displayLarge),
                      TextSpan(
                          text: '°C '.tr,
                          style: Theme.of(context).textTheme.displayLarge),
                      TextSpan(
                          text: weatherDataCurrent.current.condition.text,
                          style: Theme.of(context).textTheme.bodyMedium),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: ResponsiveUi()
                  .getMediaQueryHeight(context: context, value: 15),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: ResponsiveUi()
                      .getMediaQueryHeight(context: context, value: 80),
                  width: ResponsiveUi()
                      .getMediaQueryWidth(context: context, value: 80),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: Theme.of(context)
                          .appBarTheme
                          .backgroundColor!
                          .withOpacity(0.45),
                      borderRadius: BorderRadius.circular(15)),
                  child: Lottie.network(LottieImage.wind),
                ),
                Container(
                  height: ResponsiveUi()
                      .getMediaQueryHeight(context: context, value: 80),
                  width: ResponsiveUi()
                      .getMediaQueryWidth(context: context, value: 80),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: Theme.of(context)
                          .appBarTheme
                          .backgroundColor!
                          .withOpacity(0.45),
                      borderRadius: BorderRadius.circular(15)),
                  child: Lottie.network(LottieImage.cloudly),
                ),
                Container(
                  height: ResponsiveUi()
                      .getMediaQueryHeight(context: context, value: 80),
                  width: ResponsiveUi()
                      .getMediaQueryWidth(context: context, value: 80),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: Theme.of(context)
                          .appBarTheme
                          .backgroundColor!
                          .withOpacity(0.45),
                      borderRadius: BorderRadius.circular(15)),
                  child: Lottie.network(
                    LottieImage.humidity,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: ResponsiveUi()
                  .getMediaQueryHeight(context: context, value: 15),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: ResponsiveUi()
                      .getMediaQueryHeight(context: context, value: 40),
                  width: ResponsiveUi()
                      .getMediaQueryWidth(context: context, value: 90),
                  child: RichText(
                    textAlign: TextAlign.center,
                    textScaler: TextScaler.linear(
                        ResponsiveUi().textScaleFactor(context)),
                    text: TextSpan(
                      style: Theme.of(context).textTheme.bodyLarge,
                      children: [
                        TextSpan(
                          text:
                              '${weatherDataCurrent.current.windKph.toString()} ',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        TextSpan(
                            text: 'km/h'.tr,
                            style: Theme.of(context).textTheme.bodyLarge),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: ResponsiveUi()
                      .getMediaQueryHeight(context: context, value: 40),
                  width: ResponsiveUi()
                      .getMediaQueryWidth(context: context, value: 90),
                  child: Text(
                    "${weatherDataCurrent.current.cloud}%",
                    style: Theme.of(context).textTheme.bodyLarge,
                    textScaler: TextScaler.linear(
                        ResponsiveUi().textScaleFactor(context)),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: ResponsiveUi()
                      .getMediaQueryHeight(context: context, value: 40),
                  width: ResponsiveUi()
                      .getMediaQueryWidth(context: context, value: 90),
                  child: Text(
                    "${weatherDataCurrent.current.humidity}%",
                    textScaler: TextScaler.linear(
                        ResponsiveUi().textScaleFactor(context)),
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: ResponsiveUi()
                      .getMediaQueryHeight(context: context, value: 80),
                  width: ResponsiveUi()
                      .getMediaQueryWidth(context: context, value: 80),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: Theme.of(context)
                          .appBarTheme
                          .backgroundColor!
                          .withOpacity(0.45),
                      borderRadius: BorderRadius.circular(15)),
                  child: Lottie.network(LottieImage.sunrise),
                ),
                Container(
                  height: ResponsiveUi()
                      .getMediaQueryHeight(context: context, value: 80),
                  width: ResponsiveUi()
                      .getMediaQueryWidth(context: context, value: 80),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: Theme.of(context)
                          .appBarTheme
                          .backgroundColor!
                          .withOpacity(0.45),
                      borderRadius: BorderRadius.circular(15)),
                  child: Lottie.network(LottieImage.sunset),
                ),
                Container(
                  height: ResponsiveUi()
                      .getMediaQueryHeight(context: context, value: 80),
                  width: ResponsiveUi()
                      .getMediaQueryWidth(context: context, value: 80),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: Theme.of(context)
                          .appBarTheme
                          .backgroundColor!
                          .withOpacity(0.45),
                      borderRadius: BorderRadius.circular(15)),
                  child: Lottie.network(
                    LottieImage.thermometer,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: ResponsiveUi()
                  .getMediaQueryWidth(context: context, value: 15),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: ResponsiveUi()
                      .getMediaQueryHeight(context: context, value: 40),
                  width: ResponsiveUi()
                      .getMediaQueryWidth(context: context, value: 80),
                  child: RichText(
                    textAlign: TextAlign.center,
                    textScaler: TextScaler.linear(
                        ResponsiveUi().textScaleFactor(context)),
                    text: TextSpan(
                      style: Theme.of(context).textTheme.bodyLarge,
                      children: [
                        TextSpan(
                          text: (weatherDataCurrent
                                  .forecast.forecastday[0].astro.sunrise)
                              .substring(0, 6),
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        TextSpan(
                          text: (weatherDataCurrent
                                  .forecast.forecastday[0].astro.sunrise)
                              .substring(6, 8)
                              .tr,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: ResponsiveUi()
                      .getMediaQueryHeight(context: context, value: 40),
                  width: ResponsiveUi()
                      .getMediaQueryWidth(context: context, value: 80),
                  child: RichText(
                    textAlign: TextAlign.center,
                    textScaler: TextScaler.linear(
                        ResponsiveUi().textScaleFactor(context)),
                    text: TextSpan(
                      style: Theme.of(context).textTheme.bodyLarge,
                      children: [
                        TextSpan(
                          text: (weatherDataCurrent
                                  .forecast.forecastday[0].astro.sunset)
                              .substring(0, 6),
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        TextSpan(
                          text: (weatherDataCurrent
                                  .forecast.forecastday[0].astro.sunset)
                              .substring(6, 8)
                              .tr,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: ResponsiveUi()
                      .getMediaQueryHeight(context: context, value: 40),
                  width: ResponsiveUi()
                      .getMediaQueryWidth(context: context, value: 80),
                  child: RichText(
                    textAlign: TextAlign.center,
                    textScaler: TextScaler.linear(
                        ResponsiveUi().textScaleFactor(context)),
                    text: TextSpan(
                      style: Theme.of(context).textTheme.bodyLarge,
                      children: [
                        TextSpan(
                          text:
                              weatherDataCurrent.current.feelslikeC.toString(),
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        TextSpan(
                            text: '°C '.tr,
                            style: Theme.of(context).textTheme.bodyLarge),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
