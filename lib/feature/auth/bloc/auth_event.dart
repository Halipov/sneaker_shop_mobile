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

class LogInEvent extends AuthEvent {
  final User user;
  final bool? rememberMe;

  const LogInEvent({
    required this.user,
    this.rememberMe,
  });
}

class SignUpEvent extends AuthEvent {
  final NewUser user;

  SignUpEvent({
    required this.user,
  });
}

class LogOutEvent extends AuthEvent {}
