import 'package:flutter/material.dart';

import '../../../constants/products_consants.dart';
import '../../admin/ui/product_details.dart';
import '../../cart/ui/widgets/cart_card.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    final list = HardCodeConstants().favorite;
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
                  HardCodeConstants().deleteProductFromFavorite(item);
                });
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return const Text(
                      'deleted from favorite',
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
    );
  }
}
