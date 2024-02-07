import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/model/lottie.dart';
import 'package:news_app/model/responsiveui.dart';
import 'package:news_app/model/weather_now.dart';

class CustomWeatherDaily extends StatelessWidget {
  const CustomWeatherDaily({super.key, required this.w, required this.index});
  final WeatherModel w;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height:
              ResponsiveUi().getMediaQueryHeight(context: context, value: 60),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: ResponsiveUi()
                    .getMediaQueryWidth(context: context, value: 90),
                child: Text(
                  Jiffy.parse(w.forecast.forecastday[index].hour[0].time).EEEE,
                  textScaler: TextScaler.linear(
                      ResponsiveUi().textScaleFactor(context)),
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              if (w.forecast.forecastday[index].day.condition.code == 1000)
                Lottie.network(
                  LottieImage.sunnyDay,
                  height: ResponsiveUi()
                      .getMediaQueryHeight(context: context, value: 45),
                  width: ResponsiveUi()
                      .getMediaQueryWidth(context: context, value: 45),
                )
              else if (w.forecast.forecastday[index].day.condition.code == 1030)
                Lottie.network(
                  LottieImage.mist,
                  height: ResponsiveUi()
                      .getMediaQueryHeight(context: context, value: 45),
                  width: ResponsiveUi()
                      .getMediaQueryWidth(context: context, value: 45),
                )
              else if (w.forecast.forecastday[index].day.condition.code == 1006)
                Lottie.network(
                  LottieImage.cloudy,
                  height: ResponsiveUi()
                      .getMediaQueryHeight(context: context, value: 45),
                  width: ResponsiveUi()
                      .getMediaQueryWidth(context: context, value: 45),
                )
              else if (w.forecast.forecastday[index].day.condition.code == 1003)
                Lottie.network(
                  LottieImage.partlyCloudyDay,
                  height: ResponsiveUi()
                      .getMediaQueryHeight(context: context, value: 45),
                  width: ResponsiveUi()
                      .getMediaQueryWidth(context: context, value: 45),
                )
              else if (w.forecast.forecastday[index].day.condition.code == 1009)
                Lottie.network(
                  LottieImage.overcastDay,
                  height: ResponsiveUi()
                      .getMediaQueryHeight(context: context, value: 45),
                  width: ResponsiveUi()
                      .getMediaQueryWidth(context: context, value: 45),
                )
              else if (w.forecast.forecastday[index].day.condition.code == 1087)
                Lottie.network(
                  LottieImage.thunderstorms,
                  height: ResponsiveUi()
                      .getMediaQueryHeight(context: context, value: 45),
                  width: ResponsiveUi()
                      .getMediaQueryWidth(context: context, value: 45),
                )
              else if (w.forecast.forecastday[index].day.condition.code == 1117)
                Lottie.network(
                  LottieImage.windSnow,
                  height: ResponsiveUi()
                      .getMediaQueryHeight(context: context, value: 45),
                  width: ResponsiveUi()
                      .getMediaQueryWidth(context: context, value: 45),
                )
              else if (w.forecast.forecastday[index].day.condition.code == 1135)
                Lottie.network(
                  LottieImage.fog,
                  height: ResponsiveUi()
                      .getMediaQueryHeight(context: context, value: 45),
                  width: ResponsiveUi()
                      .getMediaQueryWidth(context: context, value: 45),
                )
              else if (w.forecast.forecastday[index].day.condition.code == 1147)
                Lottie.network(
                  LottieImage.fogExtreme,
                  height: ResponsiveUi()
                      .getMediaQueryHeight(context: context, value: 45),
                  width: ResponsiveUi()
                      .getMediaQueryWidth(context: context, value: 45),
                )
              else if (w.forecast.forecastday[index].day.condition.code ==
                      1237 ||
                  w.forecast.forecastday[index].day.condition.code == 1261 ||
                  w.forecast.forecastday[index].day.condition.code == 1264)
                Lottie.network(
                  LottieImage.icePellets,
                  height: ResponsiveUi()
                      .getMediaQueryHeight(context: context, value: 45),
                  width: ResponsiveUi()
                      .getMediaQueryWidth(context: context, value: 45),
                )
              else if (w.forecast.forecastday[index].day.condition.code == 1072)
                Lottie.network(
                  LottieImage.drizzlePossible,
                  height: ResponsiveUi()
                      .getMediaQueryHeight(context: context, value: 45),
                  width: ResponsiveUi()
                      .getMediaQueryWidth(context: context, value: 45),
                )
              else if (w.forecast.forecastday[index].day.condition.code == 1150)
                Lottie.network(
                  LottieImage.drizzleCloudyDay,
                  height: ResponsiveUi()
                      .getMediaQueryHeight(context: context, value: 45),
                  width: ResponsiveUi()
                      .getMediaQueryWidth(context: context, value: 45),
                )
              else if (w.forecast.forecastday[index].day.condition.code == 1153)
                Lottie.network(
                  LottieImage.drizzleOvercastDay,
                  height: ResponsiveUi()
                      .getMediaQueryHeight(context: context, value: 45),
                  width: ResponsiveUi()
                      .getMediaQueryWidth(context: context, value: 45),
                )
              else if (w.forecast.forecastday[index].day.condition.code == 1168)
                Lottie.network(
                  LottieImage.drizzleExtremeDay,
                  height: ResponsiveUi()
                      .getMediaQueryHeight(context: context, value: 45),
                  width: ResponsiveUi()
                      .getMediaQueryWidth(context: context, value: 45),
                )
              else if (w.forecast.forecastday[index].day.condition.code == 1171)
                Lottie.network(
                  LottieImage.drizzleExtreme,
                  height: ResponsiveUi()
                      .getMediaQueryHeight(context: context, value: 45),
                  width: ResponsiveUi()
                      .getMediaQueryWidth(context: context, value: 45),
                )
              else if (w.forecast.forecastday[index].day.condition.code == 1069)
                Lottie.network(
                  LottieImage.sleetPossible,
                  height: ResponsiveUi()
                      .getMediaQueryHeight(context: context, value: 45),
                  width: ResponsiveUi()
                      .getMediaQueryWidth(context: context, value: 45),
                )
              else if (w.forecast.forecastday[index].day.condition.code == 1204)
                Lottie.network(
                  LottieImage.sleetCloudyDay,
                  height: ResponsiveUi()
                      .getMediaQueryHeight(context: context, value: 45),
                  width: ResponsiveUi()
                      .getMediaQueryWidth(context: context, value: 45),
                )
              else if (w.forecast.forecastday[index].day.condition.code == 1207)
                Lottie.network(
                  LottieImage.sleetOvercastDay,
                  height: ResponsiveUi()
                      .getMediaQueryHeight(context: context, value: 45),
                  width: ResponsiveUi()
                      .getMediaQueryWidth(context: context, value: 45),
                )
              else if (w.forecast.forecastday[index].day.condition.code == 1249)
                Lottie.network(
                  LottieImage.sleetExtremeDay,
                  height: ResponsiveUi()
                      .getMediaQueryHeight(context: context, value: 45),
                  width: ResponsiveUi()
                      .getMediaQueryWidth(context: context, value: 45),
                )
              else if (w.forecast.forecastday[index].day.condition.code == 1252)
                Lottie.network(
                  LottieImage.sleetExtreme,
                  height: ResponsiveUi()
                      .getMediaQueryHeight(context: context, value: 45),
                  width: ResponsiveUi()
                      .getMediaQueryWidth(context: context, value: 45),
                )
              else if (w.forecast.forecastday[index].day.condition.code == 1273)
                Lottie.network(
                  LottieImage.thunderstormsRainDay,
                  height: ResponsiveUi()
                      .getMediaQueryHeight(context: context, value: 45),
                  width: ResponsiveUi()
                      .getMediaQueryWidth(context: context, value: 45),
                )
              else if (w.forecast.forecastday[index].day.condition.code == 1276)
                Lottie.network(
                  LottieImage.thunderstormsRainDayExtreme,
                  height: ResponsiveUi()
                      .getMediaQueryHeight(context: context, value: 45),
                  width: ResponsiveUi()
                      .getMediaQueryWidth(context: context, value: 45),
                )
              else if (w.forecast.forecastday[index].day.condition.code == 1279)
                Lottie.network(
                  LottieImage.thunderstormsSnowDay,
                  height: ResponsiveUi()
                      .getMediaQueryHeight(context: context, value: 45),
                  width: ResponsiveUi()
                      .getMediaQueryWidth(context: context, value: 45),
                )
              else if (w.forecast.forecastday[index].day.condition.code == 1282)
                Lottie.network(
                  LottieImage.thunderstormsSnowDayExtreme,
                  height: ResponsiveUi()
                      .getMediaQueryHeight(context: context, value: 45),
                  width: ResponsiveUi()
                      .getMediaQueryWidth(context: context, value: 45),
                )
              else if (w.forecast.forecastday[index].day.condition.code == 1063)
                Lottie.network(
                  LottieImage.rainPossible,
                  height: ResponsiveUi()
                      .getMediaQueryHeight(context: context, value: 45),
                  width: ResponsiveUi()
                      .getMediaQueryWidth(context: context, value: 45),
                )
              else if (w.forecast.forecastday[index].day.condition.code ==
                      1180 ||
                  w.forecast.forecastday[index].day.condition.code == 1183)
                Lottie.network(
                  LottieImage.rainCloudyDay,
                  height: ResponsiveUi()
                      .getMediaQueryHeight(context: context, value: 45),
                  width: ResponsiveUi()
                      .getMediaQueryWidth(context: context, value: 45),
                )
              else if (w.forecast.forecastday[index].day.condition.code ==
                      1186 ||
                  w.forecast.forecastday[index].day.condition.code == 1189)
                Lottie.network(
                  LottieImage.rainOvercastDay,
                  height: ResponsiveUi()
                      .getMediaQueryHeight(context: context, value: 45),
                  width: ResponsiveUi()
                      .getMediaQueryWidth(context: context, value: 45),
                )
              else if (w.forecast.forecastday[index].day.condition.code ==
                      1192 ||
                  w.forecast.forecastday[index].day.condition.code == 1195)
                Lottie.network(
                  LottieImage.rainExtremeDay,
                  height: ResponsiveUi()
                      .getMediaQueryHeight(context: context, value: 45),
                  width: ResponsiveUi()
                      .getMediaQueryWidth(context: context, value: 45),
                )
              else if (w.forecast.forecastday[index].day.condition.code ==
                      1198 ||
                  w.forecast.forecastday[index].day.condition.code == 1201)
                Lottie.network(
                  LottieImage.rainOvercast,
                  height: ResponsiveUi()
                      .getMediaQueryHeight(context: context, value: 45),
                  width: ResponsiveUi()
                      .getMediaQueryWidth(context: context, value: 45),
                )
              else if (w.forecast.forecastday[index].day.condition.code ==
                      1240 ||
                  w.forecast.forecastday[index].day.condition.code == 1243 ||
                  w.forecast.forecastday[index].day.condition.code == 1246)
                Lottie.network(
                  LottieImage.rainExtreme,
                  height: ResponsiveUi()
                      .getMediaQueryHeight(context: context, value: 45),
                  width: ResponsiveUi()
                      .getMediaQueryWidth(context: context, value: 45),
                )
              else if (w.forecast.forecastday[index].day.condition.code == 1066)
                Lottie.network(
                  LottieImage.snowPossible,
                  height: ResponsiveUi()
                      .getMediaQueryHeight(context: context, value: 45),
                  width: ResponsiveUi()
                      .getMediaQueryWidth(context: context, value: 45),
                )
              else if (w.forecast.forecastday[index].day.condition.code == 1114)
                Lottie.network(
                  LottieImage.snowOvercast,
                  height: ResponsiveUi()
                      .getMediaQueryHeight(context: context, value: 45),
                  width: ResponsiveUi()
                      .getMediaQueryWidth(context: context, value: 45),
                )
              else if (w.forecast.forecastday[index].day.condition.code ==
                      1210 ||
                  w.forecast.forecastday[index].day.condition.code == 1213)
                Lottie.network(
                  LottieImage.snowCloudyDay,
                  height: ResponsiveUi()
                      .getMediaQueryHeight(context: context, value: 45),
                  width: ResponsiveUi()
                      .getMediaQueryWidth(context: context, value: 45),
                )
              else if (w.forecast.forecastday[index].day.condition.code ==
                      1216 ||
                  w.forecast.forecastday[index].day.condition.code == 1219)
                Lottie.network(
                  LottieImage.snowOvercastDay,
                  height: ResponsiveUi()
                      .getMediaQueryHeight(context: context, value: 45),
                  width: ResponsiveUi()
                      .getMediaQueryWidth(context: context, value: 45),
                )
              else if (w.forecast.forecastday[index].day.condition.code ==
                      1222 ||
                  w.forecast.forecastday[index].day.condition.code == 1225)
                Lottie.network(
                  LottieImage.snowExtremeDay,
                  height: ResponsiveUi()
                      .getMediaQueryHeight(context: context, value: 45),
                  width: ResponsiveUi()
                      .getMediaQueryWidth(context: context, value: 45),
                )
              else if (w.forecast.forecastday[index].day.condition.code == 1255)
                Lottie.network(
                  LottieImage.snowExtreme,
                  height: ResponsiveUi()
                      .getMediaQueryHeight(context: context, value: 45),
                  width: ResponsiveUi()
                      .getMediaQueryWidth(context: context, value: 45),
                )
              else if (w.forecast.forecastday[index].day.condition.code == 1258)
                Lottie.network(
                  LottieImage.snowMan,
                  height: ResponsiveUi()
                      .getMediaQueryHeight(context: context, value: 45),
                  width: ResponsiveUi()
                      .getMediaQueryWidth(context: context, value: 45),
                ),
              RichText(
                textScaler:
                    TextScaler.linear(ResponsiveUi().textScaleFactor(context)),
                text: TextSpan(
                  style: Theme.of(context).textTheme.bodyLarge,
                  children: [
                    TextSpan(
                        text:
                            "${w.forecast.forecastday[index].day.maxtempC} / ${w.forecast.forecastday[index].day.mintempC} "
                                .toString(),
                        style: Theme.of(context).textTheme.bodyLarge),
                    TextSpan(
                        text: '°C '.tr,
                        style: Theme.of(context).textTheme.bodyLarge),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 0.6,
          color: Theme.of(context).iconTheme.color,
        ),
      ],
    );
  }
}
