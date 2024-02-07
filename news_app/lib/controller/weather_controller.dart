import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/model/weather_now.dart';

class WeatherController {
  WeatherController._private();
  static final _shared = WeatherController._private();
  factory WeatherController() => _shared;
  var apiKey = '159fb1626eecbda3b5657c0a61b500f8';
  Future<WeatherModel> getWeatherNow(
      String lang, String lat, String lon) async {
    Uri geoNamesUrl = Uri.parse(
        'http://api.geonames.org/findNearbyPlaceNameJSON?lat=$lat&lng=$lon&username=mohammedhajjeeh&lang=$lang');
    http.Response geoNamesResponse = await http.get(geoNamesUrl);
    String geoNamesResponseBody = utf8.decode(geoNamesResponse.bodyBytes);
    Map<String, dynamic> geoNamesData = jsonDecode(geoNamesResponseBody);

    // Extract the place name from the GeoNames response
    String placeName = geoNamesData['geonames'][0]['name'];
    Uri url = Uri.parse(
        'https://api.weatherapi.com/v1/forecast.json?key=4feac0ceb21549818cc85938231110&q=$lat,$lon&lang=$lang&days=3');
    http.Response response = await http.get(url);
    String responseBody = utf8.decode(response.bodyBytes);
    Map<String, dynamic> data = jsonDecode(responseBody);
    WeatherModel weather = WeatherModel.fromJson(data);
    weather.location.name = placeName;
    return weather;
  }

  Future<WeatherModel> getWeatherNow1(
      String lang, double lat, double lon) async {
    Uri geoNamesUrl = Uri.parse(
        'http://api.geonames.org/findNearbyPlaceNameJSON?lat=$lat&lng=$lon&username=mohammedhajjeeh&lang=$lang');
    http.Response geoNamesResponse = await http.get(geoNamesUrl);
    String geoNamesResponseBody = utf8.decode(geoNamesResponse.bodyBytes);
    Map<String, dynamic> geoNamesData = jsonDecode(geoNamesResponseBody);

    // Extract the place name from the GeoNames response
    String placeName = geoNamesData['geonames'][0]['name'];
    Uri url = Uri.parse(
        'https://api.weatherapi.com/v1/forecast.json?key=4feac0ceb21549818cc85938231110&q=$lat,$lon&lang=$lang&days=3');
    http.Response response = await http.get(url);
    String responseBody = utf8.decode(response.bodyBytes);
    Map<String, dynamic> data = jsonDecode(responseBody);
    WeatherModel weather = WeatherModel.fromJson(data);
    weather.location.name = placeName;
    return weather;
  }
}
