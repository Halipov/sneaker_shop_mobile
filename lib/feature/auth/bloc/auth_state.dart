part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoadingState extends AuthState {}

class GuestAuthLoadingState extends AuthState {}

class AuthNotAuthenticated extends AuthState {}

class AuthAuthenticated extends AuthState {}

class AuthAdminAuthenticated extends AuthState {}

class AuthFailureState extends AuthState {
  final String errorMessage;
  final String? appVersion;

  const AuthFailureState({
    required this.errorMessage,
    this.appVersion,
  });

  @override
  List<Object> get props => [errorMessage];
}
