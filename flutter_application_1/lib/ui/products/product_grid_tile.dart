import 'package:flutter/material.dart';
import '../../ui/screens.dart';
import 'package:provider/provider.dart';
import '../../models/product.dart';

class ProductGridTile extends StatelessWidget {
  const ProductGridTile(
    this.product, {
    super.key,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: ProductGridFooter(
          product: product,
          onFavoritePressed: () {
            // product.isFavorite = !product.isFavorite;
            context.read<ProductsManager>().toggleFavoriteStatus(product);
          },
          onAddToCartPressed: () {
            // Đọc ra CartManager dùng context.read
            if (product.instock >= 1) {
              context.read<ProductsManager>().updateProductQuantity(product, 1);
              final cart = context.read<CartManager>();
              cart.addItem(product);

              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    content: const Text(
                      'Item added to cart',
                    ),
                    duration: const Duration(seconds: 2),
                    action: SnackBarAction(
                      label: 'UNDO',
                      onPressed: () {
                        // Xóa product nếu undo
                        context
                            .read<ProductsManager>()
                            .updateProductQuantity(product, -1);

                        cart.removeItem(product.id!);
                      },
                    ),
                  ),
                );
            }
            // print('Add item to cart');
          },
        ),
        child: GestureDetector(
          onTap: () {
            // print('Go to product detail screen');
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: product.id,
            );
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.blue, // Màu của viền
                width: 5, // Độ rộng của viền
              ),
            ),
            child: Image.network(
              product.imageUrl,
              // fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

class ProductGridFooter extends StatelessWidget {
  const ProductGridFooter({
    super.key,
    required this.product,
    this.onFavoritePressed,
    this.onAddToCartPressed,
  });

  final Product product;
  final void Function()? onFavoritePressed;
  final void Function()? onAddToCartPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).colorScheme.secondary, // Màu của viền
            width: 2, // Độ rộng của viền
          ),
          color: Colors.black87,
          borderRadius: BorderRadius.circular(10)),
      child: GridTileBar(
        leading: ValueListenableBuilder<bool>(
          valueListenable: product.isFavoriteListenable,
          builder: (ctx, isFavorite, child) {
            return IconButton(
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
              ),
              color: Theme.of(context).colorScheme.secondary,
              onPressed: onFavoritePressed,
            );
          },
        ),
        title: Text(
          product.title,
          textAlign: TextAlign.center,
        ),
        trailing: IconButton(
          icon: const Icon(Icons.shopping_cart),
          onPressed: onAddToCartPressed,
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
    );
  }
}
