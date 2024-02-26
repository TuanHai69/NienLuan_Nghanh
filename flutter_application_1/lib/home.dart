import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/favorites/favorite_slide.dart';
import 'package:flutter_application_1/ui/products/product_tab_tag.dart';

import 'ui/articals/infor_page.dart';
import 'ui/carts/cart_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static final _pages = <Widget>[
    const InforPage(),
    const ProductTabTag(),
    const FavoritePage(),
    const CartPage(),
    Container(color: Colors.blue),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Fooderlich',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Trang Chủ',
          ),
          NavigationDestination(
            icon: Icon(Icons.shop),
            label: 'Sản phẩm',
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite),
            label: 'Yêu thích',
          ),
          NavigationDestination(
            icon: Icon(Icons.shopping_cart),
            label: 'Giỏ hàng',
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: 'Tài Khoản',
          ),
        ],
        selectedIndex: _selectedIndex,
        onDestinationSelected: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
      ),
    );
  }
}
