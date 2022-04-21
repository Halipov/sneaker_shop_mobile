part of 'admin_bloc.dart';

abstract class AdminEvent extends Equatable {
  const AdminEvent();

  @override
  List<Object> get props => [];
}

class FetchProducts extends AdminEvent {}

class DeleteProduct extends AdminEvent {
  final Product product;

  DeleteProduct(this.product);
}

class SearchEvent extends AdminEvent {
  final String text;

  SearchEvent(this.text);
}
