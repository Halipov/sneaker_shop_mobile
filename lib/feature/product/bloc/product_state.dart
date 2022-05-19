part of 'product_bloc.dart';

class ProductState extends Equatable {
  final Product product;
  const ProductState(this.product);

  @override
  List<Object> get props => [];
}

class ProductInitial extends ProductState {
  ProductInitial(Product product) : super(product);
}

class ProductAddedToCartState extends ProductState {
  ProductAddedToCartState(Product product) : super(product);
}

class ProductLoadingState extends ProductState {
  ProductLoadingState(Product product) : super(product);
}

class ErrorState extends ProductState {
  ErrorState(Product product) : super(product);
}
