import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../constants/products_consants.dart';
import '../../../../constants/size_config.dart';
import '../../../catalog/model/product.dart';
import '../../../product/bloc/product_bloc.dart';

class ProductDescription extends StatefulWidget {
  const ProductDescription({
    Key? key,
    required this.product,
    this.pressOnSeeMore,
  }) : super(key: key);

  final Product product;
  final GestureTapCallback? pressOnSeeMore;

  @override
  State<ProductDescription> createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Text(
            widget.product.name,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 25.0,
            right: HardCodeConstants().isGuest ? 20.0 : 0,
          ),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.product.description,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              HardCodeConstants().isGuest
                  ? Container()
                  : HardCodeConstants().isAdmin
                      ? Container()
                      : InkWell(
                          onTap: () {
                            setState(() {
                              BlocProvider.of<ProductBloc>(context).add(
                                  AddToFavoriteEvent(
                                      productId: widget.product.id));
                              HardCodeConstants()
                                      .favorite
                                      .contains(widget.product)
                                  ? HardCodeConstants()
                                      .favorite
                                      .remove(widget.product)
                                  : HardCodeConstants()
                                      .favorite
                                      .add(widget.product);
                            });
                          },
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              padding: EdgeInsets.all(
                                  getProportionateScreenWidth(15)),
                              width: getProportionateScreenWidth(64),
                              decoration: BoxDecoration(
                                color: HardCodeConstants()
                                        .favorite
                                        .contains(widget.product)
                                    ? const Color(0xFFFFE6E6)
                                    : const Color(0xFFF5F6F9),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomLeft: Radius.circular(20),
                                ),
                              ),
                              child: SvgPicture.asset(
                                'assets/icons/Heart Icon_2.svg',
                                color: HardCodeConstants()
                                        .favorite
                                        .contains(widget.product)
                                    ? const Color(0xFFFF4848)
                                    : const Color(0xFFDBDEE4),
                                height: getProportionateScreenWidth(16),
                              ),
                            ),
                          ),
                        ),
            ],
          ),
        ),
      ],
    );
  }
}
