part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class ProfileSaveEvent extends ProfileEvent {
  final UserInfo userInfo;
  ProfileSaveEvent({
    required this.userInfo,
  });
}
