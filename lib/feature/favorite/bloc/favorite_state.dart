part of 'favorite_bloc.dart';

abstract class FavoriteState extends Equatable {
  const FavoriteState();

  @override
  List<Object> get props => [];
}

class FavoriteInitial extends FavoriteState {}

class FavoriteLoadingState extends FavoriteState {}

class FavoriteLoadedState extends FavoriteState {
  final List<Product> products;

  FavoriteLoadedState({
    required this.products,
  });
  @override
  List<Object> get props => [];
}

class FavoriteErrorState extends FavoriteState {
  final String message;

  FavoriteErrorState({
    required this.message,
  });
}
