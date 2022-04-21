part of 'catalog_bloc.dart';

abstract class CatalogEvent extends Equatable {
  const CatalogEvent();

  @override
  List<Object> get props => [];
}

class FetchCatalog extends CatalogEvent {}

class SearchEvent extends CatalogEvent {
  final String text;

  SearchEvent(this.text);
}
