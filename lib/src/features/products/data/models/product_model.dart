import '../../domain/entities/product.dart';

class ProductModel extends Product {
  ProductModel({required String id, required String name, required String description, required double price})
      : super(id: id, name: name, description: description, price: price);

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json['id'] as String,
        name: json['name'] as String,
        description: json['description'] as String,
        price: (json['price'] as num).toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'price': price,
      };
}
