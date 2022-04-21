part of 'admin_bloc.dart';

abstract class AdminState extends Equatable {
  const AdminState();

  @override
  List<Object> get props => [];
}

class AdminInitial extends AdminState {}

class AdminLoadingState extends AdminState {}

class AdminLoadedState extends AdminState {
  final List<Product> products;

  AdminLoadedState({
    required this.products,
  });
}

class AdminErrorState extends AdminState {
  final String message;

  AdminErrorState({
    required this.message,
  });
}
