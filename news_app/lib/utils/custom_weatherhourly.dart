import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/model/lottie.dart';
import 'package:news_app/model/responsiveui.dart';
import 'package:news_app/model/weather_now.dart';

class CustomWeatherHourly extends StatelessWidget {
  const CustomWeatherHourly({super.key, required this.d, required this.index});
  final WeatherModel d;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ResponsiveUi().getMediaQueryWidth(context: context, value: 80),
      margin: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: Jiffy.parse(
                  d.current.lastUpdated.toString(),
                ).j ==
                Jiffy.parse(
                  d.forecast.forecastday[0].hour[index].time,
                ).j
            ? LinearGradient(
                colors: [
                  Colors.blue.withOpacity(0.65),
                  Colors.blue.withOpacity(0.65),
                ],
              )
            : LinearGradient(
                colors: [
                  Theme.of(context)
                      .appBarTheme
                      .backgroundColor!
                      .withOpacity(0.45),
                  Theme.of(context)
                      .appBarTheme
                      .backgroundColor!
                      .withOpacity(0.45),
                ],
              ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: Text(
              Jiffy.parse(d.forecast.forecastday[0].hour[index].time).jm,
              style: Theme.of(context).textTheme.bodyLarge,
              textScaler:
                  TextScaler.linear(ResponsiveUi().textScaleFactor(context)),
            ),
          ),
          if (d.forecast.forecastday[0].hour[index].isDay == 1)
            //
            if (d.forecast.forecastday[0].hour[index].condition.code == 1000)
              Lottie.network(
                LottieImage.sunnyDay,
                height: ResponsiveUi()
                    .getMediaQueryHeight(context: context, value: 45),
                width: ResponsiveUi()
                    .getMediaQueryWidth(context: context, value: 45),
              )
            else if (d.forecast.forecastday[0].hour[index].condition.code ==
                1030)
              Lottie.network(
                LottieImage.mist,
                height: ResponsiveUi()
                    .getMediaQueryHeight(context: context, value: 45),
                width: ResponsiveUi()
                    .getMediaQueryWidth(context: context, value: 45),
              )
            else if (d.forecast.forecastday[0].hour[index].condition.code ==
                1006)
              Lottie.network(
                LottieImage.cloudy,
                height: ResponsiveUi()
                    .getMediaQueryHeight(context: context, value: 45),
                width: ResponsiveUi()
                    .getMediaQueryWidth(context: context, value: 45),
              )
            else if (d.forecast.forecastday[0].hour[index].condition.code ==
                1003)
              Lottie.network(
                LottieImage.partlyCloudyDay,
                height: ResponsiveUi()
                    .getMediaQueryHeight(context: context, value: 45),
                width: ResponsiveUi()
                    .getMediaQueryWidth(context: context, value: 45),
              )
            else if (d.forecast.forecastday[0].hour[index].condition.code ==
                1009)
              Lottie.network(
                LottieImage.overcastDay,
                height: ResponsiveUi()
                    .getMediaQueryHeight(context: context, value: 45),
                width: ResponsiveUi()
                    .getMediaQueryWidth(context: context, value: 45),
              )
            else if (d.forecast.forecastday[0].hour[index].condition.code ==
                1087)
              Lottie.network(
                LottieImage.thunderstorms,
                height: ResponsiveUi()
                    .getMediaQueryHeight(context: context, value: 45),
                width: ResponsiveUi()
                    .getMediaQueryWidth(context: context, value: 45),
              )
            else if (d.forecast.forecastday[0].hour[index].condition.code ==
                1117)
              Lottie.network(
                LottieImage.windSnow,
                height: ResponsiveUi()
                    .getMediaQueryHeight(context: context, value: 45),
                width: ResponsiveUi()
                    .getMediaQueryWidth(context: context, value: 45),
              )
            else if (d.forecast.forecastday[0].hour[index].condition.code ==
                1135)
              Lottie.network(
                LottieImage.fog,
                height: ResponsiveUi()
                    .getMediaQueryHeight(context: context, value: 45),
                width: ResponsiveUi()
                    .getMediaQueryWidth(context: context, value: 45),
              )
            else if (d.forecast.forecastday[0].hour[index].condition.code ==
                1147)
              Lottie.network(
                LottieImage.fogExtreme,
                height: ResponsiveUi()
                    .getMediaQueryHeight(context: context, value: 45),
                width: ResponsiveUi()
                    .getMediaQueryWidth(context: context, value: 45),
              )
            else if (d.forecast.forecastday[0].hour[index].condition.code == 1237 ||
                d.forecast.forecastday[0].hour[index].condition.code == 1261 ||
                d.forecast.forecastday[0].hour[index].condition.code == 1264)
              Lottie.network(
                LottieImage.icePellets,
                height: ResponsiveUi()
                    .getMediaQueryHeight(context: context, value: 45),
                width: ResponsiveUi()
                    .getMediaQueryWidth(context: context, value: 45),
              )
            else if (d.forecast.forecastday[0].hour[index].condition.code ==
                1072)
              Lottie.network(
                LottieImage.drizzlePossible,
                height: ResponsiveUi()
                    .getMediaQueryHeight(context: context, value: 45),
                width: ResponsiveUi()
                    .getMediaQueryWidth(context: context, value: 45),
              )
            else if (d.forecast.forecastday[0].hour[index].condition.code ==
                1150)
              Lottie.network(
                LottieImage.drizzleCloudyDay,
                height: ResponsiveUi()
                    .getMediaQueryHeight(context: context, value: 45),
                width: ResponsiveUi()
                    .getMediaQueryWidth(context: context, value: 45),
              )
            else if (d.forecast.forecastday[0].hour[index].condition.code ==
                1153)
              Lottie.network(
                LottieImage.drizzleOvercastDay,
                height: ResponsiveUi()
                    .getMediaQueryHeight(context: context, value: 45),
                width: ResponsiveUi()
                    .getMediaQueryWidth(context: context, value: 45),
              )
            else if (d.forecast.forecastday[0].hour[index].condition.code ==
                1168)
              Lottie.network(
                LottieImage.drizzleExtremeDay,
                height: ResponsiveUi()
                    .getMediaQueryHeight(context: context, value: 45),
                width: ResponsiveUi()
                    .getMediaQueryWidth(context: context, value: 45),
              )
            else if (d.forecast.forecastday[0].hour[index].condition.code ==
                1171)
              Lottie.network(
                LottieImage.drizzleExtreme,
                height: ResponsiveUi()
                    .getMediaQueryHeight(context: context, value: 45),
                width: ResponsiveUi()
                    .getMediaQueryWidth(context: context, value: 45),
              )
            else if (d.forecast.forecastday[0].hour[index].condition.code ==
                1069)
              Lottie.network(
                LottieImage.sleetPossible,
                height: ResponsiveUi()
                    .getMediaQueryHeight(context: context, value: 45),
                width: ResponsiveUi()
                    .getMediaQueryWidth(context: context, value: 45),
              )
            else if (d.forecast.forecastday[0].hour[index].condition.code ==
                1204)
              Lottie.network(
                LottieImage.sleetCloudyDay,
                height: ResponsiveUi()
                    .getMediaQueryHeight(context: context, value: 45),
                width: ResponsiveUi()
                    .getMediaQueryWidth(context: context, value: 45),
              )
            else if (d.forecast.forecastday[0].hour[index].condition.code ==
                1207)
              Lottie.network(
                LottieImage.sleetOvercastDay,
                height: ResponsiveUi()
                    .getMediaQueryHeight(context: context, value: 45),
                width: ResponsiveUi()
                    .getMediaQueryWidth(context: context, value: 45),
              )
            else if (d.forecast.forecastday[0].hour[index].condition.code ==
                1249)
              Lottie.network(
                LottieImage.sleetExtremeDay,
                height: ResponsiveUi()
                    .getMediaQueryHeight(context: context, value: 45),
                width: ResponsiveUi()
                    .getMediaQueryWidth(context: context, value: 45),
              )
            else if (d.forecast.forecastday[0].hour[index].condition.code ==
                1252)
              Lottie.network(
                LottieImage.sleetExtreme,
                height: ResponsiveUi()
                    .getMediaQueryHeight(context: context, value: 45),
                width: ResponsiveUi()
                    .getMediaQueryWidth(context: context, value: 45),
              )
            else if (d.forecast.forecastday[0].hour[index].condition.code ==
                1273)
              Lottie.network(
                LottieImage.thunderstormsRainDay,
                height: ResponsiveUi()
                    .getMediaQueryHeight(context: context, value: 45),
                width: ResponsiveUi()
                    .getMediaQueryWidth(context: context, value: 45),
              )
            else if (d.forecast.forecastday[0].hour[index].condition.code ==
                1276)
              Lottie.network(
                LottieImage.thunderstormsRainDayExtreme,
                height: ResponsiveUi()
                    .getMediaQueryHeight(context: context, value: 45),
                width: ResponsiveUi()
                    .getMediaQueryWidth(context: context, value: 45),
              )
            else if (d.forecast.forecastday[0].hour[index].condition.code ==
                1279)
              Lottie.network(
                LottieImage.thunderstormsSnowDay,
                height: ResponsiveUi()
                    .getMediaQueryHeight(context: context, value: 45),
                width: ResponsiveUi()
                    .getMediaQueryWidth(context: context, value: 45),
              )
            else if (d.forecast.forecastday[0].hour[index].condition.code ==
                1282)
              Lottie.network(
                LottieImage.thunderstormsSnowDayExtreme,
                height: ResponsiveUi()
                    .getMediaQueryHeight(context: context, value: 45),
                width: ResponsiveUi()
                    .getMediaQueryWidth(context: context, value: 45),
              )
            else if (d.forecast.forecastday[0].hour[index].condition.code ==
                1063)
              Lottie.network(
                LottieImage.rainPossible,
                height: ResponsiveUi()
                    .getMediaQueryHeight(context: context, value: 45),
                width: ResponsiveUi()
                    .getMediaQueryWidth(context: context, value: 45),
              )
            else if (d.forecast.forecastday[0].hour[index].condition.code == 1180 ||
                d.forecast.forecastday[0].hour[index].condition.code == 1183)
              Lottie.network(
                LottieImage.rainCloudyDay,
                height: ResponsiveUi()
                    .getMediaQueryHeight(context: context, value: 45),
                width: ResponsiveUi()
                    .getMediaQueryWidth(context: context, value: 45),
              )
            else if (d.forecast.forecastday[0].hour[index].condition.code == 1186 ||
                d.forecast.forecastday[0].hour[index].condition.code == 1189)
              Lottie.network(
                LottieImage.rainOvercastDay,
                height: ResponsiveUi()
                    .getMediaQueryHeight(context: context, value: 45),
                width: ResponsiveUi()
                    .getMediaQueryWidth(context: context, value: 45),
              )
            else if (d.forecast.forecastday[0].hour[index].condition.code == 1192 ||
                d.forecast.forecastday[0].hour[index].condition.code == 1195)
              Lottie.network(
                LottieImage.rainExtremeDay,
                height: ResponsiveUi()
                    .getMediaQueryHeight(context: context, value: 45),
                width: ResponsiveUi()
                    .getMediaQueryWidth(context: context, value: 45),
              )
            else if (d.forecast.forecastday[0].hour[index].condition.code == 1198 ||
                d.forecast.forecastday[0].hour[index].condition.code == 1201)
              Lottie.network(
                LottieImage.rainOvercast,
                height: ResponsiveUi()
                    .getMediaQueryHeight(context: context, value: 45),
                width: ResponsiveUi()
                    .getMediaQueryWidth(context: context, value: 45),
              )
            else if (d.forecast.forecastday[0].hour[index].condition.code ==
                    1240 ||
                d.forecast.forecastday[0].hour[index].condition.code == 1243 ||
                d.forecast.forecastday[0].hour[index].condition.code == 1246)
              Lottie.network(
                LottieImage.rainExtreme,
                height: ResponsiveUi()
                    .getMediaQueryHeight(context: context, value: 45),
                width: ResponsiveUi()
                    .getMediaQueryWidth(context: context, value: 45),
              )
            else if (d.forecast.forecastday[0].hour[index].condition.code ==
                1066)
              Lottie.network(
                LottieImage.snowPossible,
                height: ResponsiveUi()
                    .getMediaQueryHeight(context: context, value: 45),
                width: ResponsiveUi()
                    .getMediaQueryWidth(context: context, value: 45),
              )
            else if (d.forecast.forecastday[0].hour[index].condition.code ==
                1114)
              Lottie.network(
                LottieImage.snowOvercast,
                height: ResponsiveUi()
                    .getMediaQueryHeight(context: context, value: 45),
                width: ResponsiveUi()
                    .getMediaQueryWidth(context: context, value: 45),
              )
            else if (d.forecast.forecastday[0].hour[index].condition.code ==
                    1210 ||
                d.forecast.forecastday[0].hour[index].condition.code == 1213)
              Lottie.network(
                LottieImage.snowCloudyDay,
                height: ResponsiveUi()
                    .getMediaQueryHeight(context: context, value: 45),
                width: ResponsiveUi()
                    .getMediaQueryWidth(context: context, value: 45),
              )
            else if (d.forecast.forecastday[0].hour[index].condition.code ==
                    1216 ||
                d.forecast.forecastday[0].hour[index].condition.code == 1219)
              Lottie.network(
                LottieImage.snowOvercastDay,
                height: ResponsiveUi()
                    .getMediaQueryHeight(context: context, value: 45),
                width: ResponsiveUi()
                    .getMediaQueryWidth(context: context, value: 45),
              )
            else if (d.forecast.forecastday[0].hour[index].condition.code ==
                    1222 ||
                d.forecast.forecastday[0].hour[index].condition.code == 1225)
              Lottie.network(
                LottieImage.snowExtremeDay,
                height: ResponsiveUi()
                    .getMediaQueryHeight(context: context, value: 45),
                width: ResponsiveUi()
                    .getMediaQueryWidth(context: context, value: 45),
              )
            else if (d.forecast.forecastday[0].hour[index].condition.code == 1255)
              Lottie.network(
                LottieImage.snowExtreme,
                height: ResponsiveUi()
                    .getMediaQueryHeight(context: context, value: 45),
                width: ResponsiveUi()
                    .getMediaQueryWidth(context: context, value: 45),
              )
            else if (d.forecast.forecastday[0].hour[index].condition.code == 1258)
              Lottie.network(
                LottieImage.snowMan,
                height: ResponsiveUi()
                    .getMediaQueryHeight(context: context, value: 45),
                width: ResponsiveUi()
                    .getMediaQueryWidth(context: context, value: 45),
              ),
          if (d.forecast.forecastday[0].hour[index].isDay == 0)
            //
            if (d.forecast.forecastday[0].hour[index].condition.code == 1000)
              Lottie.network(
                LottieImage.sunnyNight,
                height: ResponsiveUi()
                    .getMediaQueryHeight(context: context, value: 45),
                width: ResponsiveUi()
                    .getMediaQueryWidth(context: context, value: 45),
              )
            else if (d.forecast.forecastday[0].hour[index].condition.code ==
                1030)
              Lottie.network(
                LottieImage.mist,
                height: ResponsiveUi()
                    .getMediaQueryHeight(context: context, value: 45),
                width: ResponsiveUi()
                    .getMediaQueryWidth(context: context, value: 45),
              )
            else if (d.forecast.forecastday[0].hour[index].condition.code ==
                1006)
              Lottie.network(
                LottieImage.cloudy,
                height: ResponsiveUi()
                    .getMediaQueryHeight(context: context, value: 45),
                width: ResponsiveUi()
                    .getMediaQueryWidth(context: context, value: 45),
              )
            else if (d.forecast.forecastday[0].hour[index].condition.code ==
                1003)
              Lottie.network(
                LottieImage.partlyCloudyNight,
                height: ResponsiveUi()
                    .getMediaQueryHeight(context: context, value: 45),
                width: ResponsiveUi()
                    .getMediaQueryWidth(context: context, value: 45),
              )
            else if (d.forecast.forecastday[0].hour[index].condition.code ==
                1009)
              Lottie.network(
                LottieImage.overcastNight,
                height: ResponsiveUi()
                    .getMediaQueryHeight(context: context, value: 45),
                width: ResponsiveUi()
                    .getMediaQueryWidth(context: context, value: 45),
              )
            else if (d.forecast.forecastday[0].hour[index].condition.code ==
                1087)
              Lottie.network(
                LottieImage.thunderstorms,
                height: ResponsiveUi()
                    .getMediaQueryHeight(context: context, value: 45),
                width: ResponsiveUi()
                    .getMediaQueryWidth(context: context, value: 45),
              )
            else if (d.forecast.forecastday[0].hour[index].condition.code ==
                1117)
              Lottie.network(
                LottieImage.windSnow,
                height: ResponsiveUi()
                    .getMediaQueryHeight(context: context, value: 45),
                width: ResponsiveUi()
                    .getMediaQueryWidth(context: context, value: 45),
              )
            else if (d.forecast.forecastday[0].hour[index].condition.code ==
                1135)
              Lottie.network(
                LottieImage.fog,
                height: ResponsiveUi()
                    .getMediaQueryHeight(context: context, value: 45),
                width: ResponsiveUi()
                    .getMediaQueryWidth(context: context, value: 45),
              )
            else if (d.forecast.forecastday[0].hour[index].condition.code ==
                1147)
              Lottie.network(
                LottieImage.fogExtreme,
                height: ResponsiveUi()
                    .getMediaQueryHeight(context: context, value: 45),
                width: ResponsiveUi()
                    .getMediaQueryWidth(context: context, value: 45),
              )
            else if (d.forecast.forecastday[0].hour[index].condition.code == 1237 ||
                d.forecast.forecastday[0].hour[index].condition.code == 1261 ||
                d.forecast.forecastday[0].hour[index].condition.code == 1264)
              Lottie.network(
                LottieImage.icePellets,
                height: ResponsiveUi()
                    .getMediaQueryHeight(context: context, value: 45),
                width: ResponsiveUi()
                    .getMediaQueryWidth(context: context, value: 45),
              )
            else if (d.forecast.forecastday[0].hour[index].condition.code ==
                1072)
              Lottie.network(
                LottieImage.drizzlePossible,
                height: ResponsiveUi()
                    .getMediaQueryHeight(context: context, value: 45),
                width: ResponsiveUi()
                    .getMediaQueryWidth(context: context, value: 45),
              )
            else if (d.forecast.forecastday[0].hour[index].condition.code ==
                1150)
              Lottie.network(
                LottieImage.drizzleCloudyNight,
                height: ResponsiveUi()
                    .getMediaQueryHeight(context: context, value: 45),
                width: ResponsiveUi()
                    .getMediaQueryWidth(context: context, value: 45),
              )
            else if (d.forecast.forecastday[0].hour[index].condition.code ==
                1153)
              Lottie.network(
                LottieImage.drizzleOvercastNight,
                height: ResponsiveUi()
                    .getMediaQueryHeight(context: context, value: 45),
                width: ResponsiveUi()
                    .getMediaQueryWidth(context: context, value: 45),
              )
            else if (d.forecast.forecastday[0].hour[index].condition.code ==
                1168)
              Lottie.network(
                LottieImage.drizzleExtremeNight,
                height: ResponsiveUi()
                    .getMediaQueryHeight(context: context, value: 45),
                width: ResponsiveUi()
                    .getMediaQueryWidth(context: context, value: 45),
              )
            else if (d.forecast.forecastday[0].hour[index].condition.code ==
                1171)
              Lottie.network(
                LottieImage.drizzleExtreme,
                height: ResponsiveUi()
                    .getMediaQueryHeight(context: context, value: 45),
                width: ResponsiveUi()
                    .getMediaQueryWidth(context: context, value: 45),
              )
            else if (d.forecast.forecastday[0].hour[index].condition.code ==
                1069)
              Lottie.network(
                LottieImage.sleetPossible,
                height: ResponsiveUi()
                    .getMediaQueryHeight(context: context, value: 45),
                width: ResponsiveUi()
                    .getMediaQueryWidth(context: context, value: 45),
              )
            else if (d.forecast.forecastday[0].hour[index].condition.code ==
                1204)
              Lottie.network(
                LottieImage.sleetCloudyNight,
                height: ResponsiveUi()
                    .getMediaQueryHeight(context: context, value: 45),
                width: ResponsiveUi()
                    .getMediaQueryWidth(context: context, value: 45),
              )
            else if (d.forecast.forecastday[0].hour[index].condition.code ==
                1207)
              Lottie.network(
                LottieImage.sleetOvercastNight,
                height: ResponsiveUi()
                    .getMediaQueryHeight(context: context, value: 45),
                width: ResponsiveUi()
                    .getMediaQueryWidth(context: context, value: 45),
              )
            else if (d.forecast.forecastday[0].hour[index].condition.code ==
                1249)
              Lottie.network(
                LottieImage.sleetExtremeNight,
                height: ResponsiveUi()
                    .getMediaQueryHeight(context: context, value: 45),
                width: ResponsiveUi()
                    .getMediaQueryWidth(context: context, value: 45),
              )
            else if (d.forecast.forecastday[0].hour[index].condition.code ==
                1252)
              Lottie.network(
                LottieImage.sleetExtreme,
                height: ResponsiveUi()
                    .getMediaQueryHeight(context: context, value: 45),
                width: ResponsiveUi()
                    .getMediaQueryWidth(context: context, value: 45),
              )
            else if (d.forecast.forecastday[0].hour[index].condition.code ==
                1273)
              Lottie.network(
                LottieImage.thunderstormsRainNight,
                height: ResponsiveUi()
                    .getMediaQueryHeight(context: context, value: 45),
                width: ResponsiveUi()
                    .getMediaQueryWidth(context: context, value: 45),
              )
            else if (d.forecast.forecastday[0].hour[index].condition.code ==
                1276)
              Lottie.network(
                LottieImage.thunderstormsRainNightExtreme,
                height: ResponsiveUi()
                    .getMediaQueryHeight(context: context, value: 45),
                width: ResponsiveUi()
                    .getMediaQueryWidth(context: context, value: 45),
              )
            else if (d.forecast.forecastday[0].hour[index].condition.code ==
                1279)
              Lottie.network(
                LottieImage.thunderstormsSnowNight,
                height: ResponsiveUi()
                    .getMediaQueryHeight(context: context, value: 45),
                width: ResponsiveUi()
                    .getMediaQueryWidth(context: context, value: 45),
              )
            else if (d.forecast.forecastday[0].hour[index].condition.code ==
                1282)
              Lottie.network(
                LottieImage.thunderstormsSnowNightExtreme,
                height: ResponsiveUi()
                    .getMediaQueryHeight(context: context, value: 45),
                width: ResponsiveUi()
                    .getMediaQueryWidth(context: context, value: 45),
              )
            else if (d.forecast.forecastday[0].hour[index].condition.code ==
                1063)
              Lottie.network(
                LottieImage.rainPossible,
                height: ResponsiveUi()
                    .getMediaQueryHeight(context: context, value: 45),
                width: ResponsiveUi()
                    .getMediaQueryWidth(context: context, value: 45),
              )
            else if (d.forecast.forecastday[0].hour[index].condition.code == 1180 ||
                d.forecast.forecastday[0].hour[index].condition.code == 1183)
              Lottie.network(
                LottieImage.rainCloudyNight,
                height: ResponsiveUi()
                    .getMediaQueryHeight(context: context, value: 45),
                width: ResponsiveUi()
                    .getMediaQueryWidth(context: context, value: 45),
              )
            else if (d.forecast.forecastday[0].hour[index].condition.code == 1186 ||
                d.forecast.forecastday[0].hour[index].condition.code == 1189)
              Lottie.network(
                LottieImage.rainOvercastNight,
                height: ResponsiveUi()
                    .getMediaQueryHeight(context: context, value: 45),
                width: ResponsiveUi()
                    .getMediaQueryWidth(context: context, value: 45),
              )
            else if (d.forecast.forecastday[0].hour[index].condition.code == 1192 ||
                d.forecast.forecastday[0].hour[index].condition.code == 1195)
              Lottie.network(
                LottieImage.rainExtremeNight,
                height: ResponsiveUi()
                    .getMediaQueryHeight(context: context, value: 45),
                width: ResponsiveUi()
                    .getMediaQueryWidth(context: context, value: 45),
              )
            else if (d.forecast.forecastday[0].hour[index].condition.code == 1198 ||
                d.forecast.forecastday[0].hour[index].condition.code == 1201)
              Lottie.network(
                LottieImage.rainOvercast,
                height: ResponsiveUi()
                    .getMediaQueryHeight(context: context, value: 45),
                width: ResponsiveUi()
                    .getMediaQueryWidth(context: context, value: 45),
              )
            else if (d.forecast.forecastday[0].hour[index].condition.code ==
                    1240 ||
                d.forecast.forecastday[0].hour[index].condition.code == 1243 ||
                d.forecast.forecastday[0].hour[index].condition.code == 1246)
              Lottie.network(
                LottieImage.rainExtreme,
                height: ResponsiveUi()
                    .getMediaQueryHeight(context: context, value: 45),
                width: ResponsiveUi()
                    .getMediaQueryWidth(context: context, value: 45),
              )
            else if (d.forecast.forecastday[0].hour[index].condition.code ==
                1066)
              Lottie.network(
                LottieImage.snowPossible,
                height: ResponsiveUi()
                    .getMediaQueryHeight(context: context, value: 45),
                width: ResponsiveUi()
                    .getMediaQueryWidth(context: context, value: 45),
              )
            else if (d.forecast.forecastday[0].hour[index].condition.code ==
                1114)
              Lottie.network(
                LottieImage.snowOvercast,
                height: ResponsiveUi()
                    .getMediaQueryHeight(context: context, value: 45),
                width: ResponsiveUi()
                    .getMediaQueryWidth(context: context, value: 45),
              )
            else if (d.forecast.forecastday[0].hour[index].condition.code ==
                    1210 ||
                d.forecast.forecastday[0].hour[index].condition.code == 1213)
              Lottie.network(
                LottieImage.snowCloudyNight,
                height: ResponsiveUi()
                    .getMediaQueryHeight(context: context, value: 45),
                width: ResponsiveUi()
                    .getMediaQueryWidth(context: context, value: 45),
              )
            else if (d.forecast.forecastday[0].hour[index].condition.code ==
                    1216 ||
                d.forecast.forecastday[0].hour[index].condition.code == 1219)
              Lottie.network(
                LottieImage.snowOvercastNight,
                height: ResponsiveUi()
                    .getMediaQueryHeight(context: context, value: 45),
                width: ResponsiveUi()
                    .getMediaQueryWidth(context: context, value: 45),
              )
            else if (d.forecast.forecastday[0].hour[index].condition.code ==
                    1222 ||
                d.forecast.forecastday[0].hour[index].condition.code == 1225)
              Lottie.network(
                LottieImage.snowExtremeNight,
                height: ResponsiveUi()
                    .getMediaQueryHeight(context: context, value: 45),
                width: ResponsiveUi()
                    .getMediaQueryWidth(context: context, value: 45),
              )
            else if (d.forecast.forecastday[0].hour[index].condition.code == 1255)
              Lottie.network(
                LottieImage.snowExtreme,
                height: ResponsiveUi()
                    .getMediaQueryHeight(context: context, value: 45),
                width: ResponsiveUi()
                    .getMediaQueryWidth(context: context, value: 45),
              )
            else if (d.forecast.forecastday[0].hour[index].condition.code == 1258)
              Lottie.network(
                LottieImage.snowMan,
                height: ResponsiveUi()
                    .getMediaQueryHeight(context: context, value: 45),
                width: ResponsiveUi()
                    .getMediaQueryWidth(context: context, value: 45),
              ),
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: RichText(
              textScaler:
                  TextScaler.linear(ResponsiveUi().textScaleFactor(context)),
              text: TextSpan(
                style: Theme.of(context).textTheme.bodyLarge,
                children: [
                  TextSpan(
                      text: d.forecast.forecastday[0].hour[index].tempC
                          .round()
                          .toString(),
                      style: Theme.of(context).textTheme.bodyLarge),
                  TextSpan(
                      text: '°C '.tr,
                      style: Theme.of(context).textTheme.bodyLarge),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
