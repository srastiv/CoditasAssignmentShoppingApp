part of 'cart_bloc.dart';

@immutable
abstract class CartState {}

class CartInitialState extends CartState {}

class CartLoadedState extends CartState {
  List<Products> productsInSharedPreferencesList;
  CartLoadedState({required this.productsInSharedPreferencesList});
}

class BuyState extends CartState{}