import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../model/order_mode.dart';
import '../service/order_service.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc() : super(OrderInitial()) {
    on<PayEvent>((event, emit) async {
      final service = OrderService();
      await service.initPaymentSheet(
        event.order,
      );
      emit(OrderConfirmState());
    });
  }
}
