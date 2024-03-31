import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../shared/app_drawer.dart';
import 'article_manager.dart';
import 'article_slide_build.dart';

// import '../../models/article.dart';
// import 'article_detail.dart';

enum FilterOptions { favorites, all }

class ArticleSlide extends StatefulWidget {
  static const routeName = '/articles';

  const ArticleSlide({
    super.key,
  });

  @override
  State<ArticleSlide> createState() => _ArticleSlideState();
}

class _ArticleSlideState extends State<ArticleSlide> {
  final _showOnlyFavorites = ValueNotifier<bool>(false);
  late Future<void> _fetchArticles;

  @override
  void initState() {
    super.initState();
    _fetchArticles = context.read<ArticlesManager>().fetchArticles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Articles'),
          actions: [
            ProductFilterMenu(
              onFilterSelected: (filter) {
                setState(() {
                  if (filter == FilterOptions.favorites) {
                    _showOnlyFavorites.value = true;
                  } else {
                    _showOnlyFavorites.value = false;
                  }
                });
              },
            ),
          ],
        ),
        drawer: const AppDrawer(),
        body: FutureBuilder(
          future: _fetchArticles,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(child: Text('An error occurred!'));
            } else {
              return ValueListenableBuilder(
                valueListenable: _showOnlyFavorites,
                builder: (context, onlyFavorites, child) {
                  return BuildSlide(onlyFavorites);
                },
              );
            }
          },
        ));
  }
}

class ProductFilterMenu extends StatelessWidget {
  const ProductFilterMenu({Key? key, this.onFilterSelected}) : super(key: key);

  final void Function(FilterOptions selectedValue)? onFilterSelected;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      onSelected: onFilterSelected,
      icon: const Icon(Icons.more_vert),
      itemBuilder: (ctx) => [
        const PopupMenuItem(
          value: FilterOptions.favorites,
          child: Text('Only Favorites'),
        ),
        const PopupMenuItem(value: FilterOptions.all, child: Text('Show All')),
      ],
    );
  }
}
