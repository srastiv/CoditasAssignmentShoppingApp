part of 'products_bloc.dart';

@immutable
abstract class ProductsEvent {}

class FetchProductsEvent extends ProductsEvent {}

class AddProductEvent extends ProductsEvent {
  Products product;
  List<Products> productList;
  AddProductEvent({required this.product, required this.productList});
}

class IncrementEvent extends ProductsEvent {
  Products product;
  List<Products> productList;
  IncrementEvent({required this.product, required this.productList});
}

class DecrementEvent extends ProductsEvent {
  Products product;
  List<Products> productList;
  DecrementEvent({required this.product, required this.productList});
}
