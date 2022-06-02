import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants/products_consants.dart';
import '../../admin/ui/guest_button.dart';
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

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite'),
      ),
      body: HardCodeConstants().isGuest
          ? const GuestContainer()
          : BlocBuilder<FavoriteBloc, FavoriteState>(
              builder: (context, state) {
                if (state is FavoriteLoadedState) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 25.0,
                        mainAxisSpacing: 25.0,
                        childAspectRatio: 0.7,
                      ),
                      shrinkWrap: true,
                      itemCount: state.products.length,
                      itemBuilder: (context, index) {
                        final item = state.products[index];
                        return InkWell(
                          onTap: () => showDialog(
                            useSafeArea: false,
                            context: context,
                            builder: (_) => ProductDetails(product: item),
                          ).then((value) =>
                              BlocProvider.of<FavoriteBloc>(context)
                                  .add(FetchFavorites())),
                          child: Dismissible(
                            background: Container(
                              color: Colors.redAccent,
                              child: Row(
                                children: [
                                  const Spacer(),
                                  const Icon(
                                    Icons.delete,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                ],
                              ),
                            ),
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
            ),
    );
  }
}
