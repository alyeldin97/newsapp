import 'dart:convert';

import 'package:flutter/foundation.dart';

class Article {
  Source? source;
  String? title;
  String? description;
  String? urlToImage;
  String? publishedAt;
  Article({
    this.source,
    this.title,
    this.description,
    this.urlToImage,
    this.publishedAt,
  });

  Map<String?, dynamic> toMap() {
    return {
      'source': source?.toMap(),
      'title': title,
      'description': description,
      'urlToImage': urlToImage,
      'publishedAt': publishedAt,
    };
  }

  factory Article.fromMap(Map<String?, dynamic> map) {
    return Article(
      source: Source.fromMap(map['source']),
      title: map['title'],
      description: map['description'],
      urlToImage: map['urlToImage'],
      publishedAt: map['publishedAt'],
    );
  }

  String? toJson() => json.encode(toMap());

  factory Article.fromJson(String? source) => Article.fromMap(json.decode(source!));
}

class Source {
  String? id;
  String? name;
  Source({
    required this.id,
    required this.name,
  });

  Map<String?, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory Source.fromMap(Map<String?, dynamic> map) {
    return Source(
      id: map['id'],
      name: map['name'],
    );
  }

  String? toJson() => json.encode(toMap());

  factory Source.fromJson(String? source) => Source.fromMap(json.decode(source!));
}
