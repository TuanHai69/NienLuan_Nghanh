import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/article.dart';
import 'article_detail.dart';
import 'article_manager.dart';

class BuildSlide extends StatefulWidget {
  final bool showFavorites;

  const BuildSlide(
    this.showFavorites, {
    super.key,
  });

  @override
  State<BuildSlide> createState() => _BuildSlideState();
}

class _BuildSlideState extends State<BuildSlide> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final articles = context.select<ArticlesManager, List<Article>>(
        (articlesManager) => widget.showFavorites
            ? articlesManager.favoriteItems
            : articlesManager.items);

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: articles.length,
      itemBuilder: (context, index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ArticleDetail(
                    article: articles[index],
                  ),
                ),
              );
            },
            child: Container(
              width: 340.0,
              margin: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                image: DecorationImage(
                  image: NetworkImage(
                    articles[index].imageUrl,
                  ),
                  // fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 10,
                    left: 15,
                    child: Text(
                      articles[index].title,
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isFavorite = !isFavorite;
                                });
                              },
                              child: Icon(isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border),
                            ),
                            Text('${articles[index].loveCount}'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 15,
                    child: Text(
                      articles[index].author,
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
