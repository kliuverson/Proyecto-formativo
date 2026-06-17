class ProductModel {

  final String id;
  final String sku;
  final String nombre;
  final String nombreEn;
  final String descripcion;
  final String descripcionEn;
  final double precio;
  final int stock;
  final String category;
  final String image;
  final bool estaActivo;

  ProductModel({
    required this.id,
    required this.sku,
    required this.nombre,
    this.nombreEn = '',
    required this.descripcion,
    this.descripcionEn = '',
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

      nombreEn: json['nombre_en'] ?? '',

      descripcion: json['descripcion'] ?? '',

      descripcionEn: json['descripcion_en'] ?? '',

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

      'nombre_en': nombreEn,

      'descripcion': descripcion,

      'descripcion_en': descripcionEn,

      'precio': precio,

      'stock': stock,

      'category': category,

      'image': image,

      'estaActivo': estaActivo,
    };
  }
}