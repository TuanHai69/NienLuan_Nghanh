import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../ui/cart/cart_manager.dart';
import '../../ui/products/products_overview_screen.dart';
import 'package:provider/provider.dart';
import '../cart/cart_screen.dart';
import '../../ui/products/top_right_badge.dart';
import '../../models/product.dart';
import 'products_manager.dart';

class ProductDetailScreen extends StatefulWidget {
  static const routeName = '/product-detail';

  const ProductDetailScreen(
    this.product, {
    super.key,
  });

  final Product product;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final TextEditingController _value = TextEditingController();
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product.title),
        leading: IconButton(
          icon: const Icon(Icons.home_sharp),
          onPressed: () {
            Navigator.of(context)
                .push(PageTransition(page: const ProductsOverviewScreen()));
          },
        ),
        // Thêm Trái tim
        actions: [
          Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 20.0, 0),
              child: ShoppingCB(
                onPressed: () {
                  Navigator.of(context)
                      .push(PageTransition(page: const CartScreen()));
                },
              )),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 20.0, 0),
            child: ProductGridFooter(
              product: widget.product,
              onFavoritePressed: () {
                context
                    .read<ProductsManager>()
                    .toggleFavoriteStatus(widget.product);
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          SizedBox(
            height: 300,
            width: double.infinity,
            child: Image.network(
              widget.product.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Price: \$${widget.product.price} | Instock: ${widget.product.instock}',
            style: const TextStyle(color: Colors.grey, fontSize: 20),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: 250,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      _count--;
                      _value.text = '$_count';
                      if (_count < 0) {
                        _count = 0;
                        _value.text = '$_count';
                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(const SnackBar(
                            content: Text(
                              'the count must not less than zero',
                              textAlign: TextAlign.center,
                            ),
                          ));
                      }
                    });
                    // dev.log('$_count');
                  },
                  icon: const Icon(
                    Icons.remove,
                    color: Colors.red,
                  ),
                ),
                SizedBox(
                  height: 50,
                  width: 60,
                  child: TextFormField(
                      textAlign: TextAlign.center,
                      controller: _value,
                      onChanged: (newValue) {
                        _value.text = newValue;
                        int? temp = int.tryParse(newValue);
                        if (temp != null) {
                          _count = temp;
                        }
                      },
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      decoration: const InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: InputBorder.none)),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      _count++;
                      _value.text = '$_count';
                      if (_count > widget.product.instock) {
                        _count = widget.product.instock;
                        _value.text = '$_count';
                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(const SnackBar(
                            content: Text(
                              'the count must not greater than instock',
                              textAlign: TextAlign.center,
                            ),
                          ));
                      }
                    });
                  },
                  icon: const Icon(
                    Icons.add,
                    color: Colors.red,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    if (_count == 0) {
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(const SnackBar(
                          content: Text(
                            'The count need to be at least 1',
                            textAlign: TextAlign.center,
                          ),
                        ));
                    } else {
                      context
                          .read<ProductsManager>()
                          .updateProductQuantity(widget.product, _count);
                      context
                          .read<CartManager>()
                          .addDetailItemQuantity(widget.product, _count);
                      setState(() {
                        _count = 0;
                        _value.text = '$_count';
                      });

                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(const SnackBar(
                          content: Text(
                            'The count are add to cart',
                            textAlign: TextAlign.center,
                          ),
                        ));
                    }
                  },
                  icon: const Icon(
                    Icons.shopping_cart,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Align(
            alignment: Alignment(-0.8, 0),
            child: Text(
              'Mô tả sản phẩm :',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            width: double.infinity,
            height: 300,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 3),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Align(
              alignment: const Alignment(-0.8, -0.9),
              child: Text(
                widget.product.description,
                textAlign: TextAlign.center,
                softWrap: true,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          )
        ]),
      ),
    );
  }
}

class FavoriteIcon extends StatelessWidget {
  const FavoriteIcon({
    super.key,
    required this.widget,
    required this.onFavoritePressed,
  });

  final ProductDetailScreen widget;
  final void Function()? onFavoritePressed;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        valueListenable: widget.product.isFavoriteListenable,
        builder: (ctx, isFavorite, child) {
          return GestureDetector(
            onTap: onFavoritePressed,
            child: Icon(widget.product.isFavorite
                ? Icons.favorite
                : Icons.favorite_border),
          );
        });
  }
}

class ShoppingCB extends StatelessWidget {
  const ShoppingCB({super.key, this.onPressed});

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Consumer<CartManager>(builder: (ctx, cartManager, child) {
      return TopRightBadge(
        data: cartManager.productCount,
        child: IconButton(
          icon: const Icon(
            Icons.shopping_cart_outlined,
            color: Colors.red,
          ),
          onPressed: onPressed,
        ),
      );
    });
  }
}

class ProductGridFooter extends StatelessWidget {
  const ProductGridFooter({
    super.key,
    required this.product,
    this.onFavoritePressed,
  });

  final Product product;
  final void Function()? onFavoritePressed;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
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
    );
  }
}

class PageTransition extends PageRouteBuilder {
  final Widget page;

  PageTransition({
    required this.page,
    super.settings,
  }) : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            // Scale from 0 (0% size) to 1 (100% size) during the transition
            final scaleAnimation = Tween(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.easeInOutBack,
              ),
            );

            return Align(
              alignment: Alignment.center,
              child: ScaleTransition(
                scale: scaleAnimation,
                child: child,
              ),
            );
          },
          transitionDuration: const Duration(seconds: 2),
        );
}
