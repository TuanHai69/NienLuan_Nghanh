import 'package:flutter/foundation.dart';

import '../../models/auth_token.dart';
import '../../models/cart_item.dart';
import '../../models/order_item.dart';
import '../../services/order_service.dart';

class OrdersManager with ChangeNotifier {
  List<OrderItem> _orders = [
    // OrderItem(
    //   id: 'o1',
    //   amount: 59.98,
    //   products: [
    //     CartItem(
    //       id: 'c1',
    //       title: 'Red Shirt',
    //       imageUrl:
    //           'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    //       price: 29.99,
    //       quantity: 2,
    //     ),
    //   ],
    //   dateTime: DateTime.now(),
    // ),
  ];

  final OrderService _orderService;

  OrdersManager([AuthToken? authToken])
      : _orderService = OrderService(authToken);

  set authToken(AuthToken? authToken) {
    _orderService.authToken = authToken;
  }

  int get orderCount {
    return _orders.length;
  }

  List<OrderItem> get orders {
    return [..._orders];
  }

  Future<void> fetchOrders() async {
    _orders = await _orderService.fetchOrders();
    notifyListeners();
  }

  Future<void> addOrderItem(OrderItem orders) async {
    await _orderService.addCartOrder(orders);
    notifyListeners();
  }

  void addOrder(List<CartItem> cartProducts, double total) async {
    OrderItem order = OrderItem(
      id: 'o${DateTime.now().toIso8601String()}',
      amount: total,
      products: cartProducts,
      dateTime: DateTime.now(),
    );
    notifyListeners();

    await addOrderItem(order);
  }
}
