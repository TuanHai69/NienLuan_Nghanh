import 'package:flutter/material.dart';

import 'product_slide.dart';

class ProductTabTag extends StatelessWidget {
  const ProductTabTag({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 3,
      child: Column(
        children: [
          TabBar(
            tabs: [
              Tab(text: 'All'),
              Tab(text: 'New'),
              Tab(text: 'Most favorite'),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                ProductSlide(), // Tab 1 content
                ProductSlide(),
                ProductSlide(), // Tab 2 content
              ],
            ),
          ),
        ],
      ),
    );
  }
}
