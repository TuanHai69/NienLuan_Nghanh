import 'package:flutter/foundation.dart';

class Article {
  final String? articleId;
  final String title;
  final String imageUrl;
  final String content;
  final String author;
  final DateTime release;
  int loveCount;
  final ValueNotifier<bool> _isFavorite;

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'content': content,
      'author': author,
      'release': release.toIso8601String(),
      'loveCount': loveCount,
      'imageUrl': imageUrl,
    };
  }

  static Article fromJson(Map<String, dynamic> json) {
    return Article(
      articleId: json['articleId'],
      title: json['title'],
      content: json['content'],
      author: json['author'],
      release: DateTime.parse(json['release']),
      loveCount: json['loveCount'],
      imageUrl: json['imageUrl'],
    );
  }

  Article({
    this.articleId,
    required this.title,
    required this.imageUrl,
    required this.content,
    required this.author,
    required this.release,
    required this.loveCount,
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

  Article copyWith({
    String? articleId,
    String? title,
    String? imageUrl,
    String? content,
    String? author,
    DateTime? release,
    int? loveCount,
    bool? isFavorite,
  }) {
    return Article(
      articleId: articleId ?? this.articleId,
      title: title ?? this.title,
      imageUrl: imageUrl ?? this.imageUrl,
      content: content ?? this.content,
      author: author ?? this.author,
      release: release ?? this.release,
      loveCount: loveCount ?? this.loveCount,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
