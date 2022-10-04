part of 'products_bloc.dart';

@immutable
abstract class ProductsState {}

class ProductsInitialState extends ProductsState {}

class ProductsLoadedState extends ProductsState {
  int? quantity;
  Products? product;
  List<Products> productsList;
  List<Products> selectedProductsList;

  ProductsLoadedState(
      {this.quantity,
      this.product,
      required this.productsList,
      required this.selectedProductsList});
}
