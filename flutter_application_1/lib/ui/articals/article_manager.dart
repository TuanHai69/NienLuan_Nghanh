import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/models/article.dart';

import '../../models/auth_token.dart';
import '../../services/articles_service.dart';

class ArticlesManager with ChangeNotifier {
  List<Article> _samples = [
    // Article(
    //     title: 'title',
    //     imageUrl: 'image/article1.jpg',
    //     content:
    //         'Monkey D. Luffy, còn được gọi là “Luffy Mũ Rơm”, là nhân vật chính trong bộ truyện tranh “One Piece” nổi tiếng trên toàn thế giới. Luffy là một cậu bé với ước mơ lớn: trở thành Vua Hải Tặc. Cậu ta có một niềm tin không thể lay chuyển vào bản thân và khả năng của mình, cùng với lòng dũng cảm để đối mặt với mọi thử thách.'
    //         'Luffy sở hữu sức mạnh của trái ác quỷ Gomu Gomu, cho phép cơ thể của cậu co giãn như cao su. Điều này không chỉ tạo ra những cảnh quay hành động hấp dẫn, mà còn mang lại nhiều tình huống hài hước. Luffy thường sử dụng sức mạnh này một cách sáng tạo để đánh bại kẻ thù và bảo vệ bạn bè của mình.',
    //     author: 'author',
    //     release: DateTime.parse('2024-01-25'),
    //     loveCount: 200),
    // Article(
    //     title: 'title',
    //     imageUrl: 'image/article2.jpg',
    //     content:
    //         'Monkey D. Luffy, còn được gọi là “Luffy Mũ Rơm”, là nhân vật chính trong bộ truyện tranh “One Piece” nổi tiếng trên toàn thế giới. Luffy là một cậu bé với ước mơ lớn: trở thành Vua Hải Tặc. Cậu ta có một niềm tin không thể lay chuyển vào bản thân và khả năng của mình, cùng với lòng dũng cảm để đối mặt với mọi thử thách.'
    //         'Luffy sở hữu sức mạnh của trái ác quỷ Gomu Gomu, cho phép cơ thể của cậu co giãn như cao su. Điều này không chỉ tạo ra những cảnh quay hành động hấp dẫn, mà còn mang lại nhiều tình huống hài hước. Luffy thường sử dụng sức mạnh này một cách sáng tạo để đánh bại kẻ thù và bảo vệ bạn bè của mình.',
    //     author: 'author',
    //     release: DateTime.parse('2024-01-25'),
    //     loveCount: 200),
    // Article(
    //     title: 'title',
    //     imageUrl: 'image/article3.jpg',
    //     content:
    //         'Monkey D. Luffy, còn được gọi là “Luffy Mũ Rơm”, là nhân vật chính trong bộ truyện tranh “One Piece” nổi tiếng trên toàn thế giới. Luffy là một cậu bé với ước mơ lớn: trở thành Vua Hải Tặc. Cậu ta có một niềm tin không thể lay chuyển vào bản thân và khả năng của mình, cùng với lòng dũng cảm để đối mặt với mọi thử thách.'
    //         'Luffy sở hữu sức mạnh của trái ác quỷ Gomu Gomu, cho phép cơ thể của cậu co giãn như cao su. Điều này không chỉ tạo ra những cảnh quay hành động hấp dẫn, mà còn mang lại nhiều tình huống hài hước. Luffy thường sử dụng sức mạnh này một cách sáng tạo để đánh bại kẻ thù và bảo vệ bạn bè của mình.',
    //     author: 'author',
    //     release: DateTime.parse('2024-01-25'),
    //     loveCount: 200),
    // Article(
    //     title: 'title',
    //     imageUrl: 'image/article4.jpg',
    //     content:
    //         'Monkey D. Luffy, còn được gọi là “Luffy Mũ Rơm”, là nhân vật chính trong bộ truyện tranh “One Piece” nổi tiếng trên toàn thế giới. Luffy là một cậu bé với ước mơ lớn: trở thành Vua Hải Tặc. Cậu ta có một niềm tin không thể lay chuyển vào bản thân và khả năng của mình, cùng với lòng dũng cảm để đối mặt với mọi thử thách.'
    //         'Luffy sở hữu sức mạnh của trái ác quỷ Gomu Gomu, cho phép cơ thể của cậu co giãn như cao su. Điều này không chỉ tạo ra những cảnh quay hành động hấp dẫn, mà còn mang lại nhiều tình huống hài hước. Luffy thường sử dụng sức mạnh này một cách sáng tạo để đánh bại kẻ thù và bảo vệ bạn bè của mình.',
    //     author: 'author',
    //     release: DateTime.parse('2024-01-25'),
    //     loveCount: 200),
  ];

  final ArticlesService _articlesService;

  ArticlesManager([AuthToken? authToken])
      : _articlesService = ArticlesService(authToken);

  set authToken(AuthToken? authToken) {
    _articlesService.authToken = authToken;
  }

  Future<void> fetchArticles() async {
    _samples = await _articlesService.fetcharticles();
    notifyListeners();
  }

  Future<void> fetchUserArticles() async {
    _samples = await _articlesService.fetcharticles(
      filteredbyUser: true,
    );
    notifyListeners();
  }

  Future<void> addArticle(Article article) async {
    final newArticle = await _articlesService.addArticle(article);
    if (newArticle != null) {
      _samples.add(newArticle);
      notifyListeners();
    }
  }

  int get itemCount {
    return _samples.length;
  }

  List<Article> get items {
    return [..._samples];
  }

  List<Article> get favoriteItems {
    return _samples.where((item) => item.isFavorite).toList();
  }

  Article? findById(String id) {
    try {
      return _samples.firstWhere((item) => item.articleId == id);
    } catch (error) {
      return null;
    }
  }

  Future<void> updateArticle(Article article) async {
    final index =
        _samples.indexWhere((item) => item.articleId == article.articleId);
    if (index >= 0) {
      if (await _articlesService.updateArticle(article)) {
        _samples[index] = article;
        notifyListeners();
      }
    }
  }

  Future<void> updateArticleLoveCount(Article article, int loveCount) async {
    article.loveCount += loveCount;
    final index =
        _samples.indexWhere((item) => item.articleId == article.articleId);
    if (index >= 0) {
      if (await _articlesService.updateArticle(article)) {
        _samples[index] = article;
        notifyListeners();
      }
    }
  }

  Future<void> toggleFavoriteStatus(Article article) async {
    final savedStatus = article.isFavorite;
    article.isFavorite = !savedStatus;

    if (!await _articlesService.saveFavoriteStatus(article)) {
      article.isFavorite = savedStatus;
    }
  }

  Future<void> deleteArticle(String id) async {
    final index = _samples.indexWhere((item) => item.articleId == id);
    Article? existingArticle = _samples[index];
    _samples.removeAt(index);
    notifyListeners();

    if (!await _articlesService.deleteArticle(id)) {
      _samples.insert(index, existingArticle);
      notifyListeners();
    }
  }
}
