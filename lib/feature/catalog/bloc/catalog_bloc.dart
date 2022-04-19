import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../model/product.dart';
import '../service/product_service.dart';

part 'catalog_event.dart';
part 'catalog_state.dart';

class CatalogBloc extends Bloc<CatalogEvent, CatalogState> {
  final ProductService _productService;
  CatalogBloc(this._productService) : super(CatalogInitial()) {
    on<FetchCatalog>((event, emit) async {
      try {
        emit(CatalogLoadingState());
        final productList = await _productService.fetchProducts();
        emit(CatalogLoadedState(products: productList));
      } on Exception catch (e) {
        emit(
          CatalogErrorState(message: e.toString()),
        );
      }
    });
  }
}
