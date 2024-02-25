import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/artical.dart';

class BuildFavoriteSlide extends StatefulWidget {
  final Artical artical;
  const BuildFavoriteSlide({super.key, required this.artical});

  @override
  State<BuildFavoriteSlide> createState() => _BuildFavoriteSlideState();
}

class _BuildFavoriteSlideState extends State<BuildFavoriteSlide> {
  bool isfavorite = true;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 340.0,
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            image: DecorationImage(image: AssetImage(widget.artical.imageUrl))),
        child: Stack(
          children: [
            Positioned(
              top: 10,
              left: 15,
              child: Opacity(
                opacity: 0.8,
                child: Text(
                  widget.artical.title,
                  style: TextStyle(
                      fontSize: 20,
                      backgroundColor: Colors.black.withOpacity(0.75),
                      color: Colors.white),
                ),
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
                        onTap: () => {
                          setState(() {
                            isfavorite = !isfavorite;
                          })
                        },
                        child: Icon(
                          isfavorite ? Icons.favorite : Icons.favorite_border,
                          color: Colors.pink,
                        ),
                      ),
                      Text('${widget.artical.favorite}'),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 10,
              right: 15,
              child: Text(
                widget.artical.author,
                style: const TextStyle(fontSize: 20),
              ),
            ),
          ],
        ));
  }
}
