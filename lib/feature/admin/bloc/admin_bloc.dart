import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../constants/products_consants.dart';
import '../../catalog/model/product.dart';

part 'admin_event.dart';
part 'admin_state.dart';

class AdminBloc extends Bloc<AdminEvent, AdminState> {
  AdminBloc() : super(AdminInitial()) {
    on<FetchProducts>((event, emit) async {
      try {
        emit(AdminLoadingState());
        await Future.delayed(
          const Duration(milliseconds: 1000),
        );
        emit(
          AdminLoadedState(
            products: HardCodeConstants().list,
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
