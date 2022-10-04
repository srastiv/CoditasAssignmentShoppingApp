import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_app/data/products_model.dart';

class PreferencesService {
  Future saveProducts(Products product) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString("title", product.title);
    await preferences.setString("description", product.description);
    await preferences.setDouble("price", product.price);
    await preferences.setString("image", product.image);

    print("Saved products");
  }

  Future<Products> getProducts() async {
    final preferences = await SharedPreferences.getInstance();
    final title = preferences.getString("title");
    final description = preferences.getString("description");
    final price = preferences.getDouble("price");
    final image = preferences.getString("image");

    return Products(
        title: title!, price: price!, description: description!, image: image!);
  }
}
