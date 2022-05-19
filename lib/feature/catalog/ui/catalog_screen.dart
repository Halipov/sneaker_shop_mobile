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
    BlocProvider.of<CatalogBloc>(context).add(FetchCatalog());
    return SafeArea(
      child: Column(
        children: [
          SizedBox(height: getProportionateScreenHeight(20)),
          Container(
            decoration: BoxDecoration(
              color: kSecondaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(15),
            ),
            child: TextField(
              onChanged: (text) {
                BlocProvider.of<CatalogBloc>(context).add(SearchEvent(
                  text,
                ));
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
          SizedBox(height: getProportionateScreenWidth(10)),
          BlocBuilder<CatalogBloc, CatalogState>(
            builder: (context, state) {
              if (state is CatalogLoadedState) {
                return Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.products.length,
                    itemBuilder: (context, index) {
                      final item = state.products[index];
                      return InkWell(
                        onTap: () => showDialog(
                          useSafeArea: false,
                          context: context,
                          builder: (_) =>
                              ProductDetails(product: state.products[index]),
                        ),
                        child: CartCard(
                          product: item,
                        ),
                      );
                    },
                  ),
                );
              } else {
                return Container(
                  height: 500,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
