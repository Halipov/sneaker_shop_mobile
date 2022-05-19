import '../model/user_info.dart';
import '../model/user_profile.dart';

class UserService {
  static UserService? _instance;

  UserService._();

  factory UserService() => _instance ??= UserService._();

  UserProfile? _user;

  UserProfile get user => _user ?? UserProfile.guest();

  set user(UserProfile user) => _user = user;
}
