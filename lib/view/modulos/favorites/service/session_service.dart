import 'package:flutter/foundation.dart';
import 'package:ferremateriales/view/modulos/productos/model/product.dart';

class SessionService {
  static final Map<String, ValueNotifier<List<Product>>> _sessions = {};

  static ValueNotifier<List<Product>> _notifierFor(String name) {
    if (!_sessions.containsKey(name)) {
      _sessions[name] = ValueNotifier<List<Product>>([]);
    }
    return _sessions[name]!;
  }

  static List<Product> getItems(String name) =>
      List.unmodifiable(_notifierFor(name).value);

  static void addToSession(String name, Product product) {
    final notifier = _notifierFor(name);
    final list = List<Product>.from(notifier.value);
    if (!list.any((p) => p.id == product.id)) {
      list.add(product);
      notifier.value = list;
    }
  }

  static void removeFromSessionById(String name, String id) {
    final notifier = _notifierFor(name);
    final list = List<Product>.from(notifier.value)
      ..removeWhere((p) => p.id == id);
    notifier.value = list;
  }

  static ValueNotifier<List<Product>> notifier(String name) =>
      _notifierFor(name);
}
