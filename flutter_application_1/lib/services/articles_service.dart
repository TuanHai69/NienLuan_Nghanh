import 'dart:convert';
import 'package:flutter_application_1/models/article.dart';

import '../models/auth_token.dart';
import 'firebase_service.dart';
// import '../services/articles_service.dart';

class ArticlesService extends FirebaseService {
  ArticlesService([AuthToken? authToken]) : super(authToken);

  Future<List<Article>> fetcharticles({bool filteredbyUser = false}) async {
    final List<Article> articles = [];

    try {
      final filter =
          filteredbyUser ? 'orderBy="creatorId"&equalTo="$userId"' : '';

      final articlesMap = await httpFetch(
        '$databaseUrl/articles.json?auth=$token&$filter',
      ) as Map<String, dynamic>?;

      final userFavoritesMap = await httpFetch(
        '$databaseUrl/userFavoritesArticle/$userId.json?auth=$token',
      ) as Map<String, dynamic>?;

      articlesMap?.forEach((articleId, article) {
        final isFavorite = (userFavoritesMap == null)
            ? false
            : (userFavoritesMap[articleId] ?? false);
        articles.add(
          Article.fromJson({
            'articleId': articleId,
            ...article,
          }).copyWith(isFavorite: isFavorite),
        );
      });
      return articles;
    } catch (error) {
      print(error);
      return articles;
    }
  }

  Future<Article?> addArticle(Article article) async {
    try {
      final newArticle = await httpFetch(
        '$databaseUrl/articles.json?auth=$token',
        method: HttpMethod.post,
        body: jsonEncode(
          article.toJson()
            ..addAll({
              'articleId': userId,
            }),
        ),
      ) as Map<String, dynamic>?;
      return article.copyWith(
        articleId: newArticle!['name'],
      );
    } catch (error) {
      print(error);
      return null;
    }
  }

  Future<bool> updateArticle(Article article) async {
    try {
      await httpFetch(
        '$databaseUrl/articles/${article.articleId}.json?auth=$token',
        method: HttpMethod.patch,
        body: jsonEncode(article.toJson()),
      );

      return true;
    } catch (error) {
      print(error);
      return false;
    }
  }

  Future<bool> deleteArticle(String id) async {
    try {
      await httpFetch(
        '$databaseUrl/articles/$id.json?auth=$token',
        method: HttpMethod.delete,
      );

      return true;
    } catch (error) {
      print(error);
      return false;
    }
  }

  Future<bool> saveFavoriteStatus(Article article) async {
    try {
      await httpFetch(
        '$databaseUrl/userFavoritesArticle/$userId/${article.articleId}.json?auth=$token',
        method: HttpMethod.put,
        body: jsonEncode(article.isFavorite),
      );

      return true;
    } catch (error) {
      print(error);
      return false;
    }
  }
}
