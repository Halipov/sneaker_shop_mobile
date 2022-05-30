part of 'orders_bloc.dart';

abstract class OrdersState extends Equatable {
  const OrdersState();

  @override
  List<Object> get props => [];
}

class OrdersInitial extends OrdersState {}

class OrdersLoadingState extends OrdersState {}

class OrdersLoadedState extends OrdersState {
  final List<Order> list;

  OrdersLoadedState({
    required this.list,
  });
}

class OrdersErrorState extends OrdersState {
  final String message;

  OrdersErrorState({
    required this.message,
  });
}
