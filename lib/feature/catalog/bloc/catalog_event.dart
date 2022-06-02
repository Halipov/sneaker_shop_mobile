part of 'catalog_bloc.dart';

abstract class CatalogEvent extends Equatable {
  const CatalogEvent();

  @override
  List<Object> get props => [];
}

class FetchCatalog extends CatalogEvent {}

class SearchEvent extends CatalogEvent {
  // final List<Product> products;
  final String text;

  SearchEvent(
    this.text,
  );
}

class OnSortEvent extends CatalogEvent {
  final String byOrder;
  final List<Product> products;
  OnSortEvent({
    required this.byOrder,
    required this.products,
  });
}
