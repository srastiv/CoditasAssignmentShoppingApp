import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_app/data/products_model.dart';

class PreferencesService {
   Future saveProducts(List<Products> productsList) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    String json = jsonEncode(productsList);

    await preferences.setString("productsList", json);
  }

   loadData() async {
    final preferences = await SharedPreferences.getInstance();

    if (preferences.getString("productsList") == null) {
    } else {
      String json = preferences.getString("productsList")!;

      List<Products> decode(String json) {
        final product = (jsonDecode(json) as List<dynamic>)
            .map<Products>((item) => Products.fromJson(item))
            .toList();

        return product;
      }

      return decode(json);
    }
  }

   clearData() async {
    final preferences = await SharedPreferences.getInstance();
    preferences.clear();
    print("\n data cleared");
  }
}




//right after this line- 
//  print("decode(json): ${decode(json)[0].price}");

 // Map<String, dynamic> map = jsonDecode(json).map((e)=>Products.fromJson(e));
    // print("\n map: $map");
    // Products products = Products.fromJson(map);
    // // final product = Products.fromJson(map);
    // print(products.title);