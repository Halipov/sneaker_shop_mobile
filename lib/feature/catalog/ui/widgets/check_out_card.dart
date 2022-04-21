import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/default_button.dart';
import '../../../../common/model/order_model.dart';
import '../../../../constants/products_consants.dart';
import '../../../../constants/size_config.dart';
import '../../../auth/service/user_service.dart';

class CheckoutCard extends StatelessWidget {
  final double totalAmount;
  const CheckoutCard({
    Key? key,
    required this.totalAmount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenWidth(15),
        horizontal: getProportionateScreenWidth(30),
      ),
      // height: 174,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -15),
            blurRadius: 20,
            color: const Color(0xFFDADADA).withOpacity(0.15),
          )
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    text: 'Total:\n',
                    children: [
                      TextSpan(
                        text: '\$$totalAmount',
                        style:
                            const TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(190),
                  child: DefaultButton(
                    text: 'Check Out',
                    press: () {
                      HardCodeConstants().orders.add(
                            OrderModel(
                              totalAmount: totalAmount,
                              user: context.read<UserService>().user,
                            ),
                          );
                      // HardCodeConstants().cart.clear();
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return const Text(
                            'Added to orders',
                            textAlign: TextAlign.center,
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
