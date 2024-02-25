import 'package:flutter/material.dart';

import '../../models/product.dart';

class ProductsThum extends StatelessWidget {
  final Products product;

  const ProductsThum({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(20)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  product.image,
                  // fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const SizedBox(
                width: 5,
              ),
              Text(
                product.name,
                maxLines: 1,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                '${product.cost} VNĐ',
                style: Theme.of(context).textTheme.bodyLarge,
              )
            ],
          ),
        ],
      ),
    );
  }
}
