import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shopping_app/data/get_products.dart';
import 'package:shopping_app/data/products_model.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc() : super(ProductsInitialState()) {
    List<Products> selectedProductsList = [];
    on<FetchProductsEvent>((event, emit) async {
      var productDetails = await getProducts();
      emit(
        ProductsLoadedState(
            productsList: productDetails,
            selectedProductsList: selectedProductsList),
      );
    });
    on<AddProductEvent>(
      (event, emit) {
        if (!selectedProductsList.contains(event.product)) {
          selectedProductsList.add(event.product);
        }

        emit(ProductsLoadedState(
            quantity: event.product.quantity = 1,
            product: event.product,
            productsList: event.productList,
            selectedProductsList: selectedProductsList));
      },
    );

    on<IncrementEvent>(
      (event, emit) {
        if (selectedProductsList.contains(event.product)) {
          event.product.quantity++;
        }
        emit(ProductsLoadedState(
            quantity: event.product.quantity,
            product: event.product,
            productsList: event.productList,
            selectedProductsList: selectedProductsList));
      },
    );
    on<DecrementEvent>(
      (event, emit) {
        if (selectedProductsList.contains(event.product)) {
          if (event.product.quantity > 0) {
            event.product.quantity--;
          }
          if (event.product.quantity == 0) {
            selectedProductsList.remove(event.product);
          }
        }
        emit(ProductsLoadedState(
            quantity: event.product.quantity,
            product: event.product,
            productsList: event.productList,
            selectedProductsList: selectedProductsList));
      },
    );
  }
}
