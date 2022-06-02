import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../model/product.dart';
import '../service/product_service.dart';

part 'catalog_event.dart';
part 'catalog_state.dart';

class CatalogBloc extends Bloc<CatalogEvent, CatalogState> {
  final ProductService _productService;
  String orderBy = 'name';
  CatalogBloc(this._productService) : super(CatalogInitial()) {
    on<FetchCatalog>((event, emit) async {
      try {
        orderBy = 'name';
        emit(CatalogLoadingState());
        final productList = await _productService.fetchProducts();
        productList.sort(
          (a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()),
        );
        emit(
          CatalogLoadedState(
            products: productList,
            orderBy: orderBy,
          ),
        );
      } on Exception catch (e) {
        emit(
          CatalogErrorState(message: e.toString()),
        );
      }
    });
    on<SearchEvent>((event, emit) async {
      emit(CatalogLoadingState());
      final productList = await _productService.fetchProducts();
      List<Product> searchedList;
      final tempList = productList
          .where(
            (element) =>
                element.name.toLowerCase().contains(event.text.toLowerCase()),
          )
          .toList();
      if (orderBy == 'price') {
        tempList.sort(
          (a, b) => a.price.compareTo(b.price),
        );
        searchedList = tempList;
      } else {
        tempList.sort(
          (a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()),
        );
        searchedList = tempList;
      }
      emit(
        CatalogLoadedState(
          products: searchedList,
          orderBy: orderBy,
        ),
      );
    });
    on<OnSortEvent>((event, emit) async {
      emit(CatalogLoadingState());
      List<Product> searchedList;
      if (orderBy == event.byOrder) {
        searchedList = event.products.reversed.toList();
        emit(
          CatalogLoadedState(
            products: searchedList,
            orderBy: orderBy,
          ),
        );
      } else {
        orderBy = event.byOrder;

        if (orderBy == 'price') {
          event.products.sort(
            (a, b) => a.price.compareTo(b.price),
          );
          searchedList = event.products;
        } else {
          event.products.sort(
            (a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()),
          );
          searchedList = event.products;
        }
        emit(
          CatalogLoadedState(
            products: searchedList,
            orderBy: orderBy,
          ),
        );
      }
    });
  }
}
