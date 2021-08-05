import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CategoryItemModel {
  final String image;
  String categoryName;
  bool? isLeft;
  Color? color;

  CategoryItemModel({
    this.image = '',
    this.categoryName = '',
    @required this.isLeft,
    @required this.color,
  });
}

List<CategoryItemModel> categoryItemModels = [
  CategoryItemModel(
      image: 'assets/images/sports.png',
      categoryName: 'Sports',
      isLeft: false,
      color: Colors.red),
  CategoryItemModel(
      image: 'assets/images/politics.png',
      categoryName: 'Politics',
      isLeft: true,
      color: Colors.blue),
  CategoryItemModel(
      image: 'assets/images/health.png',
      categoryName: 'Health',
      isLeft: false,
      color: Colors.pink),
  CategoryItemModel(
      image: 'assets/images/bussines.png',
      categoryName: 'Business',
      isLeft: true,
      color: Colors.orange),
  CategoryItemModel(
      image: 'assets/images/enviroment.png',
      categoryName: 'General',
      isLeft: false,
      color: Colors.lightBlue),
  CategoryItemModel(
      image: 'assets/images/science.png',
      categoryName: 'Science',
      isLeft: true,
      color: Colors.amber),
];
