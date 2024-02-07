import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/model/news_model.dart';

class NewsController {
  NewsController._private();
  static final _shared = NewsController._private();
  factory NewsController() => _shared;
  var apiKey = 'e455379688dc445c8ae74b156b658f03';
  Future<List<NewsModel>> getNewsBreaking(String lang) async {
    List<NewsModel> myList = [];
    var response = await http.get(Uri.parse(
        'https://newsapi.org/v2/everything?language=$lang&domains=aljazeera.net,bbc.co.uk,%20techcrunch.com,%20engadget.com,aljazeera.com,bbc.com,cnn.com,google.com,engadget.com,msnbc.com,news24.com,newsweek.com,politico.com,reuters.com,wired.com&apiKey=$apiKey'));
    if (response.statusCode == 200) {
      myList.clear();
      var data2 = jsonDecode(response.body);
      if (data2.containsKey('articles') && data2['articles'] is List) {
        var newsList = data2['articles'];
        for (var v in newsList) {
          if (v != null) {
            var u = NewsModel.fromJson(v);
            myList.add(u);
          }
        }
      }
    } else {
      throw Exception('Failed to load data');
    }
    return myList;
  }

  Future<List<NewsModel>> getNewsRecent(String lang) async {
    List<NewsModel> myList = [];
    var response = await http.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?language=$lang&sources=wired,reuters,news24,msnbc,associated-press,abc-news,al-jazeera-english,bbc-news,argaam,bbc-sport,bloomberg,cnn,engadget,fox-sports,google-news,msnbc,national-geographic,nbc-news,the-next-web,time&apiKey=$apiKey'));
    if (response.statusCode == 200) {
      myList.clear();
      var data2 = jsonDecode(response.body);
      if (data2.containsKey('articles') && data2['articles'] is List) {
        var newsList = data2['articles'];
        for (var v in newsList) {
          if (v != null) {
            var u = NewsModel.fromJson(v);
            myList.add(u);
          }
        }
      }
    } else {
      throw Exception('Failed to load data');
    }
    return myList;
  }

  Future<List<NewsModel>> getNewsCategory(String lang, String cat) async {
    List<NewsModel> myList = [];
    var response = await http.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?language=$lang&category=$cat&apiKey=$apiKey'));
    if (response.statusCode == 200) {
      myList.clear();
      var data2 = jsonDecode(response.body);
      if (data2.containsKey('articles') && data2['articles'] is List) {
        var newsList = data2['articles'];
        for (var v in newsList) {
          if (v != null) {
            var u = NewsModel.fromJson(v);
            myList.add(u);
          }
        }
      }
    } else {
      throw Exception('Failed to load data');
    }
    return myList;
  }

  Future<List<NewsModel>> getNewsSearch(String lang, String search) async {
    List<NewsModel> myList = [];
    var response = await http.get(Uri.parse(
        'https://newsapi.org/v2/everything?language=$lang&q=$search&sortBy=publishedAt&domains=aljazeera.net,bbc.co.uk,%20techcrunch.com,%20engadget.com,aljazeera.com,bbc.com,cnn.com,google.com,engadget.com,msnbc.com,news24.com,newsweek.com,politico.com,reuters.com,wired.com&apiKey=$apiKey'));
    if (response.statusCode == 200) {
      // myList.clear();
      var data2 = jsonDecode(response.body);
      if (data2.containsKey('articles') && data2['articles'] is List) {
        var newsList = data2['articles'];
        for (var v in newsList) {
          if (v != null) {
            var u = NewsModel.fromJson(v);
            myList.add(u);
          }
        }
      }
    } else {
      throw Exception('Failed to load data');
    }
    return myList;
  }

  Future<List<NewsModel>> getNewsTicker(
    String lang,
  ) async {
    List<NewsModel> myList = [];
    var response = await http.get(Uri.parse(
        'https://newsapi.org/v2/everything?q=urgent&apiKey=$apiKey&language=$lang'));

    if (response.statusCode == 200) {
      myList.clear();
      var data2 = jsonDecode(response.body);
      if (data2.containsKey('articles') && data2['articles'] is List) {
        var newsList = data2['articles'];
        for (var v in newsList) {
          if (v != null) {
            var u = NewsModel.fromJson(v);
            myList.add(u);
          }
        }
      }
    } else {
      throw Exception('Failed to load data');
    }
    return myList;
  }
}
