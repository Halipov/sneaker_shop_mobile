import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../constants/products_consants.dart';
import '../model/new_user.dart';
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
    on<LogInEvent>(
      (event, emit) async {
        emit(AuthLoadingState());
        try {
          if (event.user.userName == 'admin') {
            HardCodeConstants().isAdmin = true;
            _userService.user = UserProfile.admin();
            emit(AuthAdminAuthenticated());
          } else {
            HardCodeConstants().isAdmin = false;
            final userInfo = await _authService.signIn(
              event.user,
              event.rememberMe,
            );
            _userService.user = userInfo;
            emit(AuthAuthenticated());
          }
        } on Exception catch (_) {
          emit(
            const AuthFailureState(
              errorMessage: 'invalid password or username',
            ),
          );
        }
      },
    );
    on<SignUpEvent>(
      (event, emit) async {
        emit(AuthLoadingState());
        try {
          HardCodeConstants().isAdmin = false;
          await _authService.signUp(
            event.user,
          );
          final userInfo = await _authService.signIn(
            User(
              userName: event.user.userName,
              password: event.user.password,
            ),
            true,
          );
          _userService.user = userInfo;
          emit(AuthAuthenticated());
        } on Exception catch (_) {
          emit(
            const AuthFailureState(
              errorMessage: 'invalid password or username',
            ),
          );
        }
      },
    );
    on<LogOutEvent>((event, emit) {
      emit(AuthNotAuthenticated());
    });
  }
}
