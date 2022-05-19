part of 'favorite_bloc.dart';

abstract class FavoriteEvent extends Equatable {
  const FavoriteEvent();

  @override
  List<Object> get props => [];
}

class FetchFavorites extends FavoriteEvent {}

class UpdateFavorites extends FavoriteEvent {
  final int productId;
  UpdateFavorites({
    required this.productId,
  });
}
