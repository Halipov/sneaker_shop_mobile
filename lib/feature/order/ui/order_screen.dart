import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/page_name.dart';
import '../../../common/ui/widgets/custom_textfield.dart';
import '../../catalog/model/product.dart';
import '../bloc/order_bloc.dart';

class OrderScreen extends StatelessWidget {
  final List<Product> productList;
  final double totalAmount;
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
        body: BlocBuilder<OrderBloc, OrderState>(
          builder: (context, state) {
            // return Center(
            //     child: TextButton(
            //   child: const Text('Pay'),
            //   onPressed: () {
            //     BlocProvider.of<OrderBloc>(context).add(PayEvent());
            //   },
            // ));
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PageName(textName: 'Full Name'),
                  CustomTextField(
                    enterText: 'Enter your full name',
                    sizeWidth: 1.18,
                  ), //350
                  PageName(textName: 'Email'),
                  CustomTextField(
                    enterText: 'Enter your e-mail',
                    sizeWidth: 1.18,
                  ),
                  PageName(textName: 'Phone'),
                  CustomTextField(
                    enterText: 'Enter your phone number',
                    sizeWidth: 1.18,
                  ),
                  PageName(textName: 'Address'),
                  CustomTextField(
                    enterText: 'Type your home address',
                    sizeWidth: 1.18,
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          PageName(textName: 'City'),
                          CustomTextField(
                              enterText: 'Enter here', sizeWidth: 3.0)
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          PageName(textName: 'Country'),
                          CustomTextField(
                              enterText: 'Your country', sizeWidth: 3.0)
                        ],
                      )
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
