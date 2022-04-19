import 'dart:convert';

class User {
  final String password;
  final String userName;

  User({
    this.userName = '',
    this.password = '',
  });

  Map<String, dynamic> toMap() {
    return {
      'password': password,
      'username': userName,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      password: map['password'],
      userName: map['username'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  User copyWith({
    String? password,
    String? userName,
  }) {
    return User(
      password: password ?? this.password,
      userName: userName ?? this.userName,
    );
  }

  @override
  String toString() => 'User(password: $password, userName: $userName)';
}
