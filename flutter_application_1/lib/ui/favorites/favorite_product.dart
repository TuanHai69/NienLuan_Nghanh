import 'package:flutter/material.dart';

import '../../models/product.dart';

class FavoriteProductsFace extends StatefulWidget {
  final Products product;

  const FavoriteProductsFace({
    super.key,
    required this.product,
  });

  @override
  State<FavoriteProductsFace> createState() => _FavoriteProductsFaceState();
}

class _FavoriteProductsFaceState extends State<FavoriteProductsFace> {
  bool isfavorite = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
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
                  widget.product.image,
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
                widget.product.name,
                maxLines: 1,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                '${widget.product.cost} VNĐ',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(
                width: 80,
              ),
              Text(
                '${widget.product.loveCount}',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(
                width: 10,
              ),
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
            ],
          ),
        ],
      ),
    );
  }
}
