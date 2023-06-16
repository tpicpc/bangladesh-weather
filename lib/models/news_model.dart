// To parse this JSON data, do
//
//     final newsModel = newsModelFromJson(jsonString);

import 'dart:convert';

NewsModel newsModelFromJson(String str) => NewsModel.fromJson(json.decode(str));

String newsModelToJson(NewsModel data) => json.encode(data.toJson());

class NewsModel {
  NewsModel({
    required this.status,
    required this.articles,
  });

  String status;
  List<Article> articles;

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        status: json["status"],
        articles: List<Article>.from(
            json["articles"].map((x) => Article.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
      };
}

class Article {
  Article({
    required this.title,
    required this.date,
    required this.description,
    required this.image,
  });

  String title;
  String date;
  String description;
  String image;

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        title: json["title"],
        date: json["date"],
        description: json["description"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "date": date,
        "description": description,
        "image": image,
      };
}
