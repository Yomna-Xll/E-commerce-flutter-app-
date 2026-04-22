//import 'package:flutter/material.dart';

import 'package:flutter/foundation.dart';

class ProductsModel {
  final String path, title, price;
  ProductsModel({required this.path, required this.title, required this.price});
  factory ProductsModel.fromjson(Map<String, dynamic> json) {
    return ProductsModel(
      path: json['category']['image'],
      title: json['title'],
      price: json['price'].toString(),
    );
  }

}
