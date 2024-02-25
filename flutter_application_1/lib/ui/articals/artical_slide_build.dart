import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/artical.dart';

class BuildSlide extends StatefulWidget {
  final Artical artical;
  const BuildSlide({super.key, required this.artical});

  @override
  State<BuildSlide> createState() => _BuildSlideState();
}

class _BuildSlideState extends State<BuildSlide> {
  bool isfavorite = false;

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
              child: Text(
                widget.artical.title,
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
                        onTap: () => {
                          setState(() {
                            isfavorite = !isfavorite;
                          })
                        },
                        child: Icon(isfavorite
                            ? Icons.favorite
                            : Icons.favorite_border),
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
