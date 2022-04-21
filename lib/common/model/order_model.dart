import '../../feature/auth/model/user_profile.dart';

class OrderModel {
  final UserProfile user;
  final double totalAmount;
  OrderModel({
    required this.user,
    required this.totalAmount,
  });
}
