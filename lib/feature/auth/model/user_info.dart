import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../../catalog/model/product.dart';

class UserInfo {
  final int id;
  final String firstName;
  final String lastName;
  final String phone;
  final String address;
  UserInfo({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.address,
  });
  factory UserInfo.guest() {
    return UserInfo(
      id: 0,
      firstName: '',
      lastName: '',
      phone: '',
      address: '',
    );
  }

  UserInfo copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? phone,
    String? address,
    List<Product>? product,
    Cart? cart,
  }) {
    return UserInfo(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phone: phone ?? this.phone,
      address: address ?? this.address,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'phone': phone,
      'address': address,
    };
  }

  factory UserInfo.fromMap(Map<String, dynamic> map) {
    return UserInfo(
      id: map['id']?.toInt() ?? 0,
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      phone: map['phone'] ?? '',
      address: map['address'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserInfo.fromJson(String source) =>
      UserInfo.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserInfo(id: $id, firstName: $firstName, lastName: $lastName, phone: $phone, address: $address)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserInfo &&
        other.id == id &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.phone == phone &&
        other.address == address;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        phone.hashCode ^
        address.hashCode;
  }
}

class Cart {
  final int id;
  final List<Product> products;
  Cart({
    required this.id,
    required this.products,
  });
  factory Cart.guest() {
    return Cart(
      id: 0,
      products: [],
    );
  }

  Cart copyWith({
    int? id,
    List<Product>? products,
  }) {
    return Cart(
      id: id ?? this.id,
      products: products ?? this.products,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'products': products.map((x) => x.toMap()).toList(),
    };
  }

  factory Cart.fromMap(Map<String, dynamic> map) {
    return Cart(
      id: map['id']?.toInt() ?? 0,
      products: List<Product>.from(
        map['products'].map(
          (x) => Product.fromMap(x),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Cart.fromJson(String source) => Cart.fromMap(json.decode(source));

  @override
  String toString() => 'Cart(id: $id, products: $products)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Cart &&
        other.id == id &&
        listEquals(other.products, products);
  }

  @override
  int get hashCode => id.hashCode ^ products.hashCode;
}
