part of 'orders_bloc.dart';

abstract class OrdersEvent extends Equatable {
  const OrdersEvent();

  @override
  List<Object> get props => [];
}

class FetchOrders extends OrdersEvent {}

class UpdateStatus extends OrdersEvent {
  final int id;
  UpdateStatus({
    required this.id,
  });
}
