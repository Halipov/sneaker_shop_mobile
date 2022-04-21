import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../constants/constants.dart';
import '../../../../constants/products_consants.dart';
import '../../../../constants/size_config.dart';
import '../../../catalog/model/product.dart';

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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Text(
            widget.product.name,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        HardCodeConstants().isAdmin
            ? Container()
            : InkWell(
                onTap: () {
                  setState(() {
                    HardCodeConstants().favorite.contains(widget.product)
                        ? HardCodeConstants().favorite.remove(widget.product)
                        : HardCodeConstants().favorite.add(widget.product);
                  });
                },
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    padding: EdgeInsets.all(getProportionateScreenWidth(15)),
                    width: getProportionateScreenWidth(64),
                    decoration: BoxDecoration(
                      color:
                          HardCodeConstants().favorite.contains(widget.product)
                              ? const Color(0xFFFFE6E6)
                              : const Color(0xFFF5F6F9),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),
                    ),
                    child: SvgPicture.asset(
                      'assets/icons/Heart Icon_2.svg',
                      color:
                          HardCodeConstants().favorite.contains(widget.product)
                              ? const Color(0xFFFF4848)
                              : const Color(0xFFDBDEE4),
                      height: getProportionateScreenWidth(16),
                    ),
                  ),
                ),
              ),
        Padding(
          padding: EdgeInsets.only(
            left: getProportionateScreenWidth(20),
            right: getProportionateScreenWidth(64),
          ),
          child: Text(
            widget.product.description,
            maxLines: 3,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
            vertical: 10,
          ),
          child: GestureDetector(
            onTap: () {},
            child: Row(
              children: [
                const Text(
                  'See More Detail',
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: kPrimaryColor),
                ),
                const SizedBox(width: 5),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                  color: kPrimaryColor,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
