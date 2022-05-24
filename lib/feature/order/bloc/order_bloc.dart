import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../auth/model/user_info.dart';
import '../../auth/service/user_service.dart';
import '../../catalog/model/product.dart';
import '../model/order_mode.dart';
import '../service/order_service.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc() : super(OrderInitial()) {
    on<PayEvent>((event, emit) async {
      // TODO: implement event handler
      final service = OrderService();
      await service.initPaymentSheet(
        Order(
          id: 0,
          userInfo: UserService().user.userInfo,
          products: [
            Product(
              photos: [],
              id: 1,
              article: 'article',
              name: 'name',
              description: 'description',
              price: 2000,
              size: 37,
            ),
            Product(
              photos: [],
              id: 1,
              article: 'article',
              name: 'name',
              description: 'description',
              price: 2000,
              size: 37,
            ),
          ],
          amount: 20000,
          status: 'Oplatil',
        ),
      );
    });
  }
}
