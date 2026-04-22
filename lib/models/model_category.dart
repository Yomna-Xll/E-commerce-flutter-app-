import 'package:flutter/foundation.dart';
import 'package:flutter_application_day7/models/products_model.dart';

class ModelCategory {
  final String name, image;
  final String?  slug;
  final int? id;
  ModelCategory({this.id, required this.name, this.slug, required this.image});

  factory ModelCategory.fromjson(Map<String, dynamic> json_category) {
    return ModelCategory(
      id: json_category['id'],
      name: json_category['name'],
      slug: json_category['slug'],
      image: json_category['image'],
    );
  }


}
