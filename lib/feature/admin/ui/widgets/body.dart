import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/default_button.dart';
import '../../../../constants/products_consants.dart';
import '../../../../constants/size_config.dart';
import '../../../catalog/model/product.dart';
import '../../../product/bloc/product_bloc.dart';
import 'color_dots.dart';
import 'product_description.dart';
import 'product_images.dart';
import 'top_rounded_container.dart';

class Body extends StatelessWidget {
  final Product product;
  final ProductBloc bloc;

  const Body({
    Key? key,
    required this.product,
    required this.bloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ProductImages(product: product),
        TopRoundedContainer(
          color: Colors.white,
          child: Column(
            children: [
              ProductDescription(
                product: product,
                pressOnSeeMore: () {},
              ),
              HardCodeConstants().isGuest
                  ? Container()
                  : TopRoundedContainer(
                      color: const Color(0xFFF6F7F9),
                      child: Column(
                        children: [
                          BlocBuilder<ProductBloc, ProductState>(
                            builder: (context, state) {
                              if (state.sizes.isNotEmpty) {
                                return SizesContainers(sizes: state.sizes);
                              } else {
                                return const CircularProgressIndicator(
                                  strokeWidth: 0.5,
                                );
                              }
                            },
                          ),
                          HardCodeConstants().isGuest
                              ? Container()
                              : TopRoundedContainer(
                                  color: Colors.white,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      left: SizeConfig.screenWidth * 0.15,
                                      right: SizeConfig.screenWidth * 0.15,
                                      bottom: getProportionateScreenWidth(40),
                                      top: getProportionateScreenWidth(15),
                                    ),
                                    child: DefaultButton(
                                      text: 'Add To Cart',
                                      press: () {
                                        bloc.add(
                                          AddToCartEvent(
                                            article: product.article,
                                            size: product.size.toDouble(),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                        ],
                      ),
                    ),
            ],
          ),
        ),
      ],
    );
  }
}
