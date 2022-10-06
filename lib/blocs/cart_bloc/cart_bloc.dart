import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shopping_app/blocs/shared_preferences/preferences_service.dart';
import 'package:shopping_app/data/products_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  List<Products> boughtProducts = [];
  CartBloc() : super(CartInitialState()) {
    on<CartLoadedEvent>((event, emit) async {
      List<Products> sharedPreferenceProductsList =
          await PreferencesService().loadData() as List<Products>;

      emit(CartLoadedState(
          productsInSharedPreferencesList: sharedPreferenceProductsList));
    });

    on<BuyEvent>((event, emit) {
      PreferencesService().clearData();
     emit(CartInitialState());
    });
  }
}
