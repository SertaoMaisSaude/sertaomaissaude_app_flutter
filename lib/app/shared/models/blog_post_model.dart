import 'package:flutter/material.dart';

class BlogPostModel {
  String title;
  String body;
  String photo;
  DateTime postDate;

  BlogPostModel({
    @required this.title,
    @required this.body,
    @required this.photo,
    @required this.postDate,
  });

  BlogPostModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        photo = json['photo'],
        postDate = DateTime.parse(json['postDate']),
        body = json['body'];

  static List<BlogPostModel> fromJsonList(List jsonList) {
    return jsonList.map((e) => BlogPostModel.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() => {
        "title": title,
        "photo": photo,
        "postData": postDate,
        "body": body,
      };
}
