import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants/constants.dart';
import '../../../constants/size_config.dart';
import '../../cart/ui/widgets/cart_card.dart';
import '../../product/ui/product_details.dart';
import '../bloc/catalog_bloc.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final bloc = BlocProvider.of<CatalogBloc>(context);
    bloc.add(FetchCatalog());
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: kSecondaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextField(
                  onChanged: (text) {
                    bloc.add(
                      SearchEvent(
                        text,
                      ),
                    );
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(20),
                      vertical: getProportionateScreenWidth(9),
                    ),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    hintText: 'Search product',
                    prefixIcon: const Icon(Icons.search),
                  ),
                ),
              ),
            ),
            SizedBox(height: getProportionateScreenWidth(10)),
            BlocBuilder<CatalogBloc, CatalogState>(
              builder: (context, state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        bloc.add(
                          OnSortEvent(
                            byOrder: 'name',
                            products: state is CatalogLoadedState
                                ? state.products
                                : [],
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: bloc.orderBy == 'name'
                              ? Colors.orange.withOpacity(0.2)
                              : kSecondaryColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('By Name'),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        bloc.add(
                          OnSortEvent(
                            byOrder: 'price',
                            products: state is CatalogLoadedState
                                ? state.products
                                : [],
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: bloc.orderBy == 'price'
                              ? Colors.orange.withOpacity(0.2)
                              : kSecondaryColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('By Price'),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            SizedBox(height: getProportionateScreenWidth(10)),
            BlocBuilder<CatalogBloc, CatalogState>(
              builder: (context, state) {
                if (state is CatalogLoadedState) {
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 15.0),
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
                              builder: (_) => ProductDetails(
                                product: state.products[index],
                              ),
                            ),
                            child: CartCard(
                              product: item,
                            ),
                          );
                        },
                      ),
                    ),
                  );
                } else {
                  return const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
