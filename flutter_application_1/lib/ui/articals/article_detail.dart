import 'package:flutter/material.dart';

import '../../models/article.dart';

class ArticleDetail extends StatefulWidget {
  final Article article;
  const ArticleDetail({
    super.key,
    required this.article,
  });

  @override
  State<ArticleDetail> createState() => _ArticleDetailState();
}

class _ArticleDetailState extends State<ArticleDetail> {
  bool isfavorite = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.article.author),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 20.0, 0),
            child: GestureDetector(
              onTap: () => {
                setState(() {
                  isfavorite = !isfavorite;
                })
              },
              child: Icon(isfavorite ? Icons.favorite : Icons.favorite_border),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image(
                image: NetworkImage(widget.article.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              widget.article.title,
              style: const TextStyle(fontSize: 22),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(20)),
              padding: const EdgeInsets.all(10),
              child: Text(
                widget.article.content,
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
