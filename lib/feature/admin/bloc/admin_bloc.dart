import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

import '../../../constants/products_consants.dart';
import '../../catalog/model/product.dart';
import '../../catalog/service/product_service.dart';

part 'admin_event.dart';
part 'admin_state.dart';

class AdminBloc extends Bloc<AdminEvent, AdminState> {
  final ProductService _productService;
  AdminBloc(this._productService) : super(AdminInitial()) {
    on<FetchProducts>((event, emit) async {
      try {
        emit(AdminLoadingState());
        final productList = await _productService.fetchProducts();
        emit(
          AdminLoadedState(
            products: productList,
          ),
        );
      } on Exception catch (e) {
        emit(
          AdminErrorState(message: e.toString()),
        );
      }
    });
    on<DeleteProduct>((event, emit) async {
      try {
        emit(AdminLoadingState());

        await _productService.deleteProduct(event.product.id);
        final productList = await _productService.fetchProducts();
        emit(
          AdminLoadedState(
            products: productList,
          ),
        );
        emit(
          AdminLoadedState(
            products: HardCodeConstants().deleteProduct(event.product),
          ),
        );
      } on Exception catch (e) {
        emit(
          AdminErrorState(message: e.toString()),
        );
      }
    });
    on<AddProduct>((event, emit) async {
      try {
        emit(AdminLoadingState());

        final id = await _productService.addProduct(event.product);

        for (final element in event.photos) {
          final file = File(element.path);
          await _productService.addPhoto(file, id);
        }
        final productList = await _productService.fetchProducts();
        emit(
          AdminLoadedState(
            products: productList,
          ),
        );

        emit(
          AdminLoadedState(
            products: HardCodeConstants().deleteProduct(event.product),
          ),
        );
      } on Exception catch (e) {
        emit(
          AdminErrorState(message: e.toString()),
        );
      }
    });
    on<SearchEvent>((event, emit) async {
      emit(
        AdminLoadingState(),
      );
      final searchedList = HardCodeConstants()
          .list
          .where(
            (element) => element.name.contains(event.text),
          )
          .toList();
      emit(
        AdminLoadedState(
          products: searchedList,
        ),
      );
    });
  }
}
