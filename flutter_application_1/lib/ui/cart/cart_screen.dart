import 'package:flutter/material.dart';
import '../../ui/orders/order_manager.dart';
import 'package:provider/provider.dart';

import '../products/products_manager.dart';
import 'cart_manager.dart';
import 'cart_item_card.dart';

class CartScreen extends StatefulWidget {
  static const routeName = '/cart';

  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late Future<void> _fetchCartItems;

  @override
  void initState() {
    super.initState();
    _fetchCartItems = context.read<CartManager>().fetchCartItems();
  }

  @override
  Widget build(BuildContext context) {
    // final cart = CartManager();
    // context.watch có chức năng tương tự như widget consumer
    final cart = context.watch<CartManager>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
      ),
      body: Column(
        children: <Widget>[
          CartSummary(
            cart: cart,
            // Xử lý xự kiện cho nút Order Now
            onOrderNowPressed: cart.totalAmount <= 0
                ? null
                : () {
                    context.read<OrdersManager>().addOrder(
                          cart.products,
                          cart.totalAmount,
                        );
                    cart.clearAllItem();
                  },
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: FutureBuilder(
              future: _fetchCartItems,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return CartItemList(cart);
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// class CartItemList extends StatelessWidget {
//   const CartItemList(
//     this.cart, {
//     super.key,
//   });

//   final CartManager cart;

//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       children: cart.productEntries
//           .map(
//             (entry) => CartItemCard(
//               productId: entry.key,
//               cartItem: entry.value,
//             ),
//           )
//           .toList(),
//     );
//   }
// }
class CartItemList extends StatelessWidget {
  const CartItemList(
    this.cart, {
    super.key,
  });

  final CartManager cart;

  @override
  Widget build(BuildContext context) {
    final productsManager =
        Provider.of<ProductsManager>(context, listen: false);

    return ListView(
      children: cart.productEntries.map(
        (entry) {
          final product = productsManager.findById(entry.key);
          if (product != null) {
            return CartItemCard(
              product: product,
              cartItem: entry.value,
            );
          } else {
            return const Text('Product not found');
          }
        },
      ).toList(),
    );
  }
}

class CartSummary extends StatelessWidget {
  const CartSummary({
    super.key,
    required this.cart,
    this.onOrderNowPressed,
  });

  final CartManager cart;
  final void Function()? onOrderNowPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(15),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Text(
              'Total',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            const Spacer(),
            Chip(
              label: Text(
                '\$${cart.totalAmount.toStringAsFixed(2)}',
                style: Theme.of(context).primaryTextTheme.titleLarge,
              ),
              backgroundColor: Theme.of(context).colorScheme.primary,
            ),
            TextButton(
              onPressed: onOrderNowPressed,
              style: TextButton.styleFrom(
                textStyle: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              child: const Text('ORDER NOW'),
            )
          ],
        ),
      ),
    );
  }
}
