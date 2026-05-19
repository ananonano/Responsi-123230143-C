import 'package:hive_flutter/hive_flutter.dart';
import '../models/cart_model.dart';

class HiveService {
  static final Box<CartModel> _cartBox = Hive.box<CartModel>('cartBox');
  static Future<void> addToCart(CartModel item) async {
    await _cartBox.add(item);
  }

  static List<CartModel> getCartByUsername(String username) {
    return _cartBox.values.where((item) => item.username == username).toList();
  }

  static Future<void> updateCartItem(int hiveKey, CartModel item) async {
    await _cartBox.put(hiveKey, item);
  }

  static Future<void> deleteCartItem(int hiveKey) async {
    await _cartBox.delete(hiveKey);
  }

  static List<dynamic> getCartKeysByUsername(String username) {
    final keys = _cartBox.keys.toList();
    final values = _cartBox.values.toList();
    List<dynamic> userKeys = [];
    for (int i = 0; i < values.length; i++) {
      if (values[i].username == username) {
        userKeys.add(keys[i]);
      }
    }

    return userKeys;
  }
}
