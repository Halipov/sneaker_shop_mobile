import 'package:dio/dio.dart';

import '../../../constants/url_config.dart';
import '../model/new_user.dart';
import '../model/user.dart';
import '../model/user_profile.dart';

class AuthService {
  final Dio dio;

  AuthService({
    required this.dio,
  });

  Future<UserProfile> signIn(
    User user,
    // ignore: avoid_positional_boolean_parameters
    bool? rememberMe,
  ) async {
    final endpoint = UrlConfig.endpoint;
    final url = '$endpoint/api/auth/signin';
    print(user.toJson());
    try {
      final response = await dio.post(
        url,
        data: user.toJson(),
        options: Options(
          headers: <String, String>{
            'Content-Type': 'application/json',
          },
        ),
      );
      print(response.data);
      final authResponse = UserProfile.fromMap(response.data);
      return authResponse;
    } on DioError {
      rethrow;
    }
  }

  Future<void> signUp(
    NewUser user,
  ) async {
    final endpoint = UrlConfig.endpoint;
    final url = '$endpoint/api/auth/signup';
    print(user.toJson());
    try {
      final response = await dio.post(
        url,
        data: user.toJson(),
        options: Options(
          headers: <String, String>{
            'Content-Type': 'application/json',
          },
        ),
      );
      print(response.data);
    } on DioError {
      rethrow;
    }
  }
}
