import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../auth/service/user_service.dart';
import '../../catalog/model/product.dart';
import '../../catalog/service/product_service.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final Product product;
  final ProductService service;
  ProductBloc(this.product, this.service) : super(ProductInitial(product)) {
    on<AddToCartEvent>((event, emit) async {
      try {
        emit(ProductLoadingState(state.product));
        await service.addCart(UserService().user.userInfo.id, event.productId);
        emit(ProductAddedToCartState(state.product));
        await Future.delayed(const Duration(seconds: 1));
        emit(ProductState(state.product));
      } on DioError {
        emit(
          ErrorState(state.product),
        );
      }
    });
    on<AddToFavoriteEvent>((event, emit) async {
      try {
        emit(ProductLoadingState(state.product));
        await service.updateFavorites(event.productId);
        await Future.delayed(const Duration(seconds: 1));
        emit(ProductState(state.product));
      } on DioError {
        emit(
          ErrorState(state.product),
        );
      }
    });
  }
}
