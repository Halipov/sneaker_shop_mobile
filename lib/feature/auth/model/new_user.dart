import 'dart:convert';

import 'user_info.dart';

class NewUser {
  final String userName;
  final String password;
  final UserInfo userInfo;

  NewUser({
    required this.userName,
    required this.password,
    required this.userInfo,
  });

  Map<String, dynamic> toMap() {
    return {
      'username': userName,
      'password': password,
      'userInfo': userInfo.toMap(),
    };
  }

  factory NewUser.fromMap(Map<String, dynamic> map) {
    return NewUser(
      userName: map['username'] ?? '',
      password: map['password'] ?? '',
      userInfo: UserInfo.fromMap(map['userInfo']),
    );
  }

  String toJson() => json.encode(toMap());

  factory NewUser.fromJson(String source) =>
      NewUser.fromMap(json.decode(source));
}
