import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../constants/constants.dart';
import '../../../../constants/size_config.dart';
import '../../../cart/ui/widgets/cart_card.dart';
import '../../../product/ui/product_details.dart';
import '../../bloc/admin_bloc.dart';
import 'add_product_screen.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    BlocProvider.of<AdminBloc>(context).add(FetchProducts());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            useSafeArea: true,
            builder: ((context) {
              return AddProductScreen();
            }),
          );
        },
        backgroundColor: kPrimaryColor,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: SafeArea(
          child: BlocBuilder<AdminBloc, AdminState>(
            builder: (context, state) {
              if (state is AdminLoadedState) {
                return Column(
                  children: [
                    SizedBox(
                      height: getProportionateScreenHeight(20),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: kSecondaryColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TextField(
                        onChanged: (text) {
                          BlocProvider.of<AdminBloc>(context)
                              .add(SearchEvent(text));
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
                          prefixIcon: const Icon(
                            Icons.search,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenWidth(10),
                    ),
                    Expanded(
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
                              builder: (_) => AddProductScreen(product: item),
                            ).whenComplete(
                              () => setState(() {}),
                            ),
                            child: Dismissible(
                              key: Key(item.name),
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
                              onDismissed: (direction) {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return const Text(
                                      'deleted',
                                      textAlign: TextAlign.center,
                                    );
                                  },
                                );
                                BlocProvider.of<AdminBloc>(context).add(
                                  DeleteProduct(item),
                                );
                              },
                              child: CartCard(
                                product: item,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
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
        ),
      ),
    );
  }
}
