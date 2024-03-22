import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/artical.dart';
import 'package:flutter_application_1/ui/articals/artical_detail.dart';
import 'package:flutter_application_1/ui/favorites/favorite_artical.dart';
import '../../models/product.dart';
import '../products/product_detail.dart';
import 'favorite_product.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Horizontal ListView
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: Artical.sample.length,
            itemBuilder: (context, index) {
              return GestureDetector(
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
                child: BuildFavoriteSlide(
                  artical: Artical(
                      Artical.sample[index].articalId,
                      Artical.sample[index].title,
                      Artical.sample[index].imageUrl,
                      Artical.sample[index].content,
                      Artical.sample[index].author,
                      Artical.sample[index].release,
                      Artical.sample[index].favorite),
                ),
              );
            },
          ),
        ),
        // Vertical ListView
        Expanded(
          child: SizedBox(
            width: 350,
            child: ListView.builder(
              itemCount: Products.product.length,
              itemBuilder: (context, index) {
                final products = Products.product[index];
                return GestureDetector(
                  onTap: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetail(
                          product: products,
                        ),
                      ),
                    ),
                  },
                  child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(20)),
                      child: FavoriteProductsFace(product: products)),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
