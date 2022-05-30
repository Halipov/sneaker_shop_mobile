import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/default_button.dart';
import '../../../common/page_name.dart';
import '../../../common/ui/widgets/custom_textfield.dart';
import '../../../constants/size_config.dart';
import '../../auth/model/user_info.dart';
import '../../auth/service/user_service.dart';
import '../../catalog/model/product.dart';
import '../bloc/order_bloc.dart';
import '../model/order_mode.dart';

class OrderScreen extends StatelessWidget {
  final List<Product> productList;
  final int totalAmount;
  const OrderScreen({
    Key? key,
    required this.productList,
    required this.totalAmount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Order'),
        ),
        body: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: CheckoutCard(
                productList: productList,
                totalAmount: totalAmount,
              ),
            ),
            BlocBuilder<OrderBloc, OrderState>(
              builder: (context, state) {
                // return Center(
                //     child: TextButton(
                //   child: const Text('Pay'),
                //   onPressed: () {
                //     BlocProvider.of<OrderBloc>(context).add(PayEvent());
                //   },
                // ));
                final userInfo = UserService().user.userInfo;
                final user = UserService().user;
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PageName(textName: 'Full Name'),
                      TitleWidget(
                        text: '${userInfo.lastName} ${userInfo.firstName}',
                      ),
                      PageName(textName: 'Email'),
                      TitleWidget(
                        text: user.username,
                      ),
                      PageName(textName: 'Phone'),
                      TitleWidget(
                        text: userInfo.phone,
                      ),
                      PageName(textName: 'Address'),
                      TitleWidget(
                        text: userInfo.address,
                      ),
                      PageName(textName: 'Total amount'),
                      TitleWidget(
                        text: '${totalAmount.toString()}\$',
                      ),
                      // Row(
                      //   children: [
                      //     Column(
                      //       crossAxisAlignment: CrossAxisAlignment.start,
                      //       children: [
                      //         PageName(textName: 'City'),
                      //         CustomTextField(
                      //             enterText: 'Enter here', sizeWidth: 3.0)
                      //       ],
                      //     ),
                      //     Column(
                      //       crossAxisAlignment: CrossAxisAlignment.start,
                      //       children: [
                      //         PageName(textName: 'Country'),
                      //         CustomTextField(
                      //             enterText: 'Your country', sizeWidth: 3.0)
                      //       ],
                      //     )
                      //   ],
                      // ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        SizeConfig.screenWidth / 27.4,
        SizeConfig.screenHeight / 341.5,
        SizeConfig.screenWidth / 20.55,
        SizeConfig.screenHeight / 68.3,
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 22),
      ),
    );
  }
}

class CheckoutCard extends StatelessWidget {
  final List<Product> productList;
  final int totalAmount;
  const CheckoutCard({
    Key? key,
    required this.productList,
    required this.totalAmount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userInfo = UserService().user.userInfo;
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: getProportionateScreenWidth(190),
              child: DefaultButton(
                text: 'Pay',
                press: () {
                  BlocProvider.of<OrderBloc>(context).add(
                    PayEvent(
                      order: Order(
                        id: 0,
                        userInfo: userInfo,
                        products: productList,
                        amount: totalAmount,
                        status: 'Paid',
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
