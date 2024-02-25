import 'package:flutter/material.dart';

import 'product_detail.dart';
import '../../models/product.dart';
import 'product_thum.dart';

class ProductSlide extends StatelessWidget {
  const ProductSlide({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
      child: GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
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
              child: ProductsThum(product: products));
        },
      ),
    );
  }
}
