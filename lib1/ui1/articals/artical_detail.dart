import 'package:flutter/material.dart';

import '../../models/artical.dart';

class ArticalDetail extends StatefulWidget {
  final Artical artical;
  const ArticalDetail({
    super.key,
    required this.artical,
  });

  @override
  State<ArticalDetail> createState() => _ArticalDetailState();
}

class _ArticalDetailState extends State<ArticalDetail> {
  bool isfavorite = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.artical.author),
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
              image: AssetImage(widget.artical.imageUrl),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            widget.artical.title,
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
              widget.artical.content,
              style: const TextStyle(fontSize: 18),
            ),
          ),
        ],
      )),
    );
  }
}
