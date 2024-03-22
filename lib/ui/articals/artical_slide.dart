import 'package:flutter/material.dart';

import 'artical_slide_build.dart';

import '../../models/artical.dart';
import 'artical_detail.dart';

class ArticalSlide extends StatelessWidget {
  const ArticalSlide({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: Artical.sample.length,
      itemBuilder: (context, index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ArticalDetail(
                              artical: Artical(
                                  Artical.sample[index].articalId,
                                  Artical.sample[index].title,
                                  Artical.sample[index].imageUrl,
                                  Artical.sample[index].content,
                                  Artical.sample[index].author,
                                  Artical.sample[index].release,
                                  Artical.sample[index].favorite),
                            )));
              },
              child: BuildSlide(
                artical: Artical(
                    Artical.sample[index].articalId,
                    Artical.sample[index].title,
                    Artical.sample[index].imageUrl,
                    Artical.sample[index].content,
                    Artical.sample[index].author,
                    Artical.sample[index].release,
                    Artical.sample[index].favorite),
              )
              // Container(
              //     width: 340.0,
              //     margin: const EdgeInsets.all(8.0),
              //     decoration: BoxDecoration(
              //         border: Border.all(color: Colors.black),
              //         image: DecorationImage(
              //             image: AssetImage(Artical.sample[index].imageUrl))),
              //     child: Stack(
              //       children: [
              //         Positioned(
              //           top: 10,
              //           left: 15,
              //           child: Text(
              //             Artical.sample[index].title,
              //             style: const TextStyle(fontSize: 20),
              //           ),
              //         ),
              //         Padding(
              //           padding: const EdgeInsets.all(8.0),
              //           child: Row(
              //             mainAxisAlignment: MainAxisAlignment.end,
              //             children: [
              //               Column(
              //                 children: [
              //                   GestureDetector(
              //                       onTap: () {
              //                         print('Cong 1 trai tim');
              //                       },
              //                       child: const Icon(Icons.favorite)),
              //                   Text('${Artical.sample[index].favorite}'),
              //                 ],
              //               ),
              //             ],
              //           ),
              //         ),
              //         Positioned(
              //           bottom: 10,
              //           right: 15,
              //           child: Text(
              //             Artical.sample[index].author,
              //             style: const TextStyle(fontSize: 20),
              //           ),
              //         ),
              //       ],
              //     )),
              ),
        );
      },
    );
  }
}
