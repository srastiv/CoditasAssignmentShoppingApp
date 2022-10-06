import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/blocs/cart_bloc/cart_bloc.dart';
import 'package:shopping_app/blocs/products_bloc/products_bloc.dart';
import 'package:shopping_app/data/get_products.dart';
import 'package:shopping_app/data/products_model.dart';
import 'package:shopping_app/screens/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // final preferencesService = PreferencesService();
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductsBloc>(
          create: (BuildContext context) => ProductsBloc(),
        ),
        BlocProvider<CartBloc>(
          create: (BuildContext context) => CartBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          body: FutureBuilder<List<Products>>(
              future: getProducts(),
              builder: (context, AsyncSnapshot<List<Products>> snapshot) {
                if (snapshot.hasError) {
                  return const Text("Snapshot has error");
                } else if (snapshot.hasData) {
                  return HomePage();
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }),
        ),
      ),
    );
  }
}

// void _saveProducts() {
//   final newProduct = Products(
//   id: pro,
//   title: title, 
//   price: price, 
//   description: description, 
//   category: category, 
//   image: image)
// }
