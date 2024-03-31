import 'package:flutter/material.dart';
import 'edit_article_screen.dart';
import 'article_manager.dart';
import 'package:provider/provider.dart';

import '../../models/article.dart';

class UserArticleListTile extends StatelessWidget {
  final Article article;

  const UserArticleListTile(
    this.article, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(article.title),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(article.imageUrl),
      ),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: <Widget>[
            EditUserArticleButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                  EditArticleScreen.routeName,
                  arguments: article.articleId,
                );
              },
            ),
            DeleteUserArticleButton(
              onPressed: () {
                context.read<ArticlesManager>();
                // .deleteArticle(article.articleId!);
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Delete an article',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class DeleteUserArticleButton extends StatelessWidget {
  const DeleteUserArticleButton({
    super.key,
    this.onPressed,
  });

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: const Icon(Icons.delete),
      color: Theme.of(context).colorScheme.error,
    );
  }
}

class EditUserArticleButton extends StatelessWidget {
  const EditUserArticleButton({
    super.key,
    this.onPressed,
  });

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: const Icon(Icons.edit),
      color: Theme.of(context).colorScheme.primary,
    );
  }
}
