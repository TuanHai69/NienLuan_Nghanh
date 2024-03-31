import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/ui1/carts/cart_item.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 3,
      child: Column(
        children: [
          TabBar(
            tabs: [
              Tab(text: 'Giỏ hàng'),
              Tab(text: 'Chờ xác nhận'),
              Tab(text: 'Đã giao'),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                CartItemCard(),
                CartItemCard(),
                CartItemCard(),
                // Tab 2 content
              ],
            ),
          ),
        ],
      ),
    );
  }
}
