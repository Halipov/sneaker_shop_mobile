import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../auth/model/user_info.dart';
import '../../auth/service/auth_service.dart';
import '../../auth/service/user_service.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final AuthService authService;
  ProfileBloc(this.authService) : super(ProfileInitial()) {
    on<ProfileSaveEvent>((event, emit) async {
      emit(ProfileLoadingState());
      await authService.updateUser(event.userInfo);
      UserService().user = UserService().user.copyWith(
            userInfo: event.userInfo,
          );
      emit(ProfileLoadedState());
    });
  }
}
