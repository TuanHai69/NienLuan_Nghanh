import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'order_manager.dart';
import 'order_item_card.dart';

import '../shared/app_drawer.dart';

class OrdersScreen extends StatefulWidget {
  static const routeName = '/orders';

  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  // late Future<void> _fetchOrders;

  @override
  void initState() {
    super.initState();
    context.read<OrdersManager>().fetchOrders();
  }

  @override
  Widget build(BuildContext context) {
    // final ordersManager = OrdersManager();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your orders'),
      ),
      drawer: const AppDrawer(),
      // Dùng Consumer đọc ra OrdersManager
      body: Consumer<OrdersManager>(
        builder: (ctx, ordersManager, child) {
          return ListView.builder(
            itemCount: ordersManager.orderCount,
            itemBuilder: (ctx, i) => OrderItemCard(ordersManager.orders[i]),
          );
        },
      ),
    );
  }
}
