import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../constants/products_consants.dart';
import '../../catalog/model/product.dart';
import '../../catalog/service/product_service.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final ProductService _productService;
  FavoriteBloc(this._productService) : super(FavoriteInitial()) {
    on<FetchFavorites>((event, emit) async {
      try {
        emit(FavoriteLoadingState());
        final productList = await _productService.fetchFavorite();
        HardCodeConstants().favorite.clear();
        HardCodeConstants().favorite.addAll(productList);
        emit(FavoriteLoadedState(
          products: productList,
        ));
      } on Exception catch (e) {
        emit(
          FavoriteErrorState(message: e.toString()),
        );
      }
    });
    on<UpdateFavorites>((event, emit) async {
      await _productService.updateFavorites(event.productId);
      final productList = await _productService.fetchFavorite();

      // emit(FavoriteLoadingState());
      emit(
        FavoriteLoadedState(
          products: productList,
        ),
      );
    });
  }
}
