import 'package:flutter/foundation.dart';
import '../../services/carts_service.dart';

// import 'dart:convert';
import '../../models/cart_item.dart';
import '../../models/product.dart';
// import '../../services/firebase_service.dart';
// import '../../services/carts_service.dart';
import '../../models/auth_token.dart';

class CartManager with ChangeNotifier {
  Map<String, CartItem> _items = {
    // 'p1': CartItem(
    //     id: 'c1',
    //     title: 'Red Shirt',
    //     imageUrl:
    //         'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    //     quantity: 2,
    //     price: 29.99),
  };

  final CartService _cartService;

  CartManager([AuthToken? authToken]) : _cartService = CartService(authToken);

  set authToken(AuthToken? authToken) {
    _cartService.authToken = authToken;
  }

  Future<void> fetchCartItems() async {
    _items = await _cartService.fetchCartItems();
    notifyListeners();
  }

  int get productCount {
    return _items.length;
  }

  List<CartItem> get products {
    return _items.values.toList();
  }

  Iterable<MapEntry<String, CartItem>> get productEntries {
    return {..._items}.entries;
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  Future<void> uploadCartItems() async {
    await _cartService.uploadCartItems();
    notifyListeners();
  }

  void addItem(Product product) async {
    if (_items.containsKey(product.id)) {
      _items.update(
        product.id!,
        (existingCartItem) => existingCartItem.copyWith(
          quantity: existingCartItem.quantity + 1,
        ),
      );
      _cartService.updateItems(_items);
    } else {
      _items.putIfAbsent(
        product.id!,
        () => CartItem(
          id: 'c${DateTime.now().toIso8601String()}',
          title: product.title,
          imageUrl: product.imageUrl,
          price: product.price,
          quantity: 1,
        ),
      );
      _cartService.updateItems(_items);
    }
    notifyListeners();

    await uploadCartItems();
  }

  void removeItem(String productId) async {
    if (!_items.containsKey(productId)) {
      return;
    }
    if (_items[productId]?.quantity as num > 1) {
      _items.update(
        productId,
        (existingCartItem) => existingCartItem.copyWith(
          quantity: existingCartItem.quantity - 1,
        ),
      );
      _cartService.updateItems(_items);
    } else {
      _items.remove(productId);
      _cartService.updateItems(_items);
    }
    notifyListeners();

    await uploadCartItems();
  }

  void clearItem(String productId) async {
    _items.remove(productId);
    _cartService.updateItems(_items);

    notifyListeners();
    await uploadCartItems();
  }

  void clearAllItem() async {
    _items = {};
    _cartService.updateItems(_items);

    notifyListeners();
    await uploadCartItems();
  }

  void addDetailItemQuantity(Product product, int quan) async {
    if (_items.containsKey(product.id)) {
      _items.update(
        product.id!,
        (existingCartItem) => existingCartItem.copyWith(
          quantity: existingCartItem.quantity + quan,
        ),
      );
      _cartService.updateItems(_items);
    } else {
      _items.putIfAbsent(
        product.id!,
        () => CartItem(
          id: 'c${DateTime.now().toIso8601String()}',
          title: product.title,
          imageUrl: product.imageUrl,
          price: product.price,
          quantity: quan,
        ),
      );
      _cartService.updateItems(_items);
    }
    notifyListeners();
    await uploadCartItems();
  }
}
