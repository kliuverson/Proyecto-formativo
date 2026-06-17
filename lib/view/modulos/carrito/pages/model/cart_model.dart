import 'package:hive/hive.dart';

part 'cart_model.g.dart';

@HiveType(typeId: 1)
class CartItem {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final int quantity;

  @HiveField(3)
  final double price;

  @HiveField(4)
  final String nameEn;

  CartItem({
    required this.id,
    required this.name,
    required this.quantity,
    required this.price,
    this.nameEn = '',
  });

  double get subtotal => price * quantity;

  CartItem copyWith({
    String? id,
    String? name,
    int? quantity,
    double? price,
    String? nameEn,
  }) {
    return CartItem(
      id: id ?? this.id,
      name: name ?? this.name,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
      nameEn: nameEn ?? this.nameEn,
    );
  }
}