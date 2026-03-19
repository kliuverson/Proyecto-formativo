import 'package:ferremateriales/view/modulos/productos/model/product.dart';

class ProductService {
  /// 🔹 MOCK (para desarrollo)
  static List<ProductModel> getStaticProducts() {
    return [
      ProductModel(
        sku: "1",
        nombre: "Taladro Bosch",
        descripcion: "Taladro potente para uso profesional",
        precio: 250000,
        stock: 10,
        category: "Electricidad",
        image: "",
        estaActivo: true,
      ),
    ];
  }

  /// 🔹 FUTURO: BACKEND
  static Future<List<ProductModel>> getProducts() async {
    try {
      // CUANDO CONECTES BACKEND SOLO CAMBIAS ESTO
      // final response = await http.get(Uri.parse("http://tu-api/productos"));

      // final data = jsonDecode(response.body);

      // return List<Product>.from(
      //   data.map((item) => Product.fromJson(item))
      // );

      /// POR AHORA:
      await Future.delayed(const Duration(seconds: 1));
      return getStaticProducts();
    } catch (e) {
      return getStaticProducts();
    }
  }

  /// 🔹 FILTRAR POR CATEGORÍA (BACKEND READY)
  static Future<List<ProductModel>> getProductsByCategory(
    String category,
  ) async {
    try {
      final products = await getProducts();

      return products.where((product) {
        return product.category == category;
      }).toList();
    } catch (e) {
      return [];
    }
  }
}
