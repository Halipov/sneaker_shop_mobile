part of 'catalog_bloc.dart';

abstract class CatalogState extends Equatable {
  const CatalogState();

  @override
  List<Object> get props => [];
}

class CatalogInitial extends CatalogState {}

class CatalogLoadingState extends CatalogState {}

class CatalogLoadedState extends CatalogState {
  final String orderBy;
  final List<Product> products;

  CatalogLoadedState({
    required this.products,
    required this.orderBy,
  });
}

class CatalogErrorState extends CatalogState {
  final String message;

  CatalogErrorState({
    required this.message,
  });
}
