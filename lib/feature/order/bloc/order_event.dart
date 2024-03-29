part of 'order_bloc.dart';

abstract class OrderEvent extends Equatable {
  const OrderEvent();

  @override
  List<Object> get props => [];
}

class PayEvent extends OrderEvent {
  final Order order;
  PayEvent({
    required this.order,
  });
}
