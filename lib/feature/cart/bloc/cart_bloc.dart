import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../catalog/model/product.dart';
import '../../catalog/service/product_service.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final ProductService _productService;
  CartBloc(this._productService) : super(CartInitial()) {
    on<FetchCart>((event, emit) async {
      try {
        emit(CartLoadingState());
        final productList = await _productService.fetchCart();
        var sum = 0;
        productList.map((e) {
          sum += e.price;
        }).toList();
        emit(CartLoadedState(
          products: productList,
          sum: sum,
        ));
      } on Exception catch (e) {
        emit(
          CartErrorState(message: e.toString()),
        );
      }
    });
    on<DeleteFromCart>((event, emit) async {
      await _productService.deleteFromCart(event.productId);
      final productList = await _productService.fetchCart();
      var sum = 0.0;
      productList.map((e) {
        sum += e.price;
      }).toList();
      // emit(CartLoadingState());
      emit(
        CartLoadedState(
          products: productList,
          sum: sum.round(),
        ),
      );
    });
  }
}
