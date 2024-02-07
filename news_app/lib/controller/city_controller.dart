import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/model/city.dart';

class CityCon {
  CityCon._private();
  static final _shared = CityCon._private();
  factory CityCon() => _shared;
  List<CityClass> myList = [];
  Rx<List<CityClass>> myList1 = Rx<List<CityClass>>([]);
  final TextEditingController searchController = TextEditingController();

  Future<List<CityClass>> cityData(String q, String lang) async {
    var response = await http.get(Uri.parse(
        'http://api.geonames.org/searchJSON?q=$q&username=mohammedhajjeeh&lang=$lang'));

    if (response.statusCode == 200) {
      myList.clear();
      var data2 = jsonDecode(response.body);
      if (data2.containsKey('geonames') && data2['geonames'] is List) {
        var newsList = data2['geonames'];
        for (var v in newsList) {
          if (v != null) {
            var u = CityClass.fromJson(v);
            myList.add(u);
          }
        }
        myList.sort((a, b) => a.name.compareTo(b.name));
        myList1.value = List<CityClass>.from(myList);
      }
    } else {
      throw Exception('Failed to load data');
    }

    return myList;
  }

  void filterCity() {
    List<CityClass> results = [];
    String searchQuery = searchController.text.toLowerCase();

    if (searchQuery.isEmpty) {
      results = List<CityClass>.from(myList);
    } else {
      results = myList
          .where((element) => element.name.toLowerCase().contains(searchQuery))
          .toList();
    }

    myList1.value = results;
  }
}
