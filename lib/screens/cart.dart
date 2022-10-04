import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/constants/colors.dart';
import 'package:shopping_app/constants/textyle_constants.dart';
import 'package:shopping_app/data/products_model.dart';
import 'package:shopping_app/screens/orders.dart';
import '../bloc/products_bloc.dart';
import '../constants/texts_constants.dart';

class Cart extends StatelessWidget {
  final List<Products> selectedProductsList;
  Cart(this.selectedProductsList);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsBloc, ProductsState>(
      builder: (context, state) {
        if (state is ProductsLoadedState) {
          return Scaffold(
            backgroundColor: kGrey,
            appBar: AppBar(
              title: kCart,
              elevation: 0,
              backgroundColor: kGrey,
            ),
            body: Column(
              children: [
                Center(
                  child: selectedProductsList.isEmpty
                      ? const Text(
                          kAddItemsFirst,
                          style: TextStyle(fontSize: 20),
                        )
                      : SizedBox(
                          height: 600,
                          child: ListView.separated(
                              padding: const EdgeInsets.all(0),
                              itemCount: selectedProductsList.length,
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
                                          child: Image.network(
                                              selectedProductsList[index]
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
                                                        selectedProductsList[
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
                                                selectedProductsList[index]
                                                    .description,
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              const SizedBox(
                                                height: 12,
                                              ),
                                              Text(
                                                  "\$${selectedProductsList[index].price.toString()}",
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
                SizedBox(
                  width: 310,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: kFluorescentGreen,
                      elevation: 0.25,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                    ),
                    child: kBUY,
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
