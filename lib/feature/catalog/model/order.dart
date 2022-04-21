import 'product.dart';

class Order {
  final String username;
  final List<Product> cart;
  final bool isAprove;

  Order({
    required this.username,
    required this.cart,
    required this.isAprove,
  });
}
