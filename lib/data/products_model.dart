import 'package:meta/meta.dart';
import 'dart:convert';

class Products {
  Products({
     this.id,
    required this.title,
    required this.price,
    required this.description,
     this.category,
    required this.image,
    this.quantity = 0,
  });

  final int? id;
  final String title;
  final double price;
  final String description;
  final String? category;
  final String image;
  int quantity;

  factory Products.fromRawJson(String str) =>
      Products.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        id: json["id"],
        title: json["title"],
        price: json["price"].toDouble(),
        description: json["description"],
        category: json["category"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "category": category,
        "image": image,
      };
}
