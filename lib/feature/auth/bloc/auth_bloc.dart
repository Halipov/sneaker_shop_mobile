import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../model/user.dart';
import '../model/user_profile.dart';
import '../service/auth_service.dart';
import '../service/user_service.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService _authService;
  final UserService _userService;
  AuthBloc(this._authService, this._userService) : super(AuthInitial()) {
    on<LoginInEvent>(
      (event, emit) async {
        emit(AuthLoadingState());
        try {
          final userInfo = await _authService.signIn(
            event.user,
            event.rememberMe,
          );
          _userService.user = userInfo;
          emit(AuthAuthenticated());
        } on Exception catch (e) {
          emit(
            AuthFailureState(
              errorMessage: e.toString(),
            ),
          );
        }
      },
    );
  }
}
