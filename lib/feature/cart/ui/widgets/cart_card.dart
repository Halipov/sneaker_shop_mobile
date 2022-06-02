import 'package:flutter/material.dart';

import '../../../../constants/constants.dart';
import '../../../../constants/size_config.dart';
import '../../../catalog/model/product.dart';

class CartCard extends StatelessWidget {
  const CartCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF5F6F9),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          SizedBox(
            width: 100,
            child: AspectRatio(
              aspectRatio: 0.88,
              child: Container(
                child: product.photos.isNotEmpty
                    ? Image.memory(
                        product.photos[0],
                        filterQuality: FilterQuality.high,
                      )
                    : Container(),
              ),
            ),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                product.name,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
                maxLines: 2,
              ),
              const SizedBox(height: 5),
              Container(
                margin: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        product.description,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,

                          // children: [
                          //   TextSpan(
                          //       text: ' x${cart.numOfItem}',
                          //       style: Theme.of(context).textTheme.bodyText1),
                          // ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Text(
                '\$${product.price}',
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: kPrimaryColor,

                  // children: [
                  //   TextSpan(
                  //       text: ' x${cart.numOfItem}',
                  //       style: Theme.of(context).textTheme.bodyText1),
                  // ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
