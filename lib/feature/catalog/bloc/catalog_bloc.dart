import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../constants/products_consants.dart';
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
    on<SearchEvent>((event, emit) async {
      emit(
        CatalogLoadingState(),
      );
      final searchedList = HardCodeConstants()
          .list
          .where(
            (element) => element.name.contains(event.text),
          )
          .toList();
      emit(
        CatalogLoadedState(
          products: searchedList,
        ),
      );
    });
  }
}
