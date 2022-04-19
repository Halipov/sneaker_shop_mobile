import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'user_info.dart';

class UserProfile {
  final int id;
  final String username;
  final List<String> roles;
  final String accessToken;
  final UserInfo userInfo;

  UserProfile({
    required this.id,
    required this.username,
    required this.roles,
    required this.accessToken,
    required this.userInfo,
  });
  factory UserProfile.guest() {
    return UserProfile(
      id: 0,
      username: 'Guest',
      userInfo: UserInfo.guest(),
      accessToken: 'guest',
      roles: [
        'guest',
      ],
    );
  }
  UserProfile copyWith({
    int? id,
    String? username,
    List<String>? roles,
    String? accessToken,
    UserInfo? userInfo,
  }) {
    return UserProfile(
      id: id ?? this.id,
      username: username ?? this.username,
      roles: roles ?? this.roles,
      accessToken: accessToken ?? this.accessToken,
      userInfo: userInfo ?? this.userInfo,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'roles': roles,
      'accessToken': accessToken,
      'userInfo': userInfo.toMap(),
    };
  }

  factory UserProfile.fromMap(Map<String, dynamic> map) {
    return UserProfile(
      id: map['id']?.toInt() ?? 0,
      username: map['username'] ?? '',
      roles: List<String>.from(map['roles']),
      accessToken: map['accessToken'] ?? '',
      userInfo: UserInfo.fromMap(map['userInfo']),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserProfile.fromJson(String source) =>
      UserProfile.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserProfile(id: $id, username: $username, roles: $roles, accessToken: $accessToken, userInfo: $userInfo)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserProfile &&
        other.id == id &&
        other.username == username &&
        listEquals(other.roles, roles) &&
        other.accessToken == accessToken &&
        other.userInfo == userInfo;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        username.hashCode ^
        roles.hashCode ^
        accessToken.hashCode ^
        userInfo.hashCode;
  }
}
