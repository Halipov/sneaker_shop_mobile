part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class AddToCartEvent extends ProductEvent {
  final int productId;
  AddToCartEvent({
    required this.productId,
  });
}

class AddToFavoriteEvent extends ProductEvent {
  final int productId;
  AddToFavoriteEvent({
    required this.productId,
  });
}
