import 'package:flutter/foundation.dart';
import '../model/cart_model.dart';

class CartService {
  static final ValueNotifier<List<CartItem>> itemsNotifier =
      ValueNotifier<List<CartItem>>([]);

  static List<CartItem> get items => itemsNotifier.value;

  static void addProduct(CartItem item) {
    final list = List<CartItem>.from(itemsNotifier.value);
    final index = list.indexWhere((e) => e.id == item.id);

    if (index != -1) {
      list[index].quantity++;
    } else {
      list.add(item);
    }

    itemsNotifier.value = list;
  }

  static void removeProductById(String id) {
    final list = List<CartItem>.from(itemsNotifier.value)
      ..removeWhere((item) => item.id == id);
    itemsNotifier.value = list;
  }

  static double get total =>
      itemsNotifier.value.fold(0.0, (sum, item) => sum + item.subtotal);

  static void clearCart() {
    itemsNotifier.value = [];
  }
}
