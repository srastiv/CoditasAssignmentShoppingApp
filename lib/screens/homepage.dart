import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/constants/colors.dart';
import 'package:shimmer/shimmer.dart';
import '../bloc/products_bloc.dart';
import '../constants/texts_constants.dart';
import '../constants/textyle_constants.dart';
import '../data/products_model.dart';
import '../widgets/sidebar.dart';
import 'cart.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideBar(),
      backgroundColor: kGrey,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: kDarkGrey),
        backgroundColor: kGrey,
        elevation: 0,
        title: const Center(
          child: kShoppingText,
        ),
        actions: [
          const Icon(
            Icons.search,
            color: kDarkGrey,
          ),
          BlocBuilder<ProductsBloc, ProductsState>(
            builder: (context, state) {
              if (state is ProductsLoadedState) {
                return Stack(
                  children: [
                    Positioned(
                      child: IconButton(
                        icon: const Icon(Icons.shopping_cart),
                        color: kDarkGrey,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  Cart(state.selectedProductsList),
                            ),
                          );
                        },
                      ),
                    ),
                    Positioned(
                      left: 10,
                      top: 10,
                      child: CircleAvatar(
                        radius: 6,
                        backgroundColor: kFluorescentGreen,
                        child: Text(
                          state.selectedProductsList.length.toString(),
                          style: kShoppingCartQuantity,
                        ),
                      ),
                    ),
                  ],
                );
              }
              return kError;
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(
                left: 20, right: 280, top: 20, bottom: 10),
            child: const Text(
              "Fashion",
              style: TextStyle(color: kDarkGrey, fontSize: 20),
            ),
          ),
          BlocBuilder<ProductsBloc, ProductsState>(
            builder: (context, state) {
              if (state is ProductsInitialState) {
                BlocProvider.of<ProductsBloc>(context)
                    .add(FetchProductsEvent());

                return SizedBox(
                  width: 200.0,
                  height: 100.0,
                  child: Shimmer.fromColors(
                    baseColor: kGrey,
                    highlightColor: kDarkGrey,
                    child: SizedBox(
                      width: 200.0,
                      height: 100.0,
                      child: Shimmer.fromColors(
                        baseColor: kGrey,
                        highlightColor: kGrey,
                        child: ListView.builder(
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 200,
                              width: 200,
                              color: kWhite,
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                );
              }
              if (state is ProductsLoadedState) {
                return Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.all(0),
                    itemCount: state.productsList.length,
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: kWhite,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          padding: const EdgeInsets.only(top: 10),
                          height: 200,
                          width: 200,
                          child: Row(
                            children: [
                              Container(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                height: 200,
                                width: 120,
                                child: Image.network(
                                    state.productsList[index].image),
                              ),
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            state.productsList[index].title,
                                            overflow: TextOverflow.ellipsis,
                                            style: kProductTitleStyle,
                                          ),
                                        ),
                                        const Icon(
                                          Icons.heart_broken_outlined,
                                          color: kFluorescentGreen,
                                        )
                                      ],
                                    ),
                                    Text(
                                      state.productsList[index].description,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    Text(
                                      "\$${state.productsList[index].price.toString()}",
                                      style: kProductPriceStyle,
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 80,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              BlocProvider.of<ProductsBloc>(
                                                      context)
                                                  .add(
                                                AddProductEvent(
                                                    product: state
                                                        .productsList[index],
                                                    productList:
                                                        state.productsList),
                                              );
                                            },
                                            style: ElevatedButton.styleFrom(
                                              elevation: 0.25,
                                              primary: state
                                                      .selectedProductsList
                                                      .contains(state
                                                          .productsList[index])
                                                  ? kRed
                                                  : kFluorescentGreen,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(14),
                                              ),
                                            ),
                                            child: state.selectedProductsList
                                                    .contains(state
                                                        .productsList[index])
                                                ? kAdded
                                                : kAdd,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 150,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: 25,
                                                child: ElevatedButton(
                                                  onPressed: () {
                                                    BlocProvider.of<
                                                                ProductsBloc>(
                                                            context)
                                                        .add(
                                                      DecrementEvent(
                                                        productList:
                                                            state.productsList,
                                                        product:
                                                            state.productsList[
                                                                index],
                                                      ),
                                                    );
                                                  },
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    side: const BorderSide(
                                                        width: 2,
                                                        color:
                                                            kFluorescentGreen),
                                                    elevation: 0,
                                                    primary: kWhite,
                                                    shape: const CircleBorder(),
                                                  ),
                                                  child: const Icon(
                                                    Icons.remove,
                                                    size: 15,
                                                    color: kFluorescentGreen,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                state.productsList[index]
                                                    .quantity
                                                    .toString(),
                                                style: kProductQuantityStyle,
                                              ),
                                              SizedBox(
                                                height: 25,
                                                child: ElevatedButton(
                                                  onPressed: () {
                                                    BlocProvider.of<
                                                                ProductsBloc>(
                                                            context)
                                                        .add(
                                                      IncrementEvent(
                                                        product:
                                                            state.productsList[
                                                                index],
                                                        productList:
                                                            state.productsList,
                                                      ),
                                                    );
                                                  },
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    side: const BorderSide(
                                                        width: 2,
                                                        color:
                                                            kFluorescentGreen),
                                                    elevation: 0,
                                                    primary: kWhite,
                                                    shape: const CircleBorder(),
                                                  ),
                                                  child: const Icon(
                                                    Icons.add,
                                                    size: 15,
                                                    color: kFluorescentGreen,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
                
              } else {
                return const CircularProgressIndicator();
              }
              
            },
          )
        ],
      ),
    );
  }
}
