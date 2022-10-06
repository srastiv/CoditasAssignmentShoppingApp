import 'package:meta/meta.dart';
import 'dart:convert';

class Products {
  Products({
    required this.title,
    required this.price,
    required this.description,
    required this.image,
    this.quantity = 0,
  });

  final String title;
  final double price;
  final String description;

  final String image;
  int quantity;

  factory Products.fromRawJson(String str) =>
      Products.fromJson(json.decode(str));

      

  String toRawJson() => json.encode(toJson());


// json string to object instance
  factory Products.fromJson(Map<String, dynamic> json) => Products(
        title: json["title"],
        price: json["price"].toDouble(),
        description: json["description"],
        image: json["image"]
      );


// object to json String
  Map<String, dynamic> toJson() => {
        "title": title,
        "price": price,
        "description": description,
        "image": image,
      };
}
