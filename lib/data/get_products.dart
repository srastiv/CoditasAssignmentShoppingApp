import 'dart:convert';

import 'package:http/http.dart' as http;

import 'products_model.dart';

Future<List<Products>> getProducts() async {
  try {
    var response = await http.get(
      Uri.parse("https://fakestoreapi.com/products"),
    );

    if (response.statusCode == 200) {
      String data = response.body;
      var decodedData = jsonDecode(data);
      List jsonData = decodedData;

      var result = jsonData
          .map(
            (e) => Products.fromJson(e),
          )
          .toList();
     return result;
    } else {
      return [];
    }
  } catch (error) {
    print("error in getProducts : $error ");
  }
  return [];
}
