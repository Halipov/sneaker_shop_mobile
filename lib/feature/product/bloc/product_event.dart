part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class AddToCartEvent extends ProductEvent {
  final String article;
  final double size;
  AddToCartEvent({
    required this.article,
    required this.size,
  });
}

class AddToFavoriteEvent extends ProductEvent {
  final int productId;
  AddToFavoriteEvent({
    required this.productId,
  });
}

class FetchSizes extends ProductEvent {
  final String article;
  FetchSizes({
    required this.article,
  });
}
