part of 'products_bloc.dart';

@immutable
abstract class ProductsState {}

class ProductsInitialState extends ProductsState {}

class ProductsLoadedState extends ProductsState {
  int? quantity;
  List<Products>? boughtProductsList;
  List<Products> productsList;
  List<Products> selectedProductsList;

  ProductsLoadedState(
      {this.quantity,
      this.boughtProductsList,
      required this.productsList,
      required this.selectedProductsList});
}

class BoughtProductsState extends ProductsState {
  
  List<Products> boughtProductsList;
  BoughtProductsState({required this.boughtProductsList});
}
