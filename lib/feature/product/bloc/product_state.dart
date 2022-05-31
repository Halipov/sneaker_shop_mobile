part of 'product_bloc.dart';

class ProductState extends Equatable {
  final Product product;
  final List<int> sizes;
  const ProductState(this.product, this.sizes);

  @override
  List<Object> get props => [];
}

class ProductInitial extends ProductState {
  ProductInitial(Product product, List<int> sizes) : super(product, sizes);
}

class ProductAddedToCartState extends ProductState {
  ProductAddedToCartState(Product product, List<int> sizes)
      : super(product, sizes);
}

class ProductLoadingState extends ProductState {
  ProductLoadingState(Product product, List<int> sizes) : super(product, sizes);
}

class ErrorState extends ProductState {
  ErrorState(Product product, List<int> sizes) : super(product, sizes);
}
