import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants/products_consants.dart';
import '../../cart/ui/widgets/cart_card.dart';
import '../../product/ui/product_details.dart';
import '../bloc/favorite_bloc.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<FavoriteBloc>(context).add(FetchFavorites());

    return BlocBuilder<FavoriteBloc, FavoriteState>(
      builder: (context, state) {
        if (state is FavoriteLoadedState) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Favorite'),
            ),
            body: ListView.builder(
              shrinkWrap: true,
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                final item = state.products[index];
                return InkWell(
                  onTap: () => showDialog(
                    useSafeArea: false,
                    context: context,
                    builder: (_) => ProductDetails(product: item),
                  ).then((value) => BlocProvider.of<FavoriteBloc>(context)
                      .add(FetchFavorites())),
                  child: Dismissible(
                    key: Key(item.name),
                    onDismissed: (direction) {
                      BlocProvider.of<FavoriteBloc>(context)
                          .add(UpdateFavorites(productId: item.id));
                      HardCodeConstants().favorite.remove(item);
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
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
