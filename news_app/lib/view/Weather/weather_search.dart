import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/network_connection.dart';
import 'package:news_app/controller/weather_controller.dart';
import 'package:news_app/main.dart';
import 'package:news_app/model/network_image.dart';
import 'package:news_app/model/responsiveui.dart';
import 'package:news_app/model/weather_now.dart';
import 'package:news_app/utils/custom_internet.dart';
import 'package:news_app/utils/custom_weatherdaliy.dart';
import 'package:news_app/utils/custom_weatherhourly.dart';
import 'package:news_app/utils/custom_weathernow_search.dart';
import 'package:news_app/utils/shimmer_searchweather.dart';

class WeatherSearch extends StatelessWidget {
  const WeatherSearch(
      {super.key, required this.lat, required this.lon, required this.name});
  final String lat;
  final String lon;
  final String name;
  @override
  Widget build(BuildContext context) {
    final ConnectionManagerController controller =
        Get.find<ConnectionManagerController>();
    return Obx(
      () => controller.connectionType.value == 1 ||
              controller.connectionType.value == 2
          ? StreamBuilder(
              stream: sharedPref!.getString("lang") == null
                  ? Get.deviceLocale?.languageCode == "en"
                      ? WeatherController()
                          .getWeatherNow('en', lat, lon)
                          .asStream()
                      : WeatherController()
                          .getWeatherNow('ar', lat, lon)
                          .asStream()
                  : Locale(sharedPref!.getString("lang")!).languageCode == "en"
                      ? WeatherController()
                          .getWeatherNow('en', lat, lon)
                          .asStream()
                      : WeatherController()
                          .getWeatherNow('ar', lat, lon)
                          .asStream(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text(
                    '${snapshot.error}',
                    style: Theme.of(context).textTheme.bodyLarge,
                  );
                } else if (!snapshot.hasData) {
                  return const Center(
                    child: ShimmerSearchWeather(),
                  );
                } else {
                  WeatherModel? w = snapshot.data as WeatherModel;
                  return Stack(
                    children: [
                      if (w.current.isDay == 1)
                        if (w.current.condition.code == 1003 ||
                            w.current.condition.code == 1006 ||
                            w.current.condition.code == 1009)
                          const Image(
                            image: NetworkImage(NetworkPhoto.cloudyDay),
                            fit: BoxFit.fill,
                            height: double.infinity,
                            width: double.infinity,
                          )
                        else if (w.current.condition.code == 1030)
                          const Image(
                            image: NetworkImage(NetworkPhoto.mistDay),
                            fit: BoxFit.fill,
                            height: double.infinity,
                            width: double.infinity,
                          )
                        else if (w.current.condition.code == 1000)
                          const Image(
                            image: NetworkImage(NetworkPhoto.sunny),
                            fit: BoxFit.fill,
                            height: double.infinity,
                            width: double.infinity,
                          )
                        else if (w.current.condition.code == 1273 ||
                            w.current.condition.code == 1276)
                          const Image(
                            image: NetworkImage(NetworkPhoto.thunderyRain),
                            fit: BoxFit.fill,
                            height: double.infinity,
                            width: double.infinity,
                          )
                        else if (w.current.condition.code == 1279 ||
                            w.current.condition.code == 1282)
                          const Image(
                            image: NetworkImage(NetworkPhoto.thunderySnow),
                            fit: BoxFit.fill,
                            height: double.infinity,
                            width: double.infinity,
                            //
                          )
                        else if (w.current.condition.code == 1069 ||
                            w.current.condition.code == 1204 ||
                            w.current.condition.code == 1207 ||
                            w.current.condition.code == 1249 ||
                            w.current.condition.code == 1252)
                          const Image(
                            image: NetworkImage(NetworkPhoto.sleet),
                            fit: BoxFit.fill,
                            height: double.infinity,
                            width: double.infinity,
                            //
                          )
                        else if (w.current.condition.code == 1072 ||
                            w.current.condition.code == 1150 ||
                            w.current.condition.code == 1168 ||
                            w.current.condition.code == 1171 ||
                            w.current.condition.code == 1253)
                          const Image(
                            image: NetworkImage(NetworkPhoto.drizzle),
                            fit: BoxFit.fill,
                            height: double.infinity,
                            width: double.infinity,
                          )
                        else if (w.current.condition.code == 1087)
                          const Image(
                            image: NetworkImage(NetworkPhoto.thundery),
                            fit: BoxFit.fill,
                            height: double.infinity,
                            width: double.infinity,
                          )
                        else if (w.current.condition.code == 1117)
                          const Image(
                            image: NetworkImage(NetworkPhoto.blizzard),
                            fit: BoxFit.fill,
                            height: double.infinity,
                            width: double.infinity,
                          )
                        else if (w.current.condition.code == 1135 ||
                            w.current.condition.code == 1147)
                          const Image(
                            image: NetworkImage(NetworkPhoto.fog),
                            fit: BoxFit.fill,
                            height: double.infinity,
                            width: double.infinity,
                          )
                        else if (w.current.condition.code == 1237 ||
                            w.current.condition.code == 1261 ||
                            w.current.condition.code == 1264)
                          const Image(
                            image: NetworkImage(NetworkPhoto.icePellets),
                            fit: BoxFit.fill,
                            height: double.infinity,
                            width: double.infinity,
                          )
                        else if (w.current.condition.code == 1066 ||
                            w.current.condition.code == 1114 ||
                            w.current.condition.code == 1210 ||
                            w.current.condition.code == 1216 ||
                            w.current.condition.code == 1219 ||
                            w.current.condition.code == 1222 ||
                            w.current.condition.code == 1225 ||
                            w.current.condition.code == 1213 ||
                            w.current.condition.code == 1255 ||
                            w.current.condition.code == 1258)
                          const Image(
                            image: NetworkImage(NetworkPhoto.snow),
                            fit: BoxFit.fill,
                            height: double.infinity,
                            width: double.infinity,
                          )
                        else
                          const Image(
                            image: NetworkImage(NetworkPhoto.rain),
                            fit: BoxFit.fill,
                            height: double.infinity,
                            width: double.infinity,
                          ),
                      if (w.current.isDay == 0)
                        if (w.current.condition.code == 1003 ||
                            w.current.condition.code == 1006 ||
                            w.current.condition.code == 1009)
                          const Image(
                            image: NetworkImage(NetworkPhoto.cloudyNight),
                            fit: BoxFit.fill,
                            height: double.infinity,
                            width: double.infinity,
                          )
                        else if (w.current.condition.code == 1030)
                          const Image(
                            image: NetworkImage(NetworkPhoto.mistNight),
                            fit: BoxFit.fill,
                            height: double.infinity,
                            width: double.infinity,
                          )
                        else if (w.current.condition.code == 1000)
                          const Image(
                            image: NetworkImage(NetworkPhoto.night),
                            fit: BoxFit.fill,
                            height: double.infinity,
                            width: double.infinity,
                          )
                        else if (w.current.condition.code == 1273 ||
                            w.current.condition.code == 1276)
                          const Image(
                            image: NetworkImage(NetworkPhoto.thunderyRain),
                            fit: BoxFit.fill,
                            height: double.infinity,
                            width: double.infinity,
                          )
                        else if (w.current.condition.code == 1279 ||
                            w.current.condition.code == 1282)
                          const Image(
                            image: NetworkImage(NetworkPhoto.thunderySnow),
                            fit: BoxFit.fill,
                            height: double.infinity,
                            width: double.infinity,
                            //
                          )
                        else if (w.current.condition.code == 1069 ||
                            w.current.condition.code == 1204 ||
                            w.current.condition.code == 1207 ||
                            w.current.condition.code == 1249 ||
                            w.current.condition.code == 1252)
                          const Image(
                            image: NetworkImage(NetworkPhoto.sleet),
                            fit: BoxFit.fill,
                            height: double.infinity,
                            width: double.infinity,
                            //
                          )
                        else if (w.current.condition.code == 1072 ||
                            w.current.condition.code == 1150 ||
                            w.current.condition.code == 1168 ||
                            w.current.condition.code == 1171 ||
                            w.current.condition.code == 1253)
                          const Image(
                            image: NetworkImage(NetworkPhoto.drizzle),
                            fit: BoxFit.fill,
                            height: double.infinity,
                            width: double.infinity,
                          )
                        else if (w.current.condition.code == 1087)
                          const Image(
                            image: NetworkImage(NetworkPhoto.thundery),
                            fit: BoxFit.fill,
                            height: double.infinity,
                            width: double.infinity,
                          )
                        else if (w.current.condition.code == 1117)
                          const Image(
                            image: NetworkImage(NetworkPhoto.blizzard),
                            fit: BoxFit.fill,
                            height: double.infinity,
                            width: double.infinity,
                          )
                        else if (w.current.condition.code == 1135 ||
                            w.current.condition.code == 1147)
                          const Image(
                            image: NetworkImage(NetworkPhoto.fog),
                            fit: BoxFit.fill,
                            height: double.infinity,
                            width: double.infinity,
                          )
                        else if (w.current.condition.code == 1237 ||
                            w.current.condition.code == 1261 ||
                            w.current.condition.code == 1264)
                          const Image(
                            image: NetworkImage(NetworkPhoto.icePellets),
                            fit: BoxFit.fill,
                            height: double.infinity,
                            width: double.infinity,
                          )
                        else if (w.current.condition.code == 1066 ||
                            w.current.condition.code == 1114 ||
                            w.current.condition.code == 1210 ||
                            w.current.condition.code == 1216 ||
                            w.current.condition.code == 1219 ||
                            w.current.condition.code == 1222 ||
                            w.current.condition.code == 1225 ||
                            w.current.condition.code == 1213 ||
                            w.current.condition.code == 1255 ||
                            w.current.condition.code == 1258)
                          const Image(
                            image: NetworkImage(NetworkPhoto.snow),
                            fit: BoxFit.fill,
                            height: double.infinity,
                            width: double.infinity,
                          )
                        else
                          const Image(
                            image: NetworkImage(NetworkPhoto.rain),
                            fit: BoxFit.fill,
                            height: double.infinity,
                            width: double.infinity,
                          ),
                      ListView(
                        physics: const BouncingScrollPhysics(),
                        children: [
                          CustomWeatherNowSearch(
                            weatherDataCurrent: w,
                            name: name,
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 20, top: 20),
                            alignment: Alignment.topCenter,
                            child: Text(
                              "Today".tr,
                              style: Theme.of(context).textTheme.displayMedium,
                              textScaler: TextScaler.linear(
                                  ResponsiveUi().textScaleFactor(context)),
                            ),
                          ),
                          SizedBox(
                            height: ResponsiveUi().getMediaQueryHeight(
                                context: context, value: 140),
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemBuilder: (context, index) =>
                                  CustomWeatherHourly(
                                d: w,
                                index: index,
                              ),
                              itemCount: w.forecast.forecastday[0].hour.length,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 40),
                            alignment: Alignment.topCenter,
                            child: Text(
                              "Next Three Day".tr,
                              style: Theme.of(context).textTheme.displayMedium,
                              textScaler: TextScaler.linear(
                                  ResponsiveUi().textScaleFactor(context)),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.all(14),
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .appBarTheme
                                    .backgroundColor!
                                    .withOpacity(0.40),
                                borderRadius: BorderRadius.circular(20)),
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemBuilder: (context, index) =>
                                  CustomWeatherDaily(
                                w: w,
                                index: index,
                              ),
                              itemCount: w.forecast.forecastday.length,
                            ),
                          ),
                          SizedBox(
                            height: ResponsiveUi().getMediaQueryHeight(
                                context: context, value: 50),
                          )
                        ],
                      ),
                    ],
                  );
                }
              },
            )
          : const CustomInternet(),
    );
  }
}
