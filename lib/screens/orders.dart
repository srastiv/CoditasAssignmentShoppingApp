import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/blocs/products_bloc/products_bloc.dart';
import 'package:shopping_app/constants/texts_constants.dart';

import '../constants/colors.dart';
import '../constants/textyle_constants.dart';
import '../data/products_model.dart';

class Orders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsBloc, ProductsState>(
      builder: (context, state) {
        if (state is ProductsLoadedState) {
          return Scaffold(
            backgroundColor: kGrey,
            appBar: AppBar(
              title: kOrders,
              elevation: 0,
              backgroundColor: kGrey,
            ),
            body: Column(
              children: [
                Center(
                  child: state.selectedProductsList.isEmpty
                      ? const Center(
                          child: Text(
                            kNoPurchaseHistoryAvailable,
                            style: TextStyle(fontSize: 20),
                          ),
                        )
                      : SizedBox(
                          height: 600,
                          child: ListView.separated(
                              padding: const EdgeInsets.all(0),
                              itemCount: state.selectedProductsList.length,
                              separatorBuilder:
                                  (BuildContext context, int index) =>
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
                                          padding: const EdgeInsets.only(
                                              left: 10, right: 10),
                                          height: 200,
                                          width: 120,
                                          child: Image.network(state
                                              .selectedProductsList[index]
                                              .image),
                                        ),
                                        Flexible(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                        state
                                                            .selectedProductsList[
                                                                index]
                                                            .title,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style:
                                                            kProductTitleStyle),
                                                  ),
                                                  const Icon(
                                                    Icons.heart_broken_outlined,
                                                    color: kFluorescentGreen,
                                                  )
                                                ],
                                              ),
                                              Text(
                                                state
                                                    .selectedProductsList[index]
                                                    .description,
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              const SizedBox(
                                                height: 12,
                                              ),
                                              Text(
                                                  "\$${state.selectedProductsList[index].price.toString()}",
                                                  style: kProductPriceStyle),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ),
                ),
              ],
            ),
          );
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
