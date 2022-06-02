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

class AddProduct extends AdminEvent {
  final Product product;
  final List<XFile> photos;
  final String sizes;

  AddProduct(this.product, this.photos, this.sizes);
}

class UpdateProduct extends AdminEvent {
  final Product product;
  final String sizes;

  UpdateProduct(this.product, this.sizes);
}

class SearchEvent extends AdminEvent {
  final String text;

  SearchEvent(this.text);
}
