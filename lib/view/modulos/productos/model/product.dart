class ProductModel {

  final String id;
  final String sku;
  final String nombre;
  final String descripcion;
  final double precio;
  final int stock;
  final String category;
  final String image;
  final bool estaActivo;

  ProductModel({
    required this.id,
    required this.sku,
    required this.nombre,
    required this.descripcion,
    required this.precio,
    required this.stock,
    required this.category,
    required this.image,
    required this.estaActivo,
  });

  /// CONVERTIR JSON → OBJETO
  factory ProductModel.fromJson(Map<String, dynamic> json) {

    return ProductModel(
      id: json['_id'], // 🔥 IMPORTANTE

      sku: json['sku'],

      nombre: json['nombre'],

      descripcion: json['descripcion'] ?? '',

      precio: (json['precio'] as num).toDouble(),

      stock: json['stock'] ?? 0,

      category: json['category'] ?? '',

      image: json['image'],

      estaActivo: json['estaActivo'] ?? true,
    );
  }

  /// OBJETO → JSON
  Map<String, dynamic> toJson() {
    return {

      '_id': id,

      'sku': sku,

      'nombre': nombre,

      'descripcion': descripcion,

      'precio': precio,

      'stock': stock,

      'category': category,

      'image': image,

      'estaActivo': estaActivo,
    };
  }
}