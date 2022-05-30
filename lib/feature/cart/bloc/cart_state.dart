part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartInitial extends CartState {}

class CartLoadingState extends CartState {}

class CartLoadedState extends CartState {
  final List<Product> products;
  final int sum;

  CartLoadedState({
    required this.products,
    required this.sum,
  });
  @override
  List<Object> get props => [sum];

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CartLoadedState && other.sum == sum;
  }

  @override
  int get hashCode => products.hashCode ^ sum.hashCode;
}

class CartErrorState extends CartState {
  final String message;

  CartErrorState({
    required this.message,
  });
}
