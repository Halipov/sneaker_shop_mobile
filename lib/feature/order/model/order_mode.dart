import 'dart:convert';

import '../../auth/model/user_info.dart';
import '../../catalog/model/product.dart';

class Order {
  final int id;
  final UserInfo userInfo;
  final List<Product> products;
  final int amount;
  final String status;
  final String description;
  Order({
    required this.id,
    required this.userInfo,
    required this.products,
    required this.amount,
    required this.status,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userInfo': userInfo.toOrderMap(),
      'products': products.map((x) => x.toOrderMap()).toList(),
      'amount': amount * 100,
      'status': status,
      'description': description,
    };
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      id: map['id']?.toInt() ?? 0,
      userInfo: UserInfo.fromMap(map['userInfo']),
      products:
          List<Product>.from(map['products']?.map((x) => Product.fromMap(x))),
      amount: map['amount']?.toInt() ?? 0,
      status: map['status'] ?? '',
      description: map['description'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Order.fromJson(String source) => Order.fromMap(json.decode(source));
}
