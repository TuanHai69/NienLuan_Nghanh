import 'package:flutter/foundation.dart';

class Product {
  final String? id;
  final String title;
  final String description;
  final double price;
  int instock;
  final int loveCount;
  final String imageUrl;
  final ValueNotifier<bool> _isFavorite;

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'price': price,
      'instock': instock,
      'loveCount': loveCount,
      'imageUrl': imageUrl,
    };
  }

  static Product fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: json['price'],
      instock: json['instock'],
      loveCount: json['loveCount'],
      imageUrl: json['imageUrl'],
    );
  }

  Product({
    this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.instock,
    required this.loveCount,
    required this.imageUrl,
    isFavorite = false,
  }) : _isFavorite = ValueNotifier(isFavorite);

  set isFavorite(bool newValue) {
    _isFavorite.value = newValue;
  }

  bool get isFavorite {
    return _isFavorite.value;
  }

  ValueNotifier<bool> get isFavoriteListenable {
    return _isFavorite;
  }

  Product copyWith({
    String? id,
    String? title,
    String? description,
    double? price,
    int? instock,
    int? loveCount,
    String? imageUrl,
    bool? isFavorite,
  }) {
    return Product(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      price: price ?? this.price,
      instock: instock ?? this.instock,
      loveCount: loveCount ?? this.loveCount,
      imageUrl: imageUrl ?? this.imageUrl,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
