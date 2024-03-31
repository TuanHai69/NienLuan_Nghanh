import 'package:flutter/material.dart';
import 'edit_article_screen.dart';
import 'package:provider/provider.dart';

import 'user_article_list.dart';
import 'article_manager.dart';

import '../shared/app_drawer.dart';

class UserArticlesScreen extends StatelessWidget {
  static const routeName = '/user-articles';

  const UserArticlesScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Articles'),
          actions: <Widget>[
            AddUserArticleButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                  EditArticleScreen.routeName,
                );
              },
            ),
          ],
        ),
        drawer: const AppDrawer(),
        body: FutureBuilder(
          future: context.read<ArticlesManager>().fetchUserArticles(),
          builder: (ctx, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return RefreshIndicator(
              onRefresh: () =>
                  context.read<ArticlesManager>().fetchUserArticles(),
              child: const UserArticleList(),
            );
          },
        ));
  }
}

class UserArticleList extends StatelessWidget {
  const UserArticleList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ArticlesManager>(
      builder: (ctx, articlesManager, child) {
        return ListView.builder(
          itemCount: articlesManager.itemCount,
          itemBuilder: (ctx, i) => Column(
            children: [
              UserArticleListTile(
                articlesManager.items[i],
              ),
              const Divider(),
            ],
          ),
        );
      },
    );
  }
}

class AddUserArticleButton extends StatelessWidget {
  const AddUserArticleButton({
    super.key,
    this.onPressed,
  });

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: onPressed, icon: const Icon(Icons.add));
  }
}
