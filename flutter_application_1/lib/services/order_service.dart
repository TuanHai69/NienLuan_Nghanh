import 'dart:convert';

import '../models/auth_token.dart';
// import '../models/cart_item.dart';
import '../models/cart_item.dart';
import '../models/order_item.dart';
import 'firebase_service.dart';

class OrderService extends FirebaseService {
  OrderService([AuthToken? authToken]) : super(authToken);

  Future<List<OrderItem>> fetchOrders() async {
    final List<OrderItem> orders = [];

    try {
      final orderMap = await httpFetch(
        '$databaseUrl/orders/$userId.json?auth=$token',
      ) as Map<String, dynamic>?;

      orderMap?.forEach((orderId, orderData) {
        var productList = orderData['products'] as List;
        List<CartItem> products =
            productList.map((index) => CartItem.fromJson(index)).toList();

        orders.add(
          OrderItem(
            id: orderId,
            amount: orderData['amount'],
            products: products,
            dateTime: DateTime.parse(orderData['dateTime']),
          ),
        );
      });

      return orders;
    } catch (error) {
      print(error);
      return orders;
    }
  }

  Future<void> addCartOrder(OrderItem orders) async {
    try {
      print(orders);
      await httpFetch(
          '$databaseUrl/orders/$userId.json?auth=$token', // Thêm uid vào đường dẫn
          method: HttpMethod.post,
          body: jsonEncode(orders.toJson())) as Map<String, dynamic>?;
    } catch (error) {
      print(error);
    }
  }
}
