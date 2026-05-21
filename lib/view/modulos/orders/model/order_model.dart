class OrderModel {
  final String id;
  final List<OrderItemModel> items;
  final double total;
  final String status;
  final DateTime createdAt;

  OrderModel({
    required this.id,
    required this.items,
    required this.total,
    required this.status,
    required this.createdAt,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['_id'],
      items: (json['items'] as List)
          .map((e) => OrderItemModel.fromJson(e))
          .toList(),
      total: (json['total'] as num).toDouble(),
      status: json['status'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}

class OrderItemModel {
  final String nombre;
  final double precio;
  final int quantity;
  final double subtotal;

  OrderItemModel({
    required this.nombre,
    required this.precio,
    required this.quantity,
    required this.subtotal,
  });

  factory OrderItemModel.fromJson(Map<String, dynamic> json) {
    return OrderItemModel(
      nombre: json['nombre'],
      precio: (json['precio'] as num).toDouble(),
      quantity: json['quantity'],
      subtotal: (json['subtotal'] as num).toDouble(),
    );
  }
}