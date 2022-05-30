import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants/constants.dart';
import '../bloc/orders_bloc.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<OrdersBloc>(context).add(FetchOrders());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders'),
      ),
      body: BlocBuilder<OrdersBloc, OrdersState>(
        builder: (context, state) {
          if (state is OrdersLoadedState) {
            final list = state.list;
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
                                        'Amount: ${item.amount}\$',
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
