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

  /// JSON → OBJETO
  factory ProductModel.fromJson(
    Map<String, dynamic> json,
  ) {

    return ProductModel(

      // ID DE MONGODB
      id: json['_id']?.toString() ?? '',

      sku: json['sku']?.toString() ?? '',

      nombre: json['nombre']?.toString() ?? '',

      descripcion:
          json['descripcion']?.toString() ?? '',

      precio:
          (json['precio'] ?? 0).toDouble(),

      stock: json['stock'] ?? 0,

      category:
          json['category']?.toString() ?? '',

      image:
          json['image']?.toString() ?? '',

      estaActivo:
          json['estaActivo'] ?? true,
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