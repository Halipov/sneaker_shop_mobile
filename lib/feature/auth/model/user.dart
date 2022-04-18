import 'dart:convert';

import 'package:flutter/foundation.dart';

class User {
  final int id;
  final String username;
  final List<String> roles;
  final String accessToken;

  User({
    required this.id,
    required this.username,
    required this.roles,
    required this.accessToken,
  });

  User copyWith({
    int? id,
    String? username,
    List<String>? roles,
    String? accessToken,
  }) {
    return User(
      id: id ?? this.id,
      username: username ?? this.username,
      roles: roles ?? this.roles,
      accessToken: accessToken ?? this.accessToken,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'roles': roles,
      'accessToken': accessToken,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id']?.toInt() ?? 0,
      username: map['username'] ?? '',
      roles: List<String>.from(map['roles']),
      accessToken: map['accessToken'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(id: $id, username: $username, roles: $roles, accessToken: $accessToken)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.id == id &&
        other.username == username &&
        listEquals(other.roles, roles) &&
        other.accessToken == accessToken;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        username.hashCode ^
        roles.hashCode ^
        accessToken.hashCode;
  }
}
