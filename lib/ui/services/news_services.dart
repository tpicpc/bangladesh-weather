import 'dart:convert';

import 'package:weatherbd/models/news_model.dart';

import 'package:http/http.dart' as http;

class NewsService {
  Future<NewsModel?> getNews() async {
    var response = await http
        .get(Uri.parse("https://www.chironjitroy.xyz/app/weathernews.json"));

    if (response.statusCode == 200) {
      var date = response.bodyBytes;
      var banglaText = utf8.decode(date);
      return newsModelFromJson(banglaText);
    }
  }
}
