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
  double size = 41.0;
  ProductBloc(this.product, this.service)
      : super(
          ProductInitial(product, []),
        ) {
    on<AddToCartEvent>((event, emit) async {
      try {
        emit(ProductLoadingState(state.product, state.sizes));
        await service.addCart(
          UserService().user.userInfo.id,
          event.article,
          size,
        );
        emit(ProductAddedToCartState(state.product, state.sizes));
        await Future.delayed(const Duration(seconds: 1));
        emit(ProductState(state.product, state.sizes));
      } on DioError {
        emit(
          ErrorState(state.product, state.sizes),
        );
      }
    });
    on<AddToFavoriteEvent>((event, emit) async {
      try {
        emit(ProductLoadingState(state.product, state.sizes));
        await service.updateFavorites(event.productId);
        await Future.delayed(const Duration(seconds: 1));
        emit(ProductState(state.product, state.sizes));
      } on DioError {
        emit(
          ErrorState(state.product, state.sizes),
        );
      }
    });
    on<FetchSizes>((event, emit) async {
      try {
        emit(ProductLoadingState(state.product, state.sizes));
        final sizeList = await service.fetchSizes(event.article);
        await Future.delayed(
          const Duration(seconds: 1),
        );
        emit(
          ProductState(state.product, sizeList),
        );
      } on DioError {
        emit(
          ErrorState(state.product, state.sizes),
        );
      }
    });
  }
}
