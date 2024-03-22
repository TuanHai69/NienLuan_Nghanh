import 'dart:convert';
import '../models/cart_item.dart';

// import '../models/product.dart';
import '../models/auth_token.dart';
import 'firebase_service.dart';

class CartService extends FirebaseService {
  CartService([AuthToken? authToken]) : super(authToken);

  Future<Map<String, CartItem>> fetchCartItems() async {
    final Map<String, CartItem> cartItems = {};

    try {
      final cartItemsMap = await httpFetch(
        '$databaseUrl/cartItems/$userId.json?auth=$token',
      ) as Map<String, dynamic>?;

      cartItemsMap?.forEach((cartItemId, cartItemData) {
        cartItems[cartItemId] = CartItem.fromJson({
          'id': cartItemId,
          ...cartItemData,
        });
      });

      return cartItems;
    } catch (error) {
      print(error);
      return cartItems;
    }
  }

  final Map<String, CartItem> _items = {};

  void updateItems(Map<String, CartItem> newItems) {
    _items.clear();
    _items.addAll(newItems);
  }

  Future<void> uploadCartItems() async {
    try {
      await httpFetch(
        '$databaseUrl/cartItems/$userId.json?auth=$token', // Thêm uid vào đường dẫn
        method: HttpMethod.put,
        body:
            jsonEncode(_items.map((key, item) => MapEntry(key, item.toJson()))),
      );
    } catch (error) {
      print(error);
    }
  }
}
