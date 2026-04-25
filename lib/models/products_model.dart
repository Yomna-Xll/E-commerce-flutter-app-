//import 'package:flutter/material.dart';

import 'package:flutter/foundation.dart';

class ProductsModel {
  final String path, title, price;
  final int id;
  ProductsModel({required this.path, required this.title, required this.price , required this.id});
  factory ProductsModel.fromjson(Map<String, dynamic> json) {
    return ProductsModel(
      id: json["id"],
      path: json['category']['image'],
      title: json['title'],
      price: json['price'].toString(),
    );
  }
}
