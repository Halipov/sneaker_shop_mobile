import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../catalog/ui/widgets/check_out_card.dart';
import '../../product/ui/product_details.dart';
import '../bloc/cart_bloc.dart';
import 'widgets/cart_card.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CartBloc>(context).add(FetchCart());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoadedState) {
            return Stack(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: CheckoutCard(
                    totalAmount: state.sum,
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.products.length,
                  itemBuilder: (context, index) {
                    final item = state.products[index];
                    return InkWell(
                      onTap: () => showDialog(
                        useSafeArea: false,
                        context: context,
                        builder: (_) => ProductDetails(product: item),
                      ),
                      child: Dismissible(
                        key: Key(item.name),
                        onDismissed: (direction) {
                          BlocProvider.of<CartBloc>(context)
                              .add(DeleteFromCart(productId: item.id));
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return const Text(
                                'deleted from cart',
                                textAlign: TextAlign.center,
                              );
                            },
                          );
                        },
                        child: CartCard(
                          product: item,
                        ),
                      ),
                    );
                  },
                ),
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
