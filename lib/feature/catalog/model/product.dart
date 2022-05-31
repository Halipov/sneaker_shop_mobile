import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';

class Product {
  final int id;
  final String article;
  final String name;
  final String description;
  final List<Uint8List> photos;
  final int price;
  final int size;
  Product({
    required this.photos,
    required this.id,
    required this.article,
    required this.name,
    required this.description,
    required this.price,
    required this.size,
  });

  Product copyWith({
    int? id,
    String? article,
    List<Uint8List>? photos,
    String? name,
    String? description,
    int? price,
    int? size,
  }) {
    return Product(
      id: id ?? this.id,
      photos: photos ?? this.photos,
      article: article ?? this.article,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      size: size ?? this.size,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'article': article,
      'name': name,
      'description': description,
      'price': price,
      'size': size,
    };
  }

  Map<String, dynamic> toOrderMap() {
    return {
      'id': id,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id']?.toInt() ?? 0,
      article: map['article'] ?? '',
      photos: map['photos'] != null
          ? List.from(
              map['photos'],
            )
              .map((e) => Uint8List.fromList(base64Decode(e.toString())))
              .toList()
          : [],
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      price: map['price']?.toInt() ?? 0,
      size: map['size']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Product(id: $id, article: $article, name: $name, description: $description, price: $price, size: $size)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Product &&
        other.id == id &&
        other.article == article &&
        other.name == name &&
        other.description == description &&
        other.price == price &&
        other.size == size;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        article.hashCode ^
        name.hashCode ^
        description.hashCode ^
        price.hashCode ^
        size.hashCode;
  }
}
