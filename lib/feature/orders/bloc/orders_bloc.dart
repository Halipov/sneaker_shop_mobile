import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../order/model/order_mode.dart';
import '../service/orders_service.dart';

part 'orders_event.dart';
part 'orders_state.dart';

class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {
  final OrdersService _service;
  OrdersBloc(
    this._service,
  ) : super(OrdersInitial()) {
    on<FetchOrders>((event, emit) async {
      try {
        emit(OrdersLoadingState());
        final orderList = await _service.fetchOrders();
        emit(OrdersLoadedState(list: orderList));
      } on Exception catch (e) {
        emit(
          OrdersErrorState(message: e.toString()),
        );
      }
    });
  }
}
