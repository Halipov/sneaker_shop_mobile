import 'package:flutter/material.dart';

import '../../../constants/products_consants.dart';
import '../../admin/ui/product_details.dart';
import '../../cart/ui/widgets/cart_card.dart';
import 'widgets/check_out_card.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final list = HardCodeConstants().cart;
    var sum = 0.0;
    list.map((e) {
      sum += e.price;
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite'),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: list.length,
        itemBuilder: (context, index) {
          final item = list[index];
          return InkWell(
            onTap: () => Navigator.pushNamed(
              context,
              ProductDetails.routeName,
              arguments: ProductDetailsArguments(product: item),
            ),
            child: Dismissible(
              key: Key(item.name),
              onDismissed: (direction) {
                setState(() {
                  HardCodeConstants().deleteProductFromCart(item);
                });
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
      bottomNavigationBar: CheckoutCard(
        totalAmount: sum,
      ),
    );
  }
}
