import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../constants/constants.dart';
import '../../auth/service/user_service.dart';
import '../../order/model/order_mode.dart';
import '../../orders/service/orders_service.dart';

class PastOrdersScreen extends StatefulWidget {
  const PastOrdersScreen({Key? key}) : super(key: key);

  @override
  State<PastOrdersScreen> createState() => _PastOrdersScreenState();
}

class _PastOrdersScreenState extends State<PastOrdersScreen> {
  final userInfo = UserService().user.userInfo;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Orders'),
      ),
      body: FutureBuilder<List<Order>>(
        future: OrdersService(Dio()).fetchOrdersByUsers(userInfo.id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final list = snapshot.data!.reversed.toList();
            return ListView.builder(
              shrinkWrap: true,
              itemCount: list.length,
              itemBuilder: (context, index) {
                final item = list[index];
                return InkWell(
                  child: Dismissible(
                    background: const Padding(
                      padding: EdgeInsets.only(right: 10.0),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text('Approve'),
                      ),
                    ),
                    key: Key(item.userInfo.phone),
                    onDismissed: (direction) {
                      // showModalBottomSheet(
                      //   context: context,
                      //   builder: (context) {
                      //     return const Text(
                      //       'approved',
                      //       textAlign: TextAlign.center,
                      //     );
                      //   },
                      // );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      child: Card(
                        color: Colors.grey[100],
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 10,
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${item.userInfo.lastName} ${item.userInfo.firstName}',
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                        ),
                                        maxLines: 2,
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        item.userInfo.phone,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                        ),
                                        maxLines: 2,
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        item.userInfo.address,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                        ),
                                        maxLines: 2,
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Amount: ${item.amount / 100}\$',
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
                                      Text(
                                        'Status: ${item.status}',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: kPrimaryColor,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              ExpansionTile(
                                title: const Text('Products: '),
                                tilePadding: const EdgeInsets.only(bottom: 5),
                                children: item.products
                                    .map(
                                      (e) => Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('[${e.article}] ${e.name}'),
                                          Text('Size: ${e.size}'),
                                          Text('Price: ${e.price}\$'),
                                        ],
                                      ),
                                    )
                                    .toList(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
