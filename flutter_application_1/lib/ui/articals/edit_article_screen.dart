import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/article.dart';
import '../shared/dialog_utils.dart';

import 'article_manager.dart';

class EditArticleScreen extends StatefulWidget {
  static const routeName = '/edit-article';

  EditArticleScreen(
    Article? article, {
    super.key,
  }) {
    if (article == null) {
      this.article = Article(
        articleId: null,
        title: '',
        content: '',
        author: '',
        release: DateTime.now(),
        loveCount: 0,
        imageUrl: '',
      );
    } else {
      this.article = article;
    }
  }

  late final Article article;

  @override
  State<EditArticleScreen> createState() => _EditArticleScreenState();
}

class _EditArticleScreenState extends State<EditArticleScreen> {
  final _imageUrlController = TextEditingController();
  final _imageUrlFocusNode = FocusNode();
  final _editForm = GlobalKey<FormState>();
  late Article _editedArticle;
  var _isLoading = false;

  bool _isValidImageUrl(String value) {
    return (value.startsWith('http') || value.startsWith('https')) &&
        (value.endsWith('.png') ||
            value.endsWith('.jpg') ||
            value.endsWith('.jpeg'));
  }

  @override
  void initState() {
    _imageUrlFocusNode.addListener(() {
      if (!_imageUrlFocusNode.hasFocus) {
        if (!_isValidImageUrl(_imageUrlController.text)) {
          return;
        }
        setState(() {});
      }
    });
    _editedArticle = widget.article;
    _imageUrlController.text = _editedArticle.imageUrl;
    super.initState();
  }

  @override
  void dispose() {
    _imageUrlController.dispose();
    _imageUrlFocusNode.dispose();
    super.dispose();
  }

  Future<void> _saveForm() async {
    final isValid = _editForm.currentState!.validate();
    if (!isValid) {
      return;
    }
    _editForm.currentState!.save();

    setState(() {
      _isLoading = true;
    });

    try {
      final articlesManager = context.read<ArticlesManager>();
      if (_editedArticle.articleId != null) {
        await articlesManager.updateArticle(_editedArticle);
      } else {
        await articlesManager.addArticle(_editedArticle);
      }
    } catch (error) {
      if (mounted) {
        await showErrorDialog(context, 'Something went wrong.');
      }
    }

    setState(() {
      _isLoading = false;
    });

    if (mounted) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Article'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: _saveForm,
          ),
        ],
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _editForm,
                child: ListView(
                  children: <Widget>[
                    _buildTitleField(),
                    _buildContentField(),
                    _buildAuthorField(),
                    _buildReleaseField(),
                    _buildLoveCountField(),
                    _buildImageUrlField(),
                  ],
                ),
              ),
            ),
    );
  }

  TextFormField _buildTitleField() {
    return TextFormField(
      initialValue: _editedArticle.title,
      decoration: const InputDecoration(labelText: 'Title'),
      textInputAction: TextInputAction.next,
      autofocus: true,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please provide a value.';
        }
        return null;
      },
      onSaved: (value) {
        _editedArticle = _editedArticle.copyWith(title: value);
      },
    );
  }

  TextFormField _buildContentField() {
    return TextFormField(
      initialValue: _editedArticle.content,
      decoration: const InputDecoration(labelText: 'Content'),
      maxLines: 3,
      keyboardType: TextInputType.multiline,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please provide content.';
        }
        if (value.length < 10) {
          return 'Should be at least 10 characters long.';
        }
        return null;
      },
      onSaved: (value) {
        _editedArticle = _editedArticle.copyWith(content: value);
      },
    );
  }

  TextFormField _buildAuthorField() {
    return TextFormField(
      initialValue: _editedArticle.author,
      decoration: const InputDecoration(labelText: 'Author'),
      textInputAction: TextInputAction.next,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please provide an author.';
        }
        return null;
      },
      onSaved: (value) {
        _editedArticle = _editedArticle.copyWith(author: value);
      },
    );
  }

  TextFormField _buildReleaseField() {
    return TextFormField(
      initialValue: _editedArticle.release.toString(),
      decoration: const InputDecoration(labelText: 'Release Date'),
      textInputAction: TextInputAction.next,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please provide a release date.';
        }
        return null;
      },
      onSaved: (value) {
        _editedArticle =
            _editedArticle.copyWith(release: DateTime.parse(value!));
      },
    );
  }

  TextFormField _buildLoveCountField() {
    return TextFormField(
      initialValue: _editedArticle.loveCount.toString(),
      decoration: const InputDecoration(labelText: 'Love Count'),
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please provide a love count.';
        }
        if (int.tryParse(value) == null) {
          return 'Please enter a valid number.';
        }
        if (int.parse(value) <= 0) {
          return 'Please enter a number greater than zero.';
        }
        return null;
      },
      onSaved: (value) {
        _editedArticle = _editedArticle.copyWith(loveCount: int.parse(value!));
      },
    );
  }

  TextFormField _buildImageUrlField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Image URL'),
      keyboardType: TextInputType.url,
      textInputAction: TextInputAction.done,
      controller: _imageUrlController,
      focusNode: _imageUrlFocusNode,
      onFieldSubmitted: (value) => _saveForm(),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter an image URL.';
        }
        if (!_isValidImageUrl(value)) {
          return 'Please enter a valid image URL.';
        }
        return null;
      },
      onSaved: (value) {
        _editedArticle = _editedArticle.copyWith(imageUrl: value);
      },
    );
  }
}
