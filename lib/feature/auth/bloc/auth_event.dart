part of 'auth_bloc.dart';

abstract class UserAction {
  String? get userName => null;
  String? get password => null;
}

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LoginInEvent extends AuthEvent {
  final User user;
  final bool? rememberMe;

  const LoginInEvent({
    required this.user,
    this.rememberMe,
  });
}

class LogOutEvent extends AuthEvent {}
