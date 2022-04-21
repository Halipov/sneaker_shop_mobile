import 'package:flutter/material.dart';

import '../../../constants/constants.dart';
import '../../../constants/products_consants.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final list = HardCodeConstants().orders;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders'),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: list.length,
        itemBuilder: (context, index) {
          final item = list[index];
          return InkWell(
            child: Dismissible(
              key: Key(item.user.username),
              onDismissed: (direction) {
                HardCodeConstants().orders.remove(item);
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return const Text(
                      'approved',
                      textAlign: TextAlign.center,
                    );
                  },
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.user.username,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                          maxLines: 2,
                        ),
                        const SizedBox(height: 10),
                        Text.rich(
                          TextSpan(
                            text: '\$Total Amount: ${item.totalAmount}',
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              color: kPrimaryColor,
                            ),
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
              ),
            ),
          );
        },
      ),
    );
  }
}
