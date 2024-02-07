import 'dart:async';
import 'dart:convert';
import 'package:news_app/model/clock.dart';
import 'package:http/http.dart' as http;

class ClockController {
  ClockController._private();
  static final _shared = ClockController._private();
  factory ClockController() => _shared;
  Future<Clock> clockLocation(double lat, double long) async {
    final response = await http.get(Uri.parse(
        'https://timeapi.io/api/TimeZone/coordinate?latitude=$lat&longitude=$long'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return Clock.fromJson(data);
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<String>> clockTimeZone() async {
    List<String> myList = [];
    var response = await http
        .get(Uri.parse('https://timeapi.io/api/TimeZone/AvailableTimeZones'));

    if (response.statusCode == 200) {
      myList.clear();
      var data2 = jsonDecode(response.body);
      if (data2 is List) {
        var newsList = data2;
        for (var v in newsList) {
          if (v != null) {
            myList.add(v);
          }
        }
      }
    } else {
      throw Exception('Failed to load data');
    }

    return myList;
  }

  Future<Clock> clockWorldZone(String city) async {
    final response = await http
        .get(Uri.parse('https://timeapi.io/api/TimeZone/zone?timeZone=$city'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return Clock.fromJson(data);
    } else {
      throw Exception('Failed to load data');
    }
  }
}
