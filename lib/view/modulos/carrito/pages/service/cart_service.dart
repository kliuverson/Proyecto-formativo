import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import '../model/cart_model.dart';

class CartService {
  static final ValueNotifier<List<CartItem>> itemsNotifier =
      ValueNotifier<List<CartItem>>([]);

  static late Box<CartItem> _cartBox;

  static Future<void> init() async {
    _cartBox = await Hive.openBox<CartItem>('cartBox');
    itemsNotifier.value = _cartBox.values.toList();
  }

  static List<CartItem> get items => itemsNotifier.value;

  static void addProduct(CartItem item) {
    final index = itemsNotifier.value.indexWhere((e) => e.id == item.id);

    if (index != -1) {
      final updated = itemsNotifier.value[index]
          .copyWith(quantity: itemsNotifier.value[index].quantity + 1);
      _cartBox.put(updated.id, updated);
    } else {
      _cartBox.put(item.id, item);
    }

    itemsNotifier.value = _cartBox.values.toList();
  }

  static void removeProductById(String id) {
    _cartBox.delete(id);
    itemsNotifier.value = _cartBox.values.toList();
  }

  static double get total =>
      itemsNotifier.value.fold(0.0, (sum, item) => sum + item.subtotal);

  static void clearCart() {
    _cartBox.clear();
    itemsNotifier.value = [];
  }
}