import '../model/user_info.dart';
import '../model/user_profile.dart';

class UserService {
  UserProfile? _user;

  UserProfile get user => _user ?? UserProfile.guest();

  set user(UserProfile user) => _user = user;
}
